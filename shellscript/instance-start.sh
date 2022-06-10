#!/bin/bash -x

#課題
#共通処理を別にする
#エラー文言を設定ファイルから取得する

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
        0 | 16) 
        echo "this instance already started" 
        exit;;
        32 | 64) 
        echo "this instance stopping" 
        exit;;
esac

# EC2インスタンスを起動して、runningになるまで待つ
aws ec2 start-instances --instance-ids "$RESPONSE_INSTANCE_ID" \
 && aws ec2 wait instance-running --instance-ids "$RESPONSE_INSTANCE_ID"

if [ "$?" -eq 0 ]
then
        echo "this instance started"
fi