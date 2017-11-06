#!/bin/bash

sudo apt-get update 
sudo apt-get install -y build-essential git cvs zlib1g-dev

cvs -d :pserver:cvs@cvs.fefe.de:/cvs -z9 co libowfat
cd libowfat && make

git clone git://erdgeist.org/opentracker
cd opentracker && make
