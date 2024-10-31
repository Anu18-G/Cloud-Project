# Base stage for shared node modules
FROM node:14 AS base
WORKDIR /app
COPY package*.json ./
RUN npm install

# Frontend stage
FROM base AS frontend
COPY . .
EXPOSE 3000
CMD ["npm", "start"]

# Backend stage
FROM base AS backend
COPY . .
EXPOSE 4001
CMD ["npm", "run", "server"]
