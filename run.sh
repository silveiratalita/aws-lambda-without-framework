#1º passo criar arquivo de políticas de segurança

#2º criar role de segurança na aws usando iam
aws iam create-role\
--role name lambda-example \
--assume-role-policy-document file://politicas.json \
| tee logs/role.log

#3º criar arquivo com conteudo e zipa-lo
zip function.zip index.js

aws lambda create-function --function-name talita-cli --zip-file fileb://function.zip --handler index.handler --runtime nodejs12.x --role arn:aws:iam::343278607681:role/lambda-exampe |tee logs/lambda-create.log 

#4º invoke lambda!
aws lambda invoke --function-name talita-cli --log-type Tail logs/lambda-exec.log

#5º atualizar , zipar()
zip  function.zip index.js
aws lambda update-function-code  --zip-file fileb://function.zip --function-name talita-cli --publish | tee logs/lambda-update.log

#6º invoke and see result
aws lambda invoke --function-name talita-cli --log-type Tail logs/lambda-exec-update.log

#remover
aws lambda delete-function --function-name talita-cli
aws iam delete-role --role-name lambda-example
