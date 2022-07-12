# 빌드 파일 생성
FROM node:alpine as builder
WORKDIR '/usr/src/app'
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

# Nginx로 시작
FROM nginx
# Nginx에서 사용하는 80번 포트 매핑
EXPOSE 80
COPY --from=builder /usr/src/app/build /usr/share/nginx/html