FROM node:17.3

WORKDIR /usr/src/app

COPY package.json yarn.lock ./
RUN yarn install

COPY . .

RUN yarn add -D @swc/cli @swc/core
RUN yarn add -D rimraf

RUN yarn build

EXPOSE 8080
CMD [ "yarn", "start" ]