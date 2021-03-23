# create train folder if not exists
mkdir -p train

#Clean previously generated data
rm -rf train/*

# tesstrain.sh is provided with tesseract build tools
# can also be copied from tesseract/src/training (version specific)

# multi fonts can also be used
# --fontlist \
#  "Adobe Devanagari" \
#  "Arial Unicode MS" \

# --lang parameter "eng" folder should be present in langdata_lstm folder
# eng.traineddata should be present in tessdata folder

# maxpages is number of pages with generated text for training

sh tesstrain.sh \
  --fonts_dir fonts \
  --fontlist 'Malgun Gothic' \
  --lang eng \
  --linedata_only \
  --langdata_dir langdata_lstm \
  --tessdata_dir tessdata \
  --save_box_tiff \
  --maxpages 50 \
  --output_dir train