# dns-server
Servidor DNs baseado no Bind9 com Ubuntu 18.04

Para executar, siga os seguintes passos:
1. Clone o repositorio:
   git clone https://github.com/Admweb-202001/dns-server.git
   
2. Acesse o diretório do projeto:
  cd dns-server
  
3. Crie a imagem a partir do Dockerfile:
   docker build -t <nome_imagem> .
   
4. Crie o container a partir da imagem criada:
  docker run -it -d -p 53:53/udp --name dnsserver -v /root/dns-server/admweb.com.br/db.admweb.com.br:/etc/bind/db.admweb.com.br -v /root/dns-server/conf/named.conf.local:/etc/bind/named.conf.local <nome_image>
  
5. Para verificar se está tudo ok!
  docker exec -it dnsserver nslookup mail.admweb.com.br localhost
  
  ou
  docker exec -it dns-server /bin/bash
  
  dentro do container:
  nslookup mail.admweb.com.br localhost
  
  
  Se tudo estiver correto irá mostrar o IP do servidor mail.admweb.com.br -> 172.17.0.5
  Mostrou este valor porque na zona DNS criada o registro A mail aponta para este IP. Caso queira realizar modificações, basta alterar este arquivo e executar dentro do container, o comando:
  /etc/init.d/bind9 reload
  
  O nslookup é um utilitário para fazer consultas DNS. O terceiro argumento é para informar qual servidor DNS queremos consultar, no caso o servidor DNS local (o que configuramos no container).
