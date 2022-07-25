# default.nix
#
# Default packages I like to have available at my fingertips.
#
# To install NixOS, run this:
#
#     bash <(curl https://nixos.org/nix/install)
#
# To install these, run something like:
#
#     nix-env -f default.nix -i --remove-all
#
# (The "--remove-all" flag removes packages that were installed
# previously; this is good if we want to remove packages from here.)



# The following has been an attempt to adapt
#
#     https://www.nmattia.com/posts/2018-03-21-nix-reproducible-setup-linux-macos.html
####let
####  #pkgs = with import <nixpkgs> {};
####
####  ### Things I wish to configure (eventually)
####  # bashrc = ...;
####  # git = ...;
####  # tmux = ...;
####  # vim = ...;
####  # emacs = ...;
####  # mysql = ...;
####  # etc...
####
####  #friendlies = with pkgs;
####  friendlies = with import <nixpkgs>;
####    [
####      # Customizable packages
####      ##git
####      ##tmux
####      ##vim
####      ##emacs
####
####      # Sourced directly from Nixpkgs
####      # but should be customized
####      pkgs.tmux
####      pkgs.vim
####      pkgs.emacs
####      pkgs.git
####
####      # Sourced directly from Nixpkgs
####      pkgs.ag
####      pkgs.grcat
####      pkgs.htop
####      pkgs.diff-so-fancy
####      pkgs.tldr
####      pkgs.tree
####      pkgs.bat
####      pkgs.exa
####
####      pkgs.watch
####      pkgs.pv
####    ];
####in friendlies



##### The following is an attempt to adapt
#####
#####     https://hugoreeves.com/posts/2019/nix-home/
####{ config, pkgs, ... };
####
####{
####  home.packages = with packages;
####    [
####      # Customizable packages
####      ##git
####      ##tmux
####      ##vim
####      ##emacs
####
####      # Sourced directly from Nixpkgs
####      # but should be customized
####      tmux
####      vim
####      emacs
####      git
####
####      # Sourced directly from Nixpkgs
####      ag
####      grcat
####      htop
####      diff-so-fancy
####      tldr
####      tree
####      bat
####      exa
####
####      watch
####      pv
####    ];
####}


##### The following is an attempt to just adapt a default.nix
##### from a project file.  Crossing my fingers and hoping for the best!
#####
##### This seems to build almost correcty, but doesn't leave things in a usable state.
####with import <nixpkgs> {};
####
####stdenv.mkDerivation rec {
####  name = "home-utilities";
####
####  env = buildEnv { name = name; paths = buildInputs; };
####
####  # Note that Nix has an elegant way to handle the "Python37Packages"
####  # prefix, but it will take some time coming to terms with Nix syntax
####  # to take advantage of it.
####  buildInputs = [
####    # Customizable packages
####    ##git
####    ##tmux
####    ##vim
####    ##emacs
####
####    # Sourced directly from Nixpkgs
####    # but should be customized
####    tmux
####    vim
####    emacs
####    git
####
####    # Sourced directly from Nixpkgs
####    ag
####    grc
####    htop
####    #diff-so-fancy
####    tldr
####    tree
####    bat
####    exa
####
####    watch
####    pv
####  ];
####}

##### Now I'm going to try this:
#####
#####     https://discourse.nixos.org/t/declarative-package-management-for-normal-users/1823/5
#####
##### And then run
#####
#####     nix-env -irf ~/.config/nixpkgs/packages.nix
####{ pkgs ? import <nixos> {} }:
####
####with pkgs; {
####  # Customizable packages
####  ##git
####  ##tmux
####  ##vim
####  ##emacs
####
####  # Sourced directly from Nixpkgs
####  # but should be customized
####  tmux
####  vim
####  emacs
####  git
####
####  # Sourced directly from Nixpkgs
####  #ag
####  silver-searcher
####  grc
####  htop
####  #diff-so-fancy
####  tldr
####  tree
####  bat
####  exa
####
####  watch
####  pv
####}

# Now I'm going to try this, put in the file "~/.config/nixpkgs/config.nix":
#
#     https://nixos.org/nixpkgs/manual/#sec-declarative-package-management
#
# And then try to run this:
#
#     nix-env -iA nixpkgs.myPackages
#
# Ok, that works!  I now need to create the symbolic links for config.nix...
{
  packageOverrides = pkgs: with pkgs; {
    #myProfile = writeText "my-profile" ''
    #  export PATH=$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/sbin:/bin:/usr/sbin:/usr/bin
    #  export MANPATH=$HOME/.nix-profile/share/man:/nix/var/nix/profiles/default/share/man:/usr/share/man
    #  export INFOPATH=$HOME/.nix-profile/share/info:/nix/var/nix/profiles/default/share/info:/usr/share/info
    #'';

    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
        #(runCommand "profile" {} ''
        #  mkdir -p $out/etc/profile.d
        #  cp ${myProfile} $out/etc/profile.d/my-profile.sh
        #'')

        # Customizable packages
        ##git
        ##tmux
        ##vim
        ##emacs

        # Sourced directly from Nixpkgs
        # but should be customized
        tmux
        vim
        emacs
        git

        # Sourced directly from Nixpkgs
        #ag
        silver-searcher
        grc
        htop
        #diff-so-fancy
        tldr
        tree
        bat
        exa

        watch
        pv
        tetex

        #obs-studio   # Maybe installed via apt
        #font-manager
      ];
      pathsToLink = [ "/share/man" "/share/doc" "/bin" ];
      extraOutputsToInstall = [ "man" "doc" ];
    };
  };
}


