# {config, variables, ...}:
{config, ...}:

{
  networking = {

    hostName = "ryzen"; ### TODO: variable
    # hostName = variables.hostname;

    nameservers = [
      "8.8.8.8"
      "4.4.4.4"
    ];

    ### The global useDHCP flag is deprecated, therefore explicitly set to false here.
    ### Per-interface useDHCP will be mandatory in the future, so this generated config
    ### replicates the default behaviour.
    useDHCP = false;
    interfaces.enp37s0.useDHCP = true;
    interfaces.wlp36s0.useDHCP = true;

  };
}


