# Stage 1: Build Stage
FROM node:16 AS build
WORKDIR /app
COPY . .
RUN npm install && npm run build

# Stage 2: Production Stage
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]