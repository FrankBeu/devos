{ ... }:
# recommend using `hashedPassword`
{
  ### TODO use sops
  users.users.root.password = "root";
  # users.users.root.password = "";
}
