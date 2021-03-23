#Clean previously generated data
rm -rf train/*

sh tesstrain.sh \
  --fonts_dir fonts \
  --fontlist 'Malgun Gothic' \
  --lang eng \
  --linedata_only \
  --langdata_dir langdata_lstm \
  --tessdata_dir tessdata \
  --save_box_tiff \
  --maxpages 10 \
  --output_dir train