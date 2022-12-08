#!/bin/bash

npm run build
npm run test:unit

cd /home/ndsignage/noc-digital-signage/_work/noc-digital-signage/noc-digital-signage
cp dist/index.html /var/www/html/
cp dist/favicon.ico /var/www/html/
cp -R dist/css/ /var/www/html/
cp -R dist/fonts/ /var/www/html/
cp -R dist/img/ /var/www/html/
cp -R dist/js/ /var/www/html/

# sudo docker build -t ${{ secrets.REPO_NAME }}:$BUILD_NUMBER . && sudo docker build -t ${{ secrets.REPO_NAME }}:latest .
# sudo docker push ${{ secrets.REPO_NAME }}:$BUILD_NUMBER && sudo docker push ${{ secrets.REPO_NAME }}:latest
