# LINUXtips-Giropops-Senhas-Distroless

Este repositório contém um Dockerfile que configura uma aplicação Flask com um ambiente Python e integração com o Redis. Abaixo, você encontrará instruções sobre como clonar o repositório, construir a imagem Docker e executar os contêineres necessários.

## Pré-requisitos

- Docker instalado em seu sistema.
- Acesso à internet para baixar as imagens necessárias.

## Como Usar

### 1. Clonar o Repositório

Clone o repositório usando o seguinte comando:

```bash
git clone https://github.com/rafamellonh/LINUXtips-Giropops-Senhas-Distroless.git
cd LINUXtips-Giropops-Senhas-Distroless
```

### 2. Montar a Imagem Docker

Execute o seguinte comando para construir a imagem Docker:

```bash
docker --debug image build -t linuxtips-giropops-senhas-distroless:1.0 .
```

### 3. Criar o Contêiner do Redis

Antes de executar a aplicação Flask, você precisa criar um contêiner para o Redis. Altere o IP da variável `-e REDIS_HOST` para o IP correspondente à sua rede local. Execute:

```bash
docker container run -d --name redis -p 6379:6379 -e REDIS_HOST=192.168.1.171 redis
```

### 4. Criar o Contêiner a partir da Imagem

Agora você pode criar um contêiner a partir da imagem que você acabou de construir. Execute:

```bash
docker container run -d --name tst -p 5000:5000 --env REDIS_HOST=192.168.1.171 linuxtips-giropops-senhas-distroless:1.0
```

### 5. Acessar a Aplicação

Depois que o contêiner da aplicação estiver em execução, você pode acessá-la em seu navegador usando o seguinte endereço:

```
http://localhost:5000
```

### Observações

- Certifique-se de que o Redis está em execução antes de iniciar a aplicação Flask.
- O Redis deve estar acessível pelo IP que você configurou na variável de ambiente `REDIS_HOST`.

## Contribuição

Se você gostaria de contribuir para este projeto, fique à vontade para abrir uma *issue* ou enviar um *pull request*!

## Licença

Este projeto é licenciado sob a [MIT License](LICENSE).