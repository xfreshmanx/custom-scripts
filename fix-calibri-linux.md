https://stefan.angrick.me/fix-rendering-of-microsoft-calibri-and-cambria-fonts-on-linux?utm_source=pocket_mylist

```
~/.config/fontconfig/fonts.conf
```

```
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <match target="font">
    <edit name="embeddedbitmap" mode="assign">
      <bool>false</bool>
    </edit>
  </match>
</fontconfig>
```
