#! /bin/bash
source activate bl-magi
export PYTHONPATH=$PYTHONPATH:`pwd`/../../../tensorflow:`pwd`/../../../tensorflow/slim:
export TRAIN_DIR_PATH='/home/lion/attr_dataset/category_model/model/train'
export DATASET_DIR_PATH='/home/lion/attr_dataset/category_model/data/dataset'
export CHECKPOINT_PATH='/home/lion/attr_dataset/category_model/data/checkpoints/inception_v3.ckpt'


python /home/lion/bl-magi/tensorflow/slim/train_image_classifier.py \
    --train_dir=$TRAIN_DIR_PATH \
    --dataset_dir=$DATASET_DIR_PATH \
    --dataset_name=category \
    --dataset_split_name=train \
    --num_clones=7 \
    --batch_size=224\
    --model_name=inception_v3 \
    --checkpoint_path=/home/lion/attr_dataset/category_model/data/checkpoints/inception_v3.ckpt \
    --checkpoint_exclude_scopes=InceptionV3/Logits,InceptionV3/AuxLogits \
    --trainable_scopes=InceptionV3/Logits,InceptionV3/AuxLogits
