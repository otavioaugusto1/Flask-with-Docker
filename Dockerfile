# onde tudo começa, qual imagem vai usar
FROM python:3.8.12-bullseye

# crio uma pasta dentro do container e entro dela
WORKDIR /app

# joguei tudo que a aplicação usa utilizando o pip freeze pra um arquivo txt chamado de requirements.txt
# copio o arquivo requirements.txt para dentro do /app
COPY requirements.txt .

# executo a instalação das bibliotecas usadas no requirements.txt
# o run executa comandos dentro do container para instalar algo
# são comandos ANTES de subir a aplicação
RUN pip install -r requirements.txt

# a aplicação vai ficar na porta 5000
EXPOSE 5000

# crio uma variável pego dentro do site do Flask para mostrar erros
ENV FLASK_ENV development

#copio o app.py para a pasta /app
COPY app.py .

#CMD é o comando para executar a aplicação
CMD [ "flask", "run", "--host", "0.0.0.0" ]
