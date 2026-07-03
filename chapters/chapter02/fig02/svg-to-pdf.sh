#!/bin/bash

for image in `ls`
do
    name=`echo $image | sed -r -n 's/^(.*)\.svg/\1/p'`
    inkscape -D $name.svg -o $name.pdf --export-latex
done