# multi stage docker image 
# stape build
FROM node:14 AS builder
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .

# runtime stage 
FROM node:14 AS runtime
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app ./ 
CMD ["node", "index.js"]
