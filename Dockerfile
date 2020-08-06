# Building Block. For only installing dependencies and building the app
FROM node:alpine as builder

WORKDIR /app

COPY ./package.json ./
RUN npm install

COPY ./ ./

RUN npm run build

# ===============
# Copying Block. copying the build folder from the Building Block
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
