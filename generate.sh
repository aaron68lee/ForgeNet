#!/bin/bash

# Set the paths to the snapshot, output directory, and style pickle file
#SNAPSHOT_PATH="/path/to/snapshot.pth"
OUTPUT_DIRECTORY="./generated"
SNAPSHOT_PATH="./Weights/IAM/GAN/checkpoint-iteration175000.pth"
#"./saved/Old Checkpoints/checkpoint-latest.pth"
#STYLE_PICKLE_FILE="./GAN_VAE_Model/styles/style_pickle_file.pkl"

# Set the optional flags
STYLE_PICKLE_FILE="./Weights/IAM/GAN/test_styles_175000.pkl"

GPU_FLAG=""
TEST_SET_FLAG=""
STYLE_FLAG=""

<<COMMENT
# Check if GPU flag is provided
if [ "$1" == "-g" ]; then
    GPU_FLAG="-g $2"
    shift 2
fi

# Check if test set flag is provided
if [ "$1" == "-T" ]; then
    TEST_SET_FLAG="-T"
    shift
fi

# Check if style pickle file is provided
if [ "$1" == "-s" ]; then
    STYLE_FLAG="-s"
    STYLE_PICKLE_FILE="$2"
    shift 2
fi

# Check if the checkpoint flag is provided
if [ "$1" == "-c" ]; then
    SNAPSHOT_PATH="$2"
    shift 2
fi
COMMENT

# Execute the Python script with the specified arguments
python ./GAN_VAE_Model/generate.py -c "$SNAPSHOT_PATH" -d "$OUTPUT_DIRECTORY" -r $1

#$GPU_FLAG $TEST_SET_FLAG $STYLE_FLAG "$STYLE_PICKLE_FILE"

# generate random images
#python ./GAN_VAE_Model/generate.py -c "./Weights/IAM/GAN/checkpoint-iteration175000.pth" -d "./generated" "./Weights/IAM/GAN/test_styles_175000.pkl" -r 

# interpolate between styles
#image1: ./Datasets/words/a01/a01-000u
#image2: ./Datasets/words/a01/a01-043x
# output text: "Hello World"
#python ./GAN_VAE_Model/generate.py -c "./Weights/IAM/GAN/checkpoint-iteration175000.pth" -d "./generated" -f "./Datasets/words/a01/a01-000u" "./Datasets/words/a01/a01-043x" "Hello World"
