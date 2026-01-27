# VPinMediaDB
The VPX Media Database contains the media files for the table, bg, dmd and wheel images.  All media files are tied to the [VPSDB ID](https://virtualpinballspreadsheet.github.io). A file name `vpinmdb.json` contains a list of all images, resolution and their url.

## Layout Example
```
 "025ojqP4": {
    "1k": {
      "bg": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/025ojqP4/1k/bg.png",
      "bg_md5": "740e56de50529e2b1e15a51b0c270e64",
      "dmd": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/025ojqP4/1k/dmd.png",
      "dmd_md5": "02cb0d669052292c7070b2d954b67a4b",
      "table": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/025ojqP4/1k/table.png",
      "table_md5": "91cf9a51a3ff857026126ef002d3247a",
      "fss": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/025ojqP4/1k/fss.png",
      "fss_md5": "8ac63ef05374a5e29a7667894ef4a674"
    }
```
The MD5 hash is used to determine if the image has changed since the last update.

| Filename | Description                   |
| ---------           | ------------------ |
| bg.png              | Backglass          |
| dmd.png             | DMD                |
| fss.png             | Full Single Screen |
| wheel.png           | Wheel              |
| cab.png             | Pinball cab        |
| realdmd.png         | Real DMD Frame     |
| realdmd-color.png   | Real DMD Frame Colorized version        |

## Acknowledgments 

Special thanks to @jsm174 for making dream of running VPX on Linux a reality.  

A big thank you to all the hard work and dedication the [VPS Team](https://virtualpinballspreadsheet.github.io) team (@Dux, @Fraesh and @Studlygoorite) has put into creating this great table finding resource!  And they made it "open" so others can leverage it as they want.  
