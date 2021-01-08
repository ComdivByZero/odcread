#!/usr/bin/sh

NAME=odcread
VERSION=0.1~a0
HOMEPAGE=https://github.com/ComdivByZero/odcread
MAINTAINER_1="Comdiv <ComdivByZero@yandex.ru>"

SIZE=$(du -a $NAME | tail -n 1 | awk '{print $1}')

TMP=/tmp/$NAME-deb/
MAIN=$TMP$NAME-$VERSION
DEBIAN=$MAIN/DEBIAN
DOC=$MAIN/usr/share/doc/$NAME
BIN=$MAIN/usr/bin

build() {
    make clean
    make LDFLAGS:=-s
}

makedeb() {
    cp $NAME $BIN/
    CURD="$(pwd)"
    cd $MAIN
    find . -type f -exec chmod 644 {} ';'
    find . -type d -exec chmod 755 {} ';'
    chmod +xxx usr/bin/$NAME
    md5deep -rl usr > DEBIAN/md5sums
    chmod 644 DEBIAN/md5sums
    cd ..
    fakeroot dpkg-deb --build *
    cd $CURD
    echo Built $MAIN.deb
    lintian $MAIN.deb
}


rm -fr $TMP
mkdir -p $BIN $DEBIAN $DOC

cat > $DEBIAN/control << EOF
Source: $NAME
Section: devel
Maintainer: ${MAINTAINER_1}
Homepage: ${HOMEPAGE}
Package: ${NAME}
Version: ${VERSION}
Priority: optional
Installed-Size: ${SIZE}
Architecture: amd64
Depends: libc6
Description: Reader of ".odc" oberon compound documents
 This program converts to plain text "Oberon compound document" binary format,
 used by the Black Box Component Builder, WinBUGS, and OpenBUGS

EOF

gzip -9cn - > $DOC/changelog.gz << EOF
 $NAME (0.1~a0) unstable; urgency=low
  * Fixed crashing for wrong files

 -- ${MAINTAINER_1} Sat, 09 Jan 2021 00:00:00 +0200

 $NAME (0.0~a1) unstable; urgency=low
  * Added short help
  * Added command for integration with .git

 -- ${MAINTAINER_1} Mon, 04 Jan 2021 00:00:00 +0200

 $NAME (0.0~a0) unstable; urgency=low
  * Initial package

 -- ${MAINTAINER_1} Mon, 03 Jan 2021 00:00:00 +0200

EOF

cat > $DOC/copyright << EOF
Format: http://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
Upstream-Name: ${NAME}
Source: ${HOMEPAGE}

Files: *
Copyright: 2011 Gert van Valkenhoef <g.h.m.van.valkenhoef@rug.nl>
 2021 ComdivByZero <ComdivByZero@yandex.ru>
License: GPL3
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 .
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 .
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.

EOF

build &&
makedeb
