#!/bin/bash

destdir=$1

if [ -z "$destdir" ]; then
   export destdir=/tmp/virtualmoon
fi

echo Install virtualmoon to $destdir

install -m 755 -d $destdir
install -m 755 -d $destdir/bin
install -m 755 -d $destdir/lib
install -m 755 -d $destdir/share
install -m 755 -d $destdir/share/applications
install -m 755 -d $destdir/share/doc
install -m 755 -d $destdir/share/doc/virtualmoon
install -m 755 -d $destdir/share/pixmaps
install -v -m 755 -s virtualmoon/atlun  $destdir/bin/atlun
install -v -m 755 -s datlun/datlun  $destdir/bin/datlun
install -v -m 755 -s photlun/photlun  $destdir/bin/photlun
install -v -m 644 -s virtualmoon/library/plan404/libplan404.so  $destdir/lib/libplan404.so
install -v -m 644 Installer/Linux/vmapro/share/applications/virtualmoon.desktop $destdir/share/applications/virtualmoon.desktop
install -v -m 644 Installer/Linux/vmapro/share/doc/virtualmoon/changelog $destdir/share/doc/virtualmoon/changelog
install -v -m 644 Installer/Linux/vmapro/share/doc/virtualmoon/copyright $destdir/share/doc/virtualmoon/copyright
install -v -m 644 Installer/Linux/vmapro/share/pixmaps/virtualmoon.xpm $destdir/share/pixmaps/virtualmoon.xpm

install -m 755 -d $destdir/share/virtualmoon
install -m 755 -d $destdir/share/virtualmoon/data
install -m 755 -d $destdir/share/virtualmoon/data/jpleph
install -m 755 -d $destdir/share/virtualmoon/language
install -m 755 -d "$destdir/share/virtualmoon/My Images"
install -m 755 -d $destdir/share/virtualmoon/Database
install -m 755 -d $destdir/share/virtualmoon/doc
install -m 755 -d $destdir/share/virtualmoon/Encyclopedia
install -m 755 -d $destdir/share/virtualmoon/Textures
install -m 755 -d $destdir/share/virtualmoon/Textures/Airbrush
install -m 755 -d $destdir/share/virtualmoon/Textures/Airbrush/L1
install -m 755 -d $destdir/share/virtualmoon/Textures/Bumpmap
install -m 755 -d $destdir/share/virtualmoon/Textures/Overlay
install -m 755 -d $destdir/share/virtualmoon/Textures/Overlay/caption
install -v -m 644 virtualmoon/language/maplun.en.po $destdir/share/virtualmoon/language/
install -v -m 644 virtualmoon/language/maplun.fr.po $destdir/share/virtualmoon/language/
install -v -m 644 datlun/language/datlun.en.po $destdir/share/virtualmoon/language/
install -v -m 644 datlun/language/datlun.fr.po $destdir/share/virtualmoon/language/
install -v -m 644 datlun/language/vmadatabase.en.po $destdir/share/virtualmoon/language/
install -v -m 644 datlun/language/vmadatabase.fr.po $destdir/share/virtualmoon/language/
install -v -m 644 photlun/language/photlun.en.po $destdir/share/virtualmoon/language/
install -v -m 644 photlun/language/photlun.fr.po $destdir/share/virtualmoon/language/
install -v -m 644 data/country.tab $destdir/share/virtualmoon/data/
install -v -m 644 data/retic.cur $destdir/share/virtualmoon/data/
install -v -m 644 data/jpleph/unxp1900.421 $destdir/share/virtualmoon/data/jpleph/
install -v -m 644 textures/Airbrush/L1/* $destdir/share/virtualmoon/Textures/Airbrush/L1/
install -v -m 644 textures/Bumpmap/*.jpg $destdir/share/virtualmoon/Textures/Bumpmap/
install -v -m 644 textures/Bumpmap/kaguya.txt $destdir/share/virtualmoon/Textures/Bumpmap/
install -v -m 644 textures/Overlay/*.jpg $destdir/share/virtualmoon/Textures/Overlay/
install -v -m 644 textures/Overlay/caption/*.jpg $destdir/share/virtualmoon/Textures/Overlay/caption/
install -v -m 644 Database/* $destdir/share/virtualmoon/Database/
install -v -m 644 doc/* $destdir/share/virtualmoon/doc/
install -v -m 644 Encyclopedia/* $destdir/share/virtualmoon/Encyclopedia/
