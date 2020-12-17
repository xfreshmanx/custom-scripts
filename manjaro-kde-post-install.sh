
#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__|
#  Manjaro Kde Post Install Setup and Config
#-------------------------------------------------------------------------


echo
echo "INSTALLING SOFTWARE"
echo

PKGS=(

    # SYSTEM --------------------------------------------------------------
    'base-devel'
    'yay'

    # TERMINAL UTILITIES --------------------------------------------------


    'bleachbit'             # File deletion utility
    'curl'                  # Remote content retrieval
    'gufw'                  # Firewall manager
    'htop'                  # Process viewer
    'ncdu'                  # File size detector
    'neofetch'              # Shows system info when you launch terminal
    'ranger'                # File Browser
    'rsync'                 # Remote file sync utility
    'trash-cli'             # Delete trash from terminal
    'unrar'                 # RAR compression program
    'unzip'                 # Zip compression program
    'vim'                   # Editor
    'wget'                  # Remote content retrieval
    'zip'                   # Zip compression program
    'zsh'                   # ZSH shell
    'zsh-completions'       # Tab completion for ZSH

    # DISK UTILITIES ------------------------------------------------------

    'gparted'               # Disk utility
    'gnome-disks'           # Disk utility
    'ntfs-3g'               # Open source implementation of NTFS file system

    # GENERAL UTILITIES ---------------------------------------------------

    'veracrypt'             # Disc encryption utility

    # DEVELOPMENT ---------------------------------------------------------

    'git'                   # Version control system


    # WEB TOOLS -----------------------------------------------------------

    'brave'              # Brave Web browser


    # COMMUNICATIONS ------------------------------------------------------


    # MEDIA ---------------------------------------------------------------

    'vlc'                   # Video player
    'smplayer'              # Video player
    'smplayer-skins'
    'smplayer-themes'
    'youtube-dl'            # Youtube Downloader
    
    'gstreamer-vaapi'       # gstreamer
    'gst-plugins-bad'
    'gst-plugins-good'

    # GRAPHICS AND DESIGN -------------------------------------------------


    # PRODUCTIVITY --------------------------------------------------------

    'leafpad'              # simple text editor

    # VIRTUALIZATION ------------------------------------------------------

    # Gaming ------------------------------------------------------

    'lutris'
    'wine'
    'wine-gecko'
    'wine-mono'
    'winetricks'
    'gamemode'
    'lib32-gamemode'
    
    # Others ------------------------------------------------------
    'intel-gpu-tools'
    'kdialog'
    
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo
