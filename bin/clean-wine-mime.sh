#!/usr/bin/sh

# Create temporary file 
tmpfile=$(mktemp -p '/tmp' 'tmp.XXXXXXXX.reg')	|| exit 1

echo '[HKEY_CURRENT_USER\Software\Wine\DllOverrides]
"winemenubuilder.exe"=""' > $tmpfile

wine regedit $tmpfile || rm $tmpfile && exit 1

find $HOME/.local/share/mime -name '*wine*' -exec rm {} \;
find $HOME/.local/share/applications -name '*wine*' -exec rm {} \;
find $HOME/.local/share/icons -name '*wine*' -exec rm {} \;

update-mime-database $HOME/.local/share/mime

rm $tmpfile
