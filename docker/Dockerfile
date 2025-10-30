# build stage
FROM node:20-alpine AS builder

WORKDIR /app

ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo

COPY package*.json ./
RUN npm ci || npm install

COPY . ./
RUN npm run build

# run stage (static file server)
FROM nginx:alpine

ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo

# 配信する静的ファイルを配置
COPY --from=builder /app/dist /usr/share/nginx/html

# シンプルな設定（必要に応じて最適化可）
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]