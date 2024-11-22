FROM node:latest 

WORKDIR /app

# Copy package files
COPY package*.json ./

# Xóa node_modules nếu có
RUN rm -rf node_modules
RUN rm -rf package-lock.json

# Cài đặt dependencies
RUN npm install

# Copy source code
COPY . .

EXPOSE 8080

CMD ["npm", "start"]