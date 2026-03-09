FROM node:20-slim
WORKDIR /app
COPY package*.json ./
# 'npm ci' is faster and more reliable in CI/CD than 'npm install'
RUN npm ci --only=production
COPY prisma ./prisma/
RUN npx prisma generate
COPY . .
# CHANGE THIS TO 3000 to match your Task Definition
EXPOSE 3000
CMD ["npm", "start"]