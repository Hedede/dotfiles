#!/usr/bin/sh

if [ -z $WINEPREFIX ] ;
then
	echo 'WINEPREFIX is empty, aborting.' && exit 1
fi
	
sed -i 's/winemenubuilder.exe -a -r/winemenubuilder.exe -r/' $WINEPREFIX/system.reg

find $HOME/.local/share/mime -name '*wine*' -exec rm {} \;
find $HOME/.local/share/applications -name '*wine*' -exec rm {} \;
find $HOME/.local/share/icons -name '*wine*' -exec rm {} \;

update-mime-database $HOME/.local/share/mime
