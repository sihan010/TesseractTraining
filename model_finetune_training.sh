#clear existing files
rm -rf output/*

#Allow to use half the threads so that pc doesn't freeze
#Use half of the threads you have
# continue to train eng.lstm, output to output/font, traineddata file path, training_files.txt file path, iterations
# around 2000 is ideal, play with it and apy attention to overfitting/underfitting
OMP_THREAD_LIMIT=8 lstmtraining \
    --continue_from eng.lstm \
    --model_output output/malgun \
    --traineddata tessdata/eng.traineddata \
    --train_listfile train/eng.training_files.txt \
    --max_iterations 400