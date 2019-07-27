#!/bin/sh

echo '<style>';
echo "<script>" > /tmp/script.txt
echo "var arr= [" >> /tmp/script.txt

find fonts -type f | while read line
do

#fontid="$line.hhh"
fontid=`echo "$line" | sed 's#/##g'`
fontid=`echo "$fontid" | sed 's#\.##g'`
fontid=`echo "$fontid" | sed 's#-##g'`
fontid=`echo "$fontid" | sed 's#_##g'`
echo "@font-face {"
echo "font-family: \"$fontid\";"
echo "src: url(\"$line\");"
echo "}"
#echo $line

echo "\"$fontid\"," >> /tmp/script.txt

done

echo '</style>';

echo "];" >> /tmp/script.txt
echo "<script>" >> /tmp/script.txt

cat /tmp/script.txt
