#!/bin/bash

##############################################################################
# Author Name : Lee Gain
# Date written : 16/04/2024
# Date last modified : 25/09/2023
##############################################################################

##########################
# Set vars
##########################
# Config info
region="us-west-2"
file_path=""

# Stack names
network_stack_name="setup-network"
db_stack_name="setup-db"

# File names
network_file_name="1.setup_vpc"
db_file_name="2.setup_db"

##########################
# Create stacks
##########################

# 1) Set up the network 

# echo "Create a stack to set up the network ..."
# aws cloudformation create-stack --stack-name ${network_stack_name} \
#                                 --template-body file:/${file_path}/yaml/${network_file_name}.yml \
#                                 --capabilities CAPABILITY_NAMED_IAM \

echo "Create a stack to set up the db ..."
aws cloudformation create-stack --stack-name ${db_stack_name} \
                                --template-body file:/${file_path}/yaml/${db_file_name}.yml \
                                --capabilities CAPABILITY_NAMED_IAM \


