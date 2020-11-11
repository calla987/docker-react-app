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


# ----------- End RunStage -----------
#Step Run Stage
# nginx run
FROM nginx
COPY --from=builder /usr/src/app/build  /usr/share/nginx/html
# ----------- End RunStage -----------
