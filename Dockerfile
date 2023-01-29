FROM node:17.3

WORKDIR /user/src/app

COPY package.json yarn.lock ./
RUN yarn install

COPY prisma/schema.prisma ./prisma/
RUN npx prisma generate

COPY . .

RUN yarn add -D @swc/cli @swc/core
RUN yarn add -D rimraf

RUN yarn build

EXPOSE 8080
CMD [ "yarn", "start" ]