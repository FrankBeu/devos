{ config
, nixosConfig
, ...
}:
let
  inherit (config.home) username homeDirectory;

  testRepoPath = "${homeDirectory}/TEST";
  testPassPath = "kopia/TEST";

in
{
  systemd.user.tmpfiles.rules = [
    "d ${homeDirectory}/test 755 ${username} users"
    "d ${homeDirectory}/TEST 755 ${username} users"
  ] ;


  services.kopia = let
    testSnapshotDirs = map (dir: homeDirectory + "/" + dir) ["test"];
  in
  {
    enable = true;
    jobs = {
      TEST = {
        timer = {
          OnCalendar         = "18:00";
          RandomizedDelaySec = "1h";
        };
        repoPath    = testRepoPath;
        ### TODO check why nixosConfig does not contain the following:
        # envFilePath = nixosConfig.sops.secrets."${testPassPath}/environmentFile".path;
        envFilePath = "/run/secrets/${testPassPath}/environmentFile";
        snapshots   = testSnapshotDirs;
      };
    };
  };
}
