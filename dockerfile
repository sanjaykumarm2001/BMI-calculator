
FROM node:16-alpine AS build
WORKDIR /opt
COPY package*.json ./
RUN npm install -g npm@10.9.0
FROM node:16-alpine
WORKDIR /opt
COPY --from=build /opt ./
EXPOSE 3000
CMD ["npm", "start"]
