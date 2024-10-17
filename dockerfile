
FROM node:16-alpine AS build
WORKDIR /opt
COPY package*.json ./
RUN npm install 
RUN npm install -g npm@8.19.4
FROM node:16-alpine
WORKDIR /opt
COPY --from=build /opt ./
EXPOSE 3000
CMD ["npm", "start"]
