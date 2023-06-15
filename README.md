
# Google Books Flutter

Este é um projeto Flutter que utiliza a API do Google Books para permitir que os usuários pesquisem livros, vejam descrições, onde comprar e possam favoritar os livros de sua preferência.

## Requisitos

- Flutter 3.3.10
- Dart 2.15.0

## Dependências

- Flutter Modular para gerenciamento de rotas e injeção de dependências.
- Bloc para gerenciamento de estado.
- Dio para requisições HTTP.
- SqLite para armazenamento local.

## Como usar

1. Clone este repositório.
2. Entre no diretório do projeto.
3. Execute `flutter pub get` para instalar as dependências.
4. Execute `flutter run` para iniciar o aplicativo.

## Funcionalidades

- Pesquisa de livros: Os usuários podem pesquisar livros usando a barra de pesquisa na página inicial. Os resultados são exibidos em uma lista abaixo da barra de pesquisa.
- Descrição do livro: Ao clicar em um livro na lista de resultados, os usuários são levados a uma página de detalhes onde podem ver mais informações sobre o livro, incluindo a descrição completa.
- Onde comprar: Na página de detalhes do livro, há links para onde o livro pode ser comprado.
- Favoritos: Os usuários podem favoritar livros que gostam. Os livros favoritos são salvos localmente e podem ser acessados mesmo quando o usuário está offline.

## Contribuição

Contribuições são bem-vindas! Se você encontrar um bug ou quiser adicionar uma nova funcionalidade, sinta-se à vontade para criar uma issue ou um pull request.

## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
