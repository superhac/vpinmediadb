# VPinMediaDB
The VPX Media Database contains the media files for the table, bg, dmd and wheel images.  All media files are tied to the [VPSDB ID](https://virtualpinballspreadsheet.github.io). A file name `vpinmdb.json` contains a list of all images, resolution and their url.

## Layout
```
{VPS_ID}/
├── 1k
│   ├── bg.png
│   ├── dmd.png
│   └── fss.png
├── 4k
│   ├── fss.png
│   └── table.png
└── wheel.png
└── cab.png
```

| Filename | Description         |
| --------- | ------------------ |
| bg.png    | Backglass          |
| dmd.png   | DMD                |
| fss.png   | Full Single Screen |
| wheel.png | Wheel              |
| cab.png   | Pinball cab        |

## Acknowledgments 

Special thanks to @jsm174 for making dream of running VPX on Linux a reality.  

A big thank you to all the hard work and dedication the [VPS Team](https://virtualpinballspreadsheet.github.io) team (@Dux, @Fraesh and @Studlygoorite) has put into creating this great table finding resource!  And they made it "open" so others can leverage it as they want.  
