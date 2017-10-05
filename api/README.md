asap_project
============

A Symfony project created on July 22, 2017, 10:43 am.
Configurar os dados de acesso ao banco LOCAL no arquivo /build/dev.properties

php bin/phin-latest.phar

//APENAS NA PRIMEIRA EXECUCAO DA APLICACAO
php bin/console doctrine:database:create

php bin/console doctrine:schema:update --force

//Criando o cliente OAUTH
//Essa execução irá retornar 2 valores (chave_publica e segredo). Copiem esses valores e coloquem no arquivo /build/dev.properties nos respectivos locais.
php bin/console app:seguranca:create-client-oauth ASAP

//Executar a atualização dos parametros
php bin/phin-latest.phar

//Criar um usuário padrão na aplicação (Apenas pra testes de login)
//Nome do usuario => ASAP
//Login => asap
//Senha => asap123
php bin/console api:create:user ASAP asap contato@asap.com.br asap123


#########Criação de API REST#############
Para criar um fluxo de CONTROLE/ROTAS/SERVICES(Exceptions) com base em um recurso, utilizem:

php bin/console app:create:api-resource "NomeDoRecurso"(no singular) App\\AplicacaoBundle App\\Model

Exemplo: 
- quero criar um fluxo para o recurso de trilhas:
php bin/console app:create:api-resource Trilha Api\\AplicacaoBundle Api\\Model

Isso irá criar:
- mapeamento de rotas (api/v1/aplicacao/trilhas [POST/GET/PUT/DELETE])
- mapeamento de servico (api.aplicacaobundle.service.trilha)
- Criação do controle TrilhaController
- Criação do Serviço TrilhaService
- Criação da Exception TrilhaException
- Criação dos métodos de acesso no serviço à entidade(pelo repo) ApiModel:Trilha (faz-se necessário IMPLEMENTAR os metodos, em caso de utiliza-los, no TrilhaRepository)

Suba o servidor com
php bin/console server:run

Feito isso, basta acessar http://127.0.0.1:8000/api/v1/aplicacao/trilhas que ja terá um modelo de resposta seguindo o padrão:
{ "code": "", "messages":[], "data": {}|[] }

TODA REQUISIÇÃO retornará nesse padrão. Todo o CONTEUDO SEMPRE virá dentro de "data" de maneira automatizada por um handler.