#Step Builder Stage
# 생성된 파일과 폴더는 /usr/src/app/build 경로에 생성됨.
#  From부터 다음 From 까지는 모두 builder Stage라는것을 명시한ㄷ.
# ----------- Start builderStage -----------
FROM node:alpine as builder
WORKDIR '/usr/src/app'
COPY package.json .
#종속성 생성
RUN  npm install
COPY ./ ./
RUN npm run build
# ----------- Start builderStage -----------


# ----------- Enㅏd RunStage -----------
#Step Run Stage
# nginx run
FROM nginx
# port 80 Mapping (AWS환경 업로드시 필요)
EXPOSE port    80
COPY --from=builder /usr/src/app/build  /usr/share/nginx/html
# ----------- End RunStage -----------
