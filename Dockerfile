# Usar uma imagem oficial Node.js como a base
FROM node:18

# Definir o diretório de trabalho no contêiner
WORKDIR /app

# Copiar o package.json e package-lock.json para o contêiner
COPY package*.json ./

# Limpa os caches
RUN npm cache clean --force

# Instalar as dependências do projeto
RUN npm install --fetch-timeout=100000 --fetch-retries=5

# Copiar todo o código do projeto para o diretório de trabalho
COPY . .

# Expor a porta usada pelo Metro Bundler (8081)
EXPOSE 8081

# Comando padrão para rodar o Metro Bundler
CMD ["npx", "react-native", "start"]
