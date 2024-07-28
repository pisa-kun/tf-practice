# main

https://qiita.com/takengineer1216/items/40db479a49d77c07b07b

# sub

https://zenn.dev/sasakiki/articles/57c833fbcf7fea

## repos name

### docker tag
docker tag sample-app-001 asia-northeast1-docker.pkg.dev/primeval-splice-423019-c0/sample-app-001/ume

### docker push
docker push asia-northeast1-docker.pkg.dev/primeval-splice-423019-c0/sample-app-001/ume

## command

if use terraform apply, show below error message
```
Error: Error creating Service: googleapi: Error 403: Cloud Run Admin API has not been used in project primeval-splice-423019-c0 before or it is disabled. Enable it by visiting https://console.developers.google.com/apis/api/run.googleapis.com/overview?project=primeval-splice-423019-c0 then retry. If you enabled this API recently, wait a few minutes for the action to propagate to our systems and retry.
```

enable cloud run admin APP
> gcloud services enable run.googleapis.com

next, terraform apply