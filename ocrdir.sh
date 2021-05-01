#!/bin/bash

##Requirements 
# sudo pacman -S tesseract tesseract-data-eng tesseract-data-fra


# img_moved_file=/tmp/ocrshot/ocrshot_lastimage.png
# outputTextFile=/tmp/ocrshot/ocrshot_lastimagegf



dir="imgs"

ext="png"

cd $dir


ocr_file()
{
    echo "OCR analyse  '$1' "

}


for f in *.$ext
do
    ocr_file "$f"
    outputTextFile=$f
    tesseract $f $outputTextFile -l eng
done



# if [ -f $imgfile ];
# then
# echo "Analyzing '$imgfile'"
#     tesseract $imgfile $outputTextFile -l eng
#     mv $imgfile $img_moved_file
#     kate $outputTextFile.txt
# else
#     echo "Oups file not found"
# fi
