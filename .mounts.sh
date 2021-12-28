#!/bin/bash
/usr/bin/vmhgfs-fuse .host:/Projects /home/manjaro/Projects -o subtype=vmhgfs-fuse,allow_other
/usr/bin/vmhgfs-fuse .host:/Hochschule /home/manjaro/Hochschule/ -o subtype=vmhgfs-fuse,allow_other
