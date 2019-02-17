FROM node:dubnium-alpine as package
WORKDIR /opt/app/
COPY package.json yarn.loc[k]
RUN NODE_ENV=development yarn install
COPY img /opt/app/img/
COPY now.json /opt/app/
COPY scss /opt/app/scss/
COPY index.html /opt/app/
RUN yarn build && yarn deploy
# RUN rm -Rf scss node_modules

# FROM node:dubnium-alpine
# WORKDIR /opt/app/
# COPY --from=package /opt/app/ /opt/app/public
