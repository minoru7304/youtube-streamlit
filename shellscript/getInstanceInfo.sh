#!/bin/bash

#引数でインスタンスIDを取得
INSTANCE_ID=$1

echo $INSTANCE_ID

RESPONSE=$(aws ec2 describe-instances \
        --query "Reservations[].Instances[].InstanceId" \
        --filters "Name=tag:Name,Values=$INSTANCE_ID" \
        --output text \
        )

echo "$RESPONSE"