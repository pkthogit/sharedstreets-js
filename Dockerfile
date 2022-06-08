FROM ibihydsmartcity/cli-tool:ubuntu-node-base
RUN npm install -g npm@6.9.0
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin
WORKDIR /app
COPY . /app
RUN npm install
RUN npm build
RUN chmod +x ./bin/run
RUN npm run prepack
# docker build -t ibihydsmartcity/cli-tool:latest // to upload lastest code run this cmd.
# docker push ibihydsmartcity/cli-tool:latest // to push the updated image