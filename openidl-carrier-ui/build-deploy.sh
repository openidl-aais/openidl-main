#!/bin/bash
set -e

# Download and Install node 8 on path.
curl -O https://nodejs.org/dist/v8.9.0/node-v8.9.0-linux-x64.tar.xz
tar -xf node-v8.9.0-linux-x64.tar.xz
export PATH=${PWD}/node-v8.9.0-linux-x64/bin:$PATH

# Update npm
npm i npm@5.5.1 -g

# Add GH token
sed -i 's/${GITHUB_TOKEN}/'$GITHUB_TOKEN'/g' package.json
sed -i 's/${GITHUB_TOKEN}/'$GITHUB_TOKEN'/g' package-lock.json

pushd server/config
sed -i 's,${DATA_CALL_CARRIER_APP_URL},'$DATA_CALL_CARRIER_APP_URL',g' config.js
popd

# Add IDP credentials to manifest.yml
sed -i 's|<value goes here>|'$IDP_CONFIG'|g' manifest.yml

# Add name value to manifest.yml
sed -i 's|env-name|'$HOST_NAME'|g' manifest.yml
# Add host value to manifest.yml
sed -i 's|env-host|'$HOST_NAME'|g' manifest.yml

# Build angular application
npm install

cp -r node_modules/openidl-common-ui/* lib/
npm link @angular/cli
ng build --prod

# Deploy
cf push "${CF_APP}"
cf env "${CF_APP}"
