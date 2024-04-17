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
project_name="main"
file_path=""
web_ami_id="ami-0395649fbe870727e"

# Stack names
network_stack_name="setup-network"
db_stack_name="setup-db"
params_stack_name="setup-params"
web_stack_name="setup-web"

# File names
network_file_name="1.setup-vpc"
db_file_name="2.setup-db"
params_file_name="3.setup-params"
web_file_name="4.setup-web"

##########################
# Create stacks
##########################

# echo "Create a stack to set up the network ..."
# aws cloudformation create-stack --stack-name ${network_stack_name} \
#                                 --template-body file:/${file_path}/yaml/${network_file_name}.yml \
#                                 --capabilities CAPABILITY_NAMED_IAM \
#                                 --parameters ParameterKey=ProjectName,ParameterValue=${project_name}

# echo "Create a stack to set up the db ..."
# aws cloudformation create-stack --stack-name ${db_stack_name} \
#                                 --template-body file:/${file_path}/yaml/${db_file_name}.yml \
#                                 --capabilities CAPABILITY_NAMED_IAM \
#                                 --parameters ParameterKey=ProjectName,ParameterValue=${project_name}

# echo "Create a stack to set up the parameters ..."
# aws cloudformation create-stack --stack-name ${params_stack_name} \
#                                 --template-body file:/${file_path}/yaml/${params_file_name}.yml \
#                                 --capabilities CAPABILITY_NAMED_IAM \


echo "Create a stack to set up the web servers ..."
aws cloudformation create-stack --stack-name ${web_stack_name} \
                                --template-body file:/${file_path}/yaml/${web_file_name}.yml \
                                --capabilities CAPABILITY_NAMED_IAM \
                                --parameters ParameterKey=ProjectName,ParameterValue=${project_name} \
                                             ParameterKey=ImageId,ParameterValue=${web_ami_id}
