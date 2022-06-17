{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      vulkan-tools
      glxinfo
    ];
  };
}
### TODO doc
### provides vkcube, vulkaninfo
###  to test vulkan
