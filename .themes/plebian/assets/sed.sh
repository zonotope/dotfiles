#!/bin/sh
sed -i \
         -e 's/#cccccc/rgb(0%,0%,0%)/g' \
         -e 's/#2d2d2d/rgb(100%,100%,100%)/g' \
    -e 's/#2d2d2d/rgb(50%,0%,0%)/g' \
     -e 's/#6699cc/rgb(0%,50%,0%)/g' \
     -e 's/#e8e6df/rgb(50%,0%,50%)/g' \
     -e 's/#393939/rgb(0%,0%,50%)/g' \
	$@
