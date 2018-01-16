#!/bin/bash
cd pkg && dpkg-buildpackage -rfakeroot -us -uc -tc
