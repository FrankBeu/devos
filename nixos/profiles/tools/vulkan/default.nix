{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      vulkan-tools
    ];
  };
}
### TODO doc
### provides vkcube, vulkaninfo
###  to test vulkan
