#!/bin/bash -x

#引数でインスタンスIDを取得
if [ $# -ne 1 ]
then   
        echo "$0 is 1 argument necessary"
        exit
fi

INSTANCE_NAME="$1"

RESPONSE_INSTANCE_ID=$(aws ec2 describe-instances \
        --query "Reservations[].Instances[].InstanceId" \
        --filters "Name=tag:Name,Values=$INSTANCE_NAME" \
        --output text \
        )

echo "$RESPONSE_INSTANCE_ID"

#引数に指定したインスタンス名のインスタンスが存在しない場合、エラーとする
if [ -z "$RESPONSE_INSTANCE_ID" ]
then    
        echo "There is no return"
        exit
fi

RESPONSE_INSTANCE_STATE=$(aws ec2 describe-instances \
        --query "Reservations[].Instances[].State[].Code" \
        --filters "Name=instance-id,Values=$RESPONSE_INSTANCE_ID" \
        --output text \
        )

# EC2ステータスがstoppedでなかったら、エラー文言を表示して処理を中止
# 0:pending 16:running 32:shutting-down 64:stopping 80 stopped
case "$RESPONSE_INSTANCE_STATE" in
        0) 
        echo "this instance already starting" 
        exit;;
        32 | 64 | 80) 
        echo "this instance stopping or stopped" 
        exit;;
esac

# EC2インスタンスを起動して、runningになるまで待つ
aws ec2 stop-instances --instance-ids "$RESPONSE_INSTANCE_ID" \
# && aws ec2 wait instance-stopped --instance-ids "$RESPONSE_INSTANCE_ID"

if [ "$?" -eq 0 ]
then
        echo "this instance stopping"
fi