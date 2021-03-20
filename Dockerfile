FROM node:14.16.0-alpine

# install chrome for protractor tests
RUN apk add --no-cache chromium-chromedriver

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
COPY .yarnrc /app/.yarnrc
COPY yarn.lock /app/yarn.lock
RUN yarn install
RUN yarn global add @angular/cli@~11.2.5

# add app
COPY . /app

EXPOSE 49153

# start app
CMD ng serve --host 0.0.0.0 --poll 1
