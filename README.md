
## Multi-stage build

O multi-stage build reduz drasticamente o tamanho final da imagem ao descartar ferramentas de build e arquivos temporários, mantendo apenas o runtime e dependências de execução, além de aumentar a segurança ao diminuir a superfície de ataque e rodar com usuário não-root.

## DNS interno do Docker

O aplicativo consegue chamar o host mysql sem saber seu IP porque o Docker possui um servidor DNS embutido que resolve automaticamente os nomes dos containers e aliases na mesma rede personalizada.

## Diferença no Compose

O comando docker compose down remove apenas os containers e redes criados pela stack, preservando os dados, enquanto o docker compose down -v remove também os volumes nomeados, apagando permanentemente os dados armazenados.

## Quebra do CI

Para testar a resiliência do pipeline, alteramos o caminho da aplicação no CMD do Dockerfile para src/indexx.js. O GitHub Actions identificou a falha no container durante a etapa de aguardar a aplicação responder, pois o cURL falhou sucessivamente. Identificamos o erro facilmente consultando a etapa de dump de logs do job na aba Actions.

## por que o app consegue chamar o host mysql sem saber o IP dele?

por que é como se eles tivessem na mesma rua, no modo  bridge.

## Explique, em uma frase, a diferença entre docker compose down e docker compose down -v.

o sem o -v ele exclui o compose rodando sem excluir o volume e o com -v exclui o volume junto com todo resto

## o que você quebrou, como o CI reagiu e como você descobriu o problema pelos logs.

eu quebrei rota  do CMD no dockerfile adicinando mais x no indes.js ficando indexx.js

tudinho