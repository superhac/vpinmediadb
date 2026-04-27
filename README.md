# VPinMediaDB
The VPX Media Database contains the media files for the table, bg, dmd and wheel images.  All media files are tied to the [VPSDB ID](https://virtualpinballspreadsheet.github.io). A file name `vpinmdb.json` contains a list of all images, resolution and their url.

## Layout Example
```
  "0-GeiE03": {
    "1k": {
      "bg": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/0-GeiE03/1k/bg.png",
      "bg_md5": "79a072394a240c1e65cbb4031743105e",
      "dmd": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/0-GeiE03/1k/dmd.png",
      "dmd_md5": "d9186f44b801ebedabcdd778596dec9d",
      "table": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/0-GeiE03/1k/table.png",
      "table_md5": "e3c7474956c5832852db9c2a67b2a1b0",
      "fss": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/0-GeiE03/1k/fss.png",
      "fss_md5": "dab5e48a85aae8027847a02208ad96c0",
      "table_video": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/0-GeiE03/1k/table.mp4",
      "table_video_md5": "360c161e8eaacbea06e4a8c81f94eb6c"
    },
    "4k": {
      "table": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/0-GeiE03/4k/table.png",
      "table_md5": "d8cb779ee93be519880f462101d75071",
      "fss": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/0-GeiE03/4k/fss.png",
      "fss_md5": "7074da3e7af0e90720e4a8aeb4b67994"
    },
    "wheel": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/0-GeiE03/wheel.png",
    "wheel_md5": "0c3d03e039ec8d502ffadb1c10b66ab4",
    "cab": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/0-GeiE03/cab.png",
    "cab_md5": "b70d64ec874180bbad391553c5bdebe8",
    "flyer": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/0-GeiE03/flyer.png",
    "flyer_md5": "1e25c7ab9e8bb680465adb5d539cfda9",
    "realdmd": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/0-GeiE03/realdmd.png",
    "realdmd_md5": "00acc86bcf9c2ad73afa4a924f4367e3",
    "audio": "https://github.com/superhac/vpinmediadb/raw/refs/heads/main/0-GeiE03/audio.mp3",
    "audio_md5": "4c0e754900488ae6e67b4e7407c70f63",
    "version": "ada009d7f5e5eb1927313a49c6956b17"
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
| audio.mp3           | tables audio       |

## Acknowledgments 

Special thanks to @jsm174 for making dream of running VPX on Linux a reality.  

A big thank you to all the hard work and dedication the [VPS Team](https://virtualpinballspreadsheet.github.io) team (@Dux, @Fraesh and @Studlygoorite) has put into creating this great table finding resource!  And they made it "open" so others can leverage it as they want.  
