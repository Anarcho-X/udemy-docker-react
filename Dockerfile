FROM node:alpine as BuildPhase
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "build"]

FROM nginx as RunPhase
EXPOSE 80
COPY --from=BuildPhase /app/build /usr/share/nginx/html
