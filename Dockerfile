# 1. Estágio de Build
FROM node:20-alpine AS builder
WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# 2. Estágio Final
FROM node:20-alpine
WORKDIR /app

# Copia as dependências e o código
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/src ./src

# CRUCIAL: Cria o diretório do SQLite e dá permissão ao usuário node
RUN mkdir -p /etc/todos && chown -R node:node /etc/todos /app

# Agora sim trocamos para o usuário sem privilégios
USER node

EXPOSE 3000

CMD ["node", "src/index.js"]
