#!/bin/bash

# install minimal data for the Pro version
# must be installed after the software part

function InstData {
  pkg=$1.tgz
  ddir=$2
  pkgz=BaseData/$pkg
  if [ ! -e $pkgz ]; then
     wget http://sourceforge.net/projects/virtualmoon/files/6-Source_Data/$pkg/download -O $pkgz
  fi
  tar xvzf $pkgz -C $ddir
}

destdir=$1

if [ -z "$destdir" ]; then
   export destdir=/tmp/virtualmoon
fi

echo Install virtualmoon data to $destdir

install -m 755 -d $destdir
install -m 755 -d $destdir/share
install -m 755 -d $destdir/share/virtualmoon

# translation
install -m 755 -d $destdir/share/virtualmoon/language
install -v -m 644 virtualmoon/language/maplun.en.po $destdir/share/virtualmoon/language/
install -v -m 644 virtualmoon/language/maplun.fr.po $destdir/share/virtualmoon/language/
install -v -m 644 datlun/language/datlun.en.po $destdir/share/virtualmoon/language/
install -v -m 644 datlun/language/datlun.fr.po $destdir/share/virtualmoon/language/
install -v -m 644 datlun/language/vmadatabase.en.po $destdir/share/virtualmoon/language/
install -v -m 644 datlun/language/vmadatabase.fr.po $destdir/share/virtualmoon/language/
install -v -m 644 photlun/language/photlun.en.po $destdir/share/virtualmoon/language/
install -v -m 644 photlun/language/photlun.fr.po $destdir/share/virtualmoon/language/
install -v -m 644 weblun/language/weblun.en.po $destdir/share/virtualmoon/language/
install -v -m 644 weblun/language/weblun.fr.po $destdir/share/virtualmoon/language/
install -v -m 644 cclun/language/cclun.en.po $destdir/share/virtualmoon/language/
install -v -m 644 cclun/language/cclun.fr.po $destdir/share/virtualmoon/language/

install -m 755 -d $destdir/share/virtualmoon/data
install -v -m 644 data/country.tab $destdir/share/virtualmoon/data/
install -v -m 644 data/retic.cur $destdir/share/virtualmoon/data/

# documentation
install -m 755 -d "$destdir/share/virtualmoon/My Images"
install -m 755 -d $destdir/share/virtualmoon/doc
install -m 755 -d $destdir/share/virtualmoon/Encyclopedia
install -v -m 644 doc/* $destdir/share/virtualmoon/doc/
install -v -m 644 Encyclopedia/* $destdir/share/virtualmoon/Encyclopedia/

# database
install -m 755 -d $destdir/share/virtualmoon/Database
install -v -m 644 "Database/AVL Named EN_utf8.csv" $destdir/share/virtualmoon/Database/
install -v -m 644 "Database/AVL Named FR_utf8.csv" $destdir/share/virtualmoon/Database/
install -v -m 644 "Database/AVL Satellite EN_utf8.csv" $destdir/share/virtualmoon/Database/
install -v -m 644 "Database/AVL Satellite FR_utf8.csv" $destdir/share/virtualmoon/Database/
install -v -m 644 "Database/AVL Registered EN_utf8.csv" $destdir/share/virtualmoon/Database/
install -v -m 644 "Database/AVL Registered FR_utf8.csv" $destdir/share/virtualmoon/Database/
install -v -m 644 "Database/AVL Unnamed EN_utf8.csv" $destdir/share/virtualmoon/Database/
install -v -m 644 "Database/AVL Unnamed FR_utf8.csv" $destdir/share/virtualmoon/Database/
install -v -m 644 Database/glossary_uEN.csv $destdir/share/virtualmoon/Database/
install -v -m 644 Database/glossary_uFR.csv $destdir/share/virtualmoon/Database/
install -v -m 644 Database/licence.txt $destdir/share/virtualmoon/Database/
install -v -m 644 Database/lopamidx.csv $destdir/share/virtualmoon/Database/
install -v -m 644 Database/lopamidx.txt $destdir/share/virtualmoon/Database/
install -v -m 644 Database/weblun.csv $destdir/share/virtualmoon/Database/

# big data
InstData Base_JPLeph $destdir
InstData Base_Airbrush $destdir
InstData Base_Bumpmap $destdir
InstData Base_Clementine $destdir
InstData Base_WAC $destdir
InstData Base_Overlay $destdir
