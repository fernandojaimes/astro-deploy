aws lambda invoke --function-name test_parameter_store out --log-type Tail \
--query 'LogResult' --output text | base64 -D >> response

