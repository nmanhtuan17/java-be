FROM --platform=linux/amd64 node:18

WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Xóa node_modules nếu có
RUN rm -rf node_modules
RUN rm -rf package-lock.json

# Cài đặt dependencies
RUN npm install
# Rebuild bcrypt
RUN npm uninstall bcrypt
RUN npm install bcrypt

# Copy source code
COPY . .

EXPOSE 8080

CMD ["npm", "start"]