# VPinMediaDB
The VPX Media Database contains the media files for the table, bg, dmd and wheel images.  All media files are tied to the [VPSDB ID](https://virtualpinballspreadsheet.github.io). A file name `vpinmdb.json` contains a list of all images, resolution and their url.

## Layout Example
```
  "0RdFWzVI": {
    "1k": {
      "bg": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/0RdFWzVI/1k/bg.png",
      "bg_md5": "ca21c77a4a34bdec0953f3b1ce2c3e4c",
      "dmd": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/0RdFWzVI/1k/dmd.png",
      "dmd_md5": "a144f467f7b0cc1bb25bc774591e3c7f",
      "table": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/0RdFWzVI/1k/table.png",
      "table_md5": "b4658230c2b4b53b1ceded3d4fcabb48",
      "fss": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/0RdFWzVI/1k/fss.png",
      "fss_md5": "b723cf7d2f4d26903de3f04d4d712e90",
      "table_video": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/0RdFWzVI/1k/table.mp4",
      "table_video_md5": "e6cb5dab72e8785eb857ff4ff4305ca7"
    },
    "4k": {
      "table": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/0RdFWzVI/4k/table.png",
      "table_md5": "79fb99de2da957517304bc4ae1ddf81c",
      "fss": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/0RdFWzVI/4k/fss.png",
      "fss_md5": "1d98386bd1a4555cc306e2465c5958d4"
    },
    "wheel": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/0RdFWzVI/wheel.png",
    "wheel_md5": "59e4e47021fd80d4e8d497ae0f4cecd3",
    "cab": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/0RdFWzVI/cab.png",
    "cab_md5": "79540279e1549906cc4eae0f64d5c330",
    "flyer": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/0RdFWzVI/flyer.png",
    "flyer_md5": "f7b664a38fed726e17a17cd51315585c",
    "version": "aee4874c9b6e96305590b4d661dbd749"
  }
```
The MD5 hash is used to determine if the image has changed since the last update.

| Filename | Description                   |
| ---------           | ------------------ |
| bg.png              | Backglass          |
| dmd.png             | DMD                |
| table.png           | table              |
| fss.png             | Full Single Screen |
| wheel.png           | Wheel              |
| cab.png             | Pinball cab        |
| realdmd.png         | Real DMD Frame     |
| realdmd-color.png   | Real DMD Frame Colorized version        |
| flyer.png           | Flyer              |   
| table.mp4           | Table video        |
| bg.mp4              | bg video           |
| dmd.mp4             | dmd video          |
| audip.mp3           | tables audio       |

## Acknowledgments 

Special thanks to @jsm174 for making dream of running VPX on Linux a reality.  

A big thank you to all the hard work and dedication the [VPS Team](https://virtualpinballspreadsheet.github.io) team (@Dux, @Fraesh and @Studlygoorite) has put into creating this great table finding resource!  And they made it "open" so others can leverage it as they want.  
