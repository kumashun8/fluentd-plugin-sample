#!/bin/sh

echo "S3 setup start!"
echo "Creating S3 bucket..."

aws  --endpoint-url=http://localstack:4566  s3 ls > /tmp/s3buckets.txt

if [ $? -ne 0 ]
then
echo -e "date : Error occurs while connecting aws s3.. "
fi

if grep -q fluentd-logs /tmp/s3buckets.txt; then
    echo 'bucket exists! fluentd-logs'
else
  aws --endpoint-url=http://localstack:4566 s3 mb s3://fluentd-logs/
  echo 'bucket created!'
fi
echo "S3 setup Done!"
