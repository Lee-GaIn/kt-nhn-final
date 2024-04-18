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
project_name="tgtg-rf-main"
file_path=""
web_ami_id="ami-0395649fbe870727e"
my_ip=$(curl -s http://ifconfig.me/ip)/32

# Stack names
network_stack_name="setup-network"
db_stack_name="setup-db"
efs_stack_name="setup-efs"
params_stack_name="setup-params"
web_stack_name="setup-web"
was_stack_name="setup-was"
cicd_stack_name="setup-cicd"

# File names
network_file_name="1.setup-vpc"
db_file_name="2.setup-db"
efs_file_name="2.setup-efs"
params_file_name="3.setup-params"
web_file_name="3.setup-web"
was_file_name="3.setup-was"
cicd_file_name="4.setup-cicd"

##########################
# Create stacks
##########################

# # 1) Set up the network 
# echo "Create a stack to set up the network ..."
# aws cloudformation create-stack --stack-name ${network_stack_name} \
#                                 --template-body file:/${file_path}/yaml/${network_file_name}.yml \
#                                 --capabilities CAPABILITY_NAMED_IAM \
#                                 --parameters ParameterKey=ProjectName,ParameterValue=${project_name} \
#                                              ParameterKey=MyIp,ParameterValue=${my_ip}

# # 2) 
# echo "Create a stack to set up the db ..."
# aws cloudformation create-stack --stack-name ${db_stack_name} \
#                                 --template-body file:/${file_path}/yaml/${db_file_name}.yml \
#                                 --capabilities CAPABILITY_NAMED_IAM \
#                                 --parameters ParameterKey=ProjectName,ParameterValue=${project_name}

# echo "Create a stack to set up the efs server ..."
# aws cloudformation create-stack --stack-name ${efs_stack_name} \
#                                 --template-body file:/${file_path}/yaml/${efs_file_name}.yml \
#                                 --capabilities CAPABILITY_NAMED_IAM \
#                                 --parameters ParameterKey=ProjectName,ParameterValue=${project_name}


# # 3)
# echo "Create a stack to set up the parameters ..."
# aws cloudformation create-stack --stack-name ${params_stack_name} \
#                                 --template-body file:/${file_path}/yaml/${params_file_name}.yml \
#                                 --capabilities CAPABILITY_NAMED_IAM \

# echo "Create a stack to set up the web servers ..."
# aws cloudformation create-stack --stack-name ${web_stack_name} \
#                                 --template-body file:/${file_path}/yaml/${web_file_name}.yml \
#                                 --capabilities CAPABILITY_NAMED_IAM \
#                                 --parameters ParameterKey=ProjectName,ParameterValue=${project_name} \
#                                              ParameterKey=ImageId,ParameterValue=${web_ami_id}

# echo "Create a stack to set up the was servers ..."
# aws cloudformation create-stack --stack-name ${was_stack_name} \
#                                 --template-body file:/${file_path}/yaml/${was_file_name}.yml \
#                                 --capabilities CAPABILITY_NAMED_IAM \
#                                 --parameters ParameterKey=ProjectName,ParameterValue=${project_name} \
#                                              ParameterKey=ImageId,ParameterValue=${was_ami_id}


# # 4) ci cd 
echo "Create a stack to set up the ci/cd ..."
aws cloudformation create-stack --stack-name ${cicd_stack_name} \
                                --template-body file:/${file_path}/yaml/${cicd_file_name}.yml \
                                --capabilities CAPABILITY_NAMED_IAM \
                                --parameters ParameterKey=ProjectName,ParameterValue=${project_name} \
