FROM node:16-alpine

WORKDIR /app

# Copy the package.json and package-lock.json files into the container
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the application code into the container
COPY . .

EXPOSE 3000

CMD ["npm", "start"]