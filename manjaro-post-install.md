1. Change Mirror

2. Update

   ```
   sudo pacman -Syu
   ```
  
3. Install needed packages from manjaro-kde-post-install.sh

4. Zsh configeration
   ```
   which $SHELL
   sudo pacman -S zsh zsh-completions
   zsh
   autoload -Uz zsh-newuser-install
   zsh-newuser-install -f
   ```
   
   ```
   vim .zshrc                             # add below 2 lines in the end
   autoload -Uz promptinit                    
   promptinit
   source .zshrc
   sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
   git clone https://github.com/zdharma/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
   ```
   ```
   vim .zshrc                            # add below lines to plugin
   
   git
   z
   sudo
   archlinux
   zsh-syntax-highlighting
   zsh-autosuggestions
   colored-man-pages
   command-not-found
   #fast-syntax-highlighting

   
   source .zshrc
   ```
   
   ```
   mkdir -p ~/Downloads/MesloLGS && wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P ~/Downloads/MesloLGS
   
   cd ~/Downloads/
   sudo cp -r MesloLGS /usr/share/fonts/
   fc-cache
   ```
   
   ```
   git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k                    
   vim .zshrc
   ZSH_THEME="powerlevel10k/powerlevel10k"                              # change theme
   source .zshrc
   git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull                              # check update powerlevel10k
   ```
   
5. Hardware acceleration of firefox, chromium, mpv
   ```
   sudo pacman -S libva-intel-driver nvidia-utils libvdpau-va-gl libva-utils vdpauinfo
   yay -S libva-vdpau-driver-chromium                               # chromium on nvidia
   mpv --hwdec=auto https://www.youtube.com/watch?v=MQcXEWPesAw                            # test
   vainfo
   sudo vim /etc/environment
   # Intel
   LIBVA_DRIVER_NAME=i965
   VDPAU_DRIVER=va_gl

   # NVIDIA
   #LIBVA_DRIVER_NAME=vdpau
   #VDPAU_DRIVER=nvidia
   ```
   
   Firefox va-api
   [Firefox ArchWiki](https://wiki.archlinux.org/index.php/Firefox#Hardware_video_acceleration)

       Tweaks: Enable WebRender compositor
       about:config  
       gfx.webrender.all -> true  
       media.ffmpeg.vaapi.enabled -> true  
       media.ffvpx.enabled -> false  
       

   - Check if it's on:
   ```
   MOZ_X11_EGL=1 MOZ_LOG="PlatformDecoderModule:5" firefox 2>&1 | grep 'VA-API'
   vainfo --display drm --device /dev/dri/renderD128
   ```
   
   If you see error:
   add "i915" module in /etc/mkinitcpio.conf
   ```
   sudo vim /etc/mkinitcpio.conf
   MODULE = "i915"
   ```
   ```
   sudo mkinitcpio -P
   ```
   
   enhanced-h264ify add-on firefox
   [enhanced-h264ify firefox](https://addons.mozilla.org/en-US/firefox/addon/enhanced-h264ify)
   
   verify gstreamer plugin
   ```
   gst-inspect-1.0 vaapi
   gst-inspect-1.0 vdpau
   ```
   ```
   env MOZ_X11_EGL=1                              # add this flag in firefox launcher
   ```
   
   chromium-vaapi
   [Chromium ArchWiki](https://wiki.archlinux.org/index.php/chromium#Hardware_video_acceleration)
   
   ```
   vim ~/.config/chromium-flags.conf
   --ignore-gpu-blocklist 
   --use-gl=desktop 
   --enable-gpu-rasterization 
   --enable-oop-rasterization 
   --gpu-rasterization-msaa-sample-count=0 
   --enable-zero-copy 
   --force-dark-mode 
   --enable-features=WebUIDarkMode 
   --enable-accelerated-video-decode 
   --disable-gpu-driver-bug-workarounds 
   --disable-smooth-scrolling 
   ```  
   check hw acceleration usage
   ```  
   intel_gpu_top                             
   nvidia-smi -q | grep Decoder 
   watch -n 1 'nvidia-smi -q | grep Decoder'
   ```
    
   check on chrome
   ```
   chrome://gpu
   chrome://media-internals
   ```
   
   enhanced-h264ify add-on chromium
   [enhanced-h264ify chromium](https://chrome.google.com/webstore/detail/enhanced-h264ify/omkfmpieigblcllmkgbflkikinpkodlk)
    
6. Swapfile 4G 
   [Manjaro Swapfile](https://wiki.manjaro.org/index.php/Swap#Using_a_Swapfile)
   First create and intialize the file to hold the swap. For example, to create a 4GB swapfile, you could use the command:
   ```
   sudo fallocate -l 4G /swapfile
   sudo mkswap /swapfile
   ```
   Set the appropriate permissions on the file. It should be readable and writable only by root. This can be done with the command: 
   ```
   sudo chmod u=rw,go= /swapfile
   ```
   Next we need to enable the swapfile with the swapon command. Following our example above this could be done with: 
   ```
   sudo swapon /swapfile
   ```
   In order to ensure that the swap is enabled at boot we can add an entry to /etc/fstab. You can add the line to ftab manually or using the command: 
   ```
   sudo bash -c "echo /swapfile none swap defaults 0 0 >> /etc/fstab"
   ```
   
   ```
   findmnt -no UUID -T /swapfile
   sudo filefrag -v /swapfile | awk '{ if($1=="0:"){print $4} }'
   sudo vim /etc/default/grub
   resume=UUID=your_UUID resume_offset=your_offset # add this
   sudo update-grub
   sudo vim /etc/mkinitcpio.conf
   resume -> HOOKS                              # add resume in HOOKS
   sudo mkinitcpio -P  
   ```
   
7. Smplayer: Advance -> mpv ->  ```--no-osd-bar```
8. Optimus Manager:
   (Video Tutorial)[https://www.youtube.com/watch?v=RZdWVntmvI8]
   (Optimus Manager)[https://github.com/Askannz/optimus-manager]
   
   ```
   sudo pacman -S yay
   yay -Syu
   yay -S nvidia
   yay -S base-devel
   yay -S optimus-manager optimus-manager-qt
   sudo systemctl enable optimus-manager
   ```
   
9. Xrandr setup
   ```
   $ sudo vim /usr/share/sddm/scripts/Xsetup
   
   #!/bin/sh
   # Xsetup - run as root before the login dialog appears
   xrandr --output eDP-1-1 --mode 1366x768 --pos 0x0 --rotate normal --output VGA-1-1 --mode 1600x900 --pos 1366x0 --rotate normal
   
   ```
   ```
   sudo vim /etc/sddm.conf
   [XDisplay]
   # Xsetup script path
   # A script to execute when starting the display server
   DisplayCommand=/usr/share/sddm/scripts/Xsetup
   ```

10. Lutris 
   go preference
   enable -> Disable desktop effects
   enable -> feral gamemode

   Environment variables:
   ```
   MANGOHUD=1
   __GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1
   ```

   Command Prefix:
   ```
   gamemoderun DXVK_HUD=60
   ```
   
11. POP Os theme Gnome Manjaro/Arch
   ```
   yay -S  pop-theme
   OR
   Yay -S pop-gtk-theme-bin pop-icon-theme-git pop-sound-theme-bin ttf-fira-sans ttf-fira-mono ttf-roboto-slab pop-gnome-shell-theme-bin 
   sudo pacman -S gnome-shell-extension-pop-shell
   ```

12. Set Banglad fonts to Nirmala UI
   ```
   ~/.config/fontconfig/conf.d/50-custom-bangla.conf
   ```
   ```
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
<!-- Bangla (bn) -->
<match target="font">
        <test name="lang" compare="contains">
                <string>bn</string>
        </test>
        <alias>
                <family>sans-serif</family>
                <prefer>
                        <family>Nirmala UI</family>
                </prefer>
        </alias>
</match>

<match target="font">
        <test name="lang" compare="contains">
                <string>bn</string>
        </test>
        <alias>
                <family>serif</family>
                <prefer>
                        <family>Nirmala UI</family>
                </prefer>
        </alias>
</match>
<!-- Bangla (bn) ends -->
</fontconfig>
```
   ```
   $ fc-cache
   $ LANG=bd_BD fc-match   
   ```
  
13. conda autocompletions
   ```
   git clone https://github.com/esc/conda-zsh-completion ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/conda-zsh-completion
   vim .zshrc
   plugins -> conda-zsh-completion                          # add plugins
   source .zshrc
   ```
 
14. Mount in ext4/btrfs/ntfs
   ```
   # ext4
   # check users group 
   awk -F':' '/users/{print $4}' /etc/group 
   # Check UUID- 
   sudo blkid 
   
   sudo vim /etc/fstab 
   # UUID=4208875b-ffea-4376-afd8-b0bbd6bcb0e3    /run/media/pulsar/LocalDisk    ext4    auto,users,exec    0    0
   grep -i --color 'users' /etc/group
   # add user to group users 
   sudo usermod -a -G users pulsar 
   
   #check 
   awk -F':' '/users/{print $4}' /etc/group 
   sudo mkdir -p /run/media/pulsar/LocalDisk 
   sudo chown pulsar:users -R /run/media/pulsar/LocalDisk 
   ```
   ```
   # Btrfs
   check ‘users’ group 
   $ awk -F':' '/users/{print $4}' /etc/group 

   # if user doesn’t exist to users group add user to ‘users’ group 
   $ sudo usermod -a -G users pulsar 

   # if ‘users’ group doesn’t exist create it and check again. 
   # Check UUID of the drive- 
   $ sudo blkid 
   # add mount location if doesn’t exist. I will mount in /run/media/user_name/LocalDisk. Since this is the Manjaro’s default mount location. 
   # create folder if doesn’t exist. example- 
   $ sudo mkdir /run/media/user_name 
   $ sudo mkdir /run/media/user_name/LocalDisk 

   # give permission to user for this folder 
   $ sudo chown user_name:users -R /run/media/user_name/LocalDisk 

   # add drive to fstab to autologin in startup 
   $ sudo vim /etc/fstab 

   # add this line at the end. 
   $ UUID=YOUR_UUID /run/media/user_name/LocalDisk btrfs auto,users,exec 0 0 

   # Chekckout what this flags does in here. 
   # NOTE: Same steps can be taken to mount ext4 as user. Edit btrfs to ext4 in fstab. 
   ```
   ```
   # NTFS
   $ sudo blkid
   $ sudo vim /etc/fstab
   $ UUID=xxx /media/my_label ntfs-3g defaults,auto,uid=1000,gid=1000,umask=002 0 0
   ```
  
15. Keyserver manjaro/arch 
    ```
    $ vim ~/.gnupg/gpg.conf
    no-greeting  
    no-permission-warning  
    lock-never  
 
    keyserver hkps://keyserver.ubuntu.com  
    #keyserver pool.sks-keyservers.net  
    keyserver-options timeout=10  
    keyserver-options import-clean  
    keyserver-options no-self-sigs-only 
    ```

16. Edit fat32/ext4 label
   ```
   sudo pacman -S mtools
   lsblk
   sudo mlabel -i /dev/sde1 ::Fat32_NewName 
   ```
   ```
   lsblk
   sudo e2label /dev/device new-label-name-here
   ```
 
17. Add .desktop icon in plasma

Home 
```
[Desktop Entry] 
URL[$e]=$HOME 
GenericName=Home Folder 
Icon=user-home 
Name[en_US]=Home 
Name=Home 
Type=Link  
```  
Trash
``` 
[Desktop Entry] 
Name=Trash 
Comment=Contains removed files 
Icon=user-trash-full 
EmptyIcon=user-trash 
Type=Link 
URL=trash:/ 
OnlyShowIn=KDE     
```

18. Firefox Settings
```
about:config
widget.use-xdg-desktop-portal = true                              # For KDE picker 
browser.newtabpage.activity-stream.logowordmark.alwaysVisible = true
```
   

   
   
     
     
     
     
     
     
     


