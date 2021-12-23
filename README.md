odcread - read ".odc" oberon compound documents
===============================================

This is a library to read the "Oberon compound document" binary format used by
the [Black Box Component Builder][1], [WinBUGS][2], and [OpenBUGS][3].

A basic program is provided to convert the textual parts of these documents to
plain text.

Install
-------
From [Deb-repository][4]:

    /usr/bin/sudo apt install odcread

From [Snap Store][5]:

    snap install odcread

From [Homebrew Oberon tap][6] on macOS:

    brew tap vostok-space/oberon
    brew install odcread

From this source code repository using CMake:

    mkdir build
    cd build
    cmake ..
    make -j
    make install


License
-------

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.


[1]: http://www.oberon.ch/blackbox.html
[2]: http://www.mrc-bsu.cam.ac.uk/bugs/winbugs/contents.shtml
[3]: http://www.openbugs.info/
[4]: https://wiki.oberon.org/repo
[5]: https://snapcraft.io/odcread
[6]: https://github.com/Vostok-space/homebrew-oberon
