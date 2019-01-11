# Dienekes ETL

## O desafio consiste em três etapas:

  * Extract - Extrair todos os números, página a página de http://challenge.dienekes.com.br:8888/api/numbers?page=1
  * Transform - Ordenar os números extraídos
  * Load - Expor uma API pra acessar os números ordenados

## Preparando o ambiente
  * `Instalar Elixir 1.7.4 https://elixir-lang.org/install.html
  * `git clone https://github.com/rogersouza/dienekes-test`
  * `cd dienekes-test`
  * `mix deps.get`
  * `mix test`
  * `mix phx.server`
  
## Extract
  * Ao iniciar a aplicação, os números serão raspados, ordenados e persistidos em um [Agent](https://elixir-lang.org/getting-started/mix-otp/agent.html) (in-memory persistence).

## API
  ### `/api/numbers`
  * Exibe os números extraídos e ordenados em ordem crescrente.
  * Aceita como parâmetro `page` pra controlar a paginação (Ex: `/api/numbers?page=1`)

  ### `/api/numbers/update`
  * Solicita uma atualização da base de dados
  * O processo de raspagem e ordenação dos dados leva aproximadamente 50 segundos
  * Caso o usuário tente acessar `/api/numbers` durante esse processo, uma mensagem aparecerá indicando que a extração ainda está em andamento.

  

  