## show image size from azure repository

az acr repository show-manifests --name crweudev  --repository filezipperjobs --query "[].{Tag: tags[0], Size: imageSize, Created: timestamp}" --output table

az acr manifest list-metadata --registry crweudev --name filezipperjobs --query "[].{Tag: tags[0], Size: imageSize, Created: createdTime}"