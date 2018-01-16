## pkg-r-cran-bh

_Unofficial_ [Debian](http://www.debian.org) packaging for the 
[BH](https://github.com/eddelbuettel/bh/) package

### About

This repository provides a simple way to provide create the
[CRAN package BH](https://cloud.r-project.org/package=BH) -- without
actually installing it.  As such, this Debian/Ubuntu package is a
_virtual_ package depending on `libboost-all-dev` which covers
everything in BH, and then some.

### Why?

Well 142 megabytes installed (as of Jan 2018) is big:

```sh
edd@rob:~/git/pkg-r-cran-bh$ du -csh /usr/local/lib/R/site-library/BH/
142M    /usr/local/lib/R/site-library/BH/
142M    total
edd@rob:~/git/pkg-r-cran-bh$ 
```

### Installation

After cloning the repository run

```
dpkg-buildpackage -rfakeroot -us -uc -tc
```

to create a Debian binary using the common _fakeroot_ suid accessor, without
signing changes or control file as we are not uploading anywhere, and
cleaning up.  More easily, just run

```
./runMe.sh
```

and either one of these two will create a `.deb` package.

You can also download a pre-made package (of type `binary: all`
suitable for all architectures, and with no dependencies)
[from here](doc/r-cran-bh_0.0.1-0local1_all.deb).

### Rationale

The issue of BH and its footprint is not new, and among a few of us
maintaining CRAN packages in Debian it has been discussed to do
something like this.  However, Debian is also absurdly perfectonists
and there is a possible "delta" the BH version and the Boost version
pulled in from the distribution. So this was not pursued further.

Just last week, I was part of a more informal discussion concerning
server-side deployment of R and packages, and the somewhat heavy cost
of having BH around. The idea of a possible "BH-lite" was mentioned.

That strikes me as the wrong approach. When we tell an R user that BH
is present, we promise that a certain set of programs or packages will
build.  Going with a subset _will_ break that promise.

Rather, why not go with _system_ Boost libraries and headers?  Given
that Debian/Ubuntu keep these in `/usr/include` (and `/usr/lib`), no
extra `-I` (or `-L`) flags are needed. So we can just provide an
"empty" BH for R, its include directive will point to nowhere yet
builds still succeed.  What could be better?

### Status

Initial proof of concept

### Author

Dirk Eddelbuettel

### License

The packaging is provided under the GPL (version 2 or later).  
