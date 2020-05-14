#!/bin/bash

git clone -b staging https://www.github.com/aws-samples/deep-learning-models/

/home/ubuntu/anaconda3/envs/tensorflow2_p36/bin/python \
                           deep-learning-models/models/vision/detection/Sagemaker/launch_sagemaker.py \
                           --user_id jbsnyder \
                           --sagemaker_role arn:aws:iam::578276202366:role/service-role/AmazonSageMaker-ExecutionRole-20191220T135085 \
                           --image 578276202366.dkr.ecr.us-east-1.amazonaws.com/jbsnyder:faster_rcnn \
                           --source_dir /home/ubuntu/deep-learning-models/models/vision/detection/ \                           
                           --instance_name sagemaker_demo \
                           --s3_path "s3://jbsnyder-sagemaker/faster-rcnn/"
                           --data_channel "s3://jbsnyder-sagemaker/faster-rcnn/data/coco/"
                           --weights_channel "s3://jbsnyder-sagemaker/faster-rcnn/data/weights/"