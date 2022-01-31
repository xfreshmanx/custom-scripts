Create or edit `~/.config/fontconfig/conf.d/20-no-embedded.conf`  
Note: Add the sub directory conf.d and create the file 20-no-embedded.conf in there.  

Add these rows to the file 20-no-embedded.conf :  

```
<match target="font">
  <test qual="any" name="family">
    <string>Calibri</string>
  </test>
  <edit name="embeddedbitmap">
    <bool>false</bool>
  </edit>
</match>
```
Restart your session and enjoy better looking content.
