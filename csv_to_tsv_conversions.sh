#!/bin/bash/

file=$1
# Convert file name to use .tsv
new_File_Name=$(echo $file | sed 's/.csv/.tsv/')

# File conversion from CSV to TSV using Sed
sed 's/,/\t/g' $file > $new_File_Name

# File conversion using cat and translate (tr)
cat $file | tr -s ',', '\t' > $new_File_Name

# File conversion using cat and awk
# Uses spaces instead of tabs
cat $file | awk -F ',' '{$1=$1}1' > $new_File_Name

# File conversion using awk
awk '{gsub(",", "\t"); print}' $file > $new_File_Name

# File conversion using perl
perl -pi -e 's/,/\t/g' $file
cp $file $new_File_Name
# Resetting original file to csv
perl -pi -e 's/\t/,/g' $file
