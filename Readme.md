## Tesseract Custom Font training in Mac

Video tutorial - https://www.youtube.com/watch?v=TpD76k2HYms

Important repos -

https://github.com/tesseract-ocr/tesseract

https://github.com/tesseract-ocr/langdata

https://github.com/tesseract-ocr/tessdata_best

1.  Install Tesseract and build tools

        	Install MacPorts from https://www.macports.org/install.php

        	Run following commands -
        	sudo port install automake autoconf
        	sudo port install pkgconfig
        	sudo port install leptonica
        	sudo port install cairo pango
        	sudo port install icu +devel

        	Clone the latest repo "OR" download release source, extract, rename folder to tesseract

        	git clone https://github.com/tesseract-ocr/tesseract/
        	cd tesseract
        	./autogen.sh
        	./configure \
        		--with-extra-libraries=/opt/local/lib \
        		--with-extra-includes=/opt/local/include \
        		LDFLAGS=-L/opt/loca/lib \
        		CPPFLAGS=-I/opt/local/include
        	make
        	sudo make install
        	make training
        	sudo make training-install

2.  Check Tesseract is installed by tesseract --version

        leptonica version should be 1.76 or higher

3.  Clone this repository.

    #fonts folder should include the font .ttf file

    #langdata_lstm folder should include the language langdata from

    https://github.com/tesseract-ocr/langdata

    folder structure ./langdata/eng/......

    Latin.unicharset and radical-stroke.txt can be same

    #tessdata folder should contain the .traineddata file from

    https://github.com/tesseract-ocr/tessdata_best

    folder structure ./tessdata/eng.traineddata

    ./tessdata/config can be same, it contains lstm.train which is user for training

4.  Recommended folder structure![Recommended FS](https://raw.githubusercontent.com/sihan010/TesseractTraining/master/folder_structure.png)

5.  IMPORTANT

    tesstrain_utils.sh

    language-specific.sh

    These are version specific, copy them from tesseract/src/training

    \*If tesstrain command not found you can also find them in tesseract/src/training

    \*\*Files in this repo are of 4.1.1

6.  Use the shell files in following order

        # sh generate_train_data.sh
        	this will generate training data to train folder, using the .ttf font in fonts folder
        # sh extract_lstm_from_traineddata.sh
        	this will give you an language.lstm model which you can use to evaluate on generated train data
        # sh model_evaluation.sh
        	this will evaluate the model using generated traing data
        # sh model_finetune_training.sh
        	this will start model training, read comments for more info.
        	You will get fontname_checkpoint at output folder, which is final trained model
        	Use sh model_evaluation.sh again to check improvements
        # sh combine_checkpoint_to_model.sh
        	this will stop training and merge trained model with language.traineddata to produce font.traineddata
        	font.traineddata is the resultant model that can be used with tesseract 4.0 or higher versions

7.  Result

        Before training-
        Eval Char error rate=0.53746834, Word error rate=1.1818622
        After Training for 400 iterations-
        Eval Char error rate=0.085654715, Word error rate=0.19015465

## Windows

**Follow the following repository-**

    https://github.com/livezingy/tesstrainsh-win

- Main challenge is to build tesseract and tesseract build tools for windows as they use lots of native dependencies.
- Once build is done, the shell commands are almost similar.
- Follow livezingy's repositories and his blog for more instructions.
