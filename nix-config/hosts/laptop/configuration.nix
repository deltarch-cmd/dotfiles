{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  networking.hostName = "lifebone"; # Define your hostname.

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "es";
    variant = "winkeys";
  };

  # Configure console keymap
  console.keyMap = "es";

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Nvidia Fun
  ## Enable OpenGL
  hardware.graphics.enable = true;

  ## Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];

  hardware.nvidia = {
    # Modesetting is required
    modesetting.enable = true;

    # Nvidia power management
    # Experimental, can cause sleep/suspend to fail
    # Enable if you have graphical corruption issues or application chrashes after
    # waking up from sleep

    powerManagement.enable = true;
    powerManagement.finegrained = true; # Turns off GPU when not in use

    # Use the NVIDIA open source kernel module (not the Nouveau driver)
    # Support is limited to the Turing and later architectures
    ## https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    open = true;

    # Enable Nvidia settings menu with "nvidia-settings"
    nvidiaSettings = true;

    # You may select the appropriate driver version for your specific GPU
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.nvidia.prime = {
    offload.enable = true;
    offload.enableOffloadCmd = true;

    # Get the values with "lspci" from the "pciutils" package
    ## $ nix shell nixpkgs#pciutils -c lspci -D -d ::003xx
    # intelBusId = "PCI:0:2:0";
      amdgpuBusId = "PCI:5@0:0:0";
      nvidiaBusId = "PCI:1@0:0:0";
  };
}
