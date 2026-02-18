# Coisas para estar ciente

Antes de começarmos a mergulhar no desenvolvimento, há algumas coisas úteis para saber como informações de fundo.

## HTML, CSS e JS

Sistemas são construídos usando HTML, CSS e Javascript. Ensinar isso está fora do escopo deste tutorial, mas existem muitos cursos excelentes por aí em diferentes plataformas, como:

* [https://www.freecodecamp.org/learn](https://www.freecodecamp.org/learn)
* [https://www.codecademy.com/](https://www.codecademy.com/)
* [https://www.udemy.com/courses/development/web-development/](https://www.udemy.com/courses/development/web-development/)
* [https://www.khanacademy.org/](https://www.khanacademy.org/)

## Devo usar scripts ou módulos ES?

No seu arquivo system.json, haverá seções tanto para `scripts` quanto para `esmodules`. Este tutorial (e a maioria dos sistemas desenvolvidos atualmente) usa a última opção, mas também é um pouco mais avançada. Se você estiver lutando com eles, pode ser mais fácil apenas colocar todo o código do seu sistema em alguns arquivos `.js` que você inclui na seção scripts do seu system.json

Para usar módulos ES, você vai querer carregar um único arquivo `meusistemarpg.js` na sua seção `esmodules` do system.json. Esse arquivo normalmente terá uma seção de importação no topo que importa classes de outros arquivos Javascript que você cria, e seus hooks para o Foundry também serão colocados lá. Vamos fazer um mergulho mais profundo em como isso funciona mais tarde no tutorial.

Para usar scripts, você carregará um ou mais arquivos Javascript, como `meusistemarpg.js` na sua seção `scripts` do system.json. Esse arquivo incluirá todas as suas classes, hooks e qualquer código necessário para executar seu sistema. É mais difícil de organizar por causa disso, mas você também não precisa se preocupar em exportar ou importar suas classes.

## Pré-processadores CSS

Quanto mais CSS você adicionar ao seu sistema, mais difícil será de manter ao longo do tempo. Uma das ferramentas mais poderosas para ajudar a mantê-lo organizado é usar um pré-processador CSS como [Less](http://lesscss.org/) ou [SCSS/Sass](https://sass-lang.com/). Usar um pré-processador permitirá que você divida seus arquivos CSS em partes que podem posteriormente ser combinadas em um único arquivo, aninhe seus estilos para código mais legível e use variáveis para coisas como cores, padding e fontes.

O Boilerplate System que estamos usando neste tutorial inclui suporte para SCSS, mas você também pode simplesmente trabalhar diretamente com os arquivos CSS se preferir. Para uma ótima implementação que usa Less, baixe o sistema dnd5e.

Para construir os arquivos SCSS neste sistema, você precisará ir ao diretório do sistema no seu terminal, executar `npm install`, e depois `npm run gulp` sempre que quiser compilar o SCSS em CSS. Usar o comando gulp também iniciará um processo de monitoramento que observará mudanças adicionais.

## Handlebars

O FoundryVTT usa [Handlebars](https://handlebarsjs.com/guide/#what-is-handlebars) para interpretar seus templates HTML e adicionar suporte básico para coisas como variáveis, instruções if e loops. Handlebars não é uma linguagem de programação como Javascript é, então se você quiser fazer algo mais avançado do que exibir uma variável ou iterar sobre um loop, você provavelmente precisará lidar com o código para isso nos métodos de dados do seu ator/item em JS, ou pode criar um novo helper Handlebars para adicionar lógica adicional aos seus arquivos Handlebars. Por exemplo, o Boilerplate System inclui um helper Handlebars chamado `concat` que combinará strings de variáveis como `{{concat "string 1, " "string 2"}}`

## E quanto a bibliotecas de terceiros?

Às vezes você precisa incluir bibliotecas de terceiros para fazer coisas adicionais, como se você quisesse usar [Tagify](https://github.com/yairEO/tagify) para fazer um widget de marcação. Usar essas bibliotecas está além do escopo deste tutorial, mas sempre que preciso instalar bibliotecas adicionais, faço um diretório `lib` dentro do meu sistema para colocar seus arquivos, e depois os incluo na seção `scripts` e `styles` do system.json

## Localização (i18n)

**A localização é extremamente importante se você está fazendo um sistema disponível publicamente!**

É sempre mais esforço voltar e localizar um sistema depois que ele é desenvolvido, então se você está fazendo um sistema disponível publicamente, recomendo fortemente localizá-lo desde o início. Vou entrar em mais detalhes sobre isso quando começarmos a desenvolver nosso sistema, mas para localizar seu sistema você precisará fazer um arquivo `en.json` (ou qualquer que seja seu idioma padrão) no diretório `lang` do seu sistema, e adicionar isso ao seu arquivo system.json. `en.json` consiste em pares chave/valor onde você pode especificar qual deve ser o texto para as chaves, e então em seus templates você faria `{{localize "KEY.name" }}` para exibir sua versão localizada.

- **Anterior:** [Montando um sistema vazio](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/01-getting-started.md)
- **Próximo:** [system.json](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/03-system.json.md)
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTYzNDU1NzY1Niw4MDc1NzU5NDQsMTMyMT
Y4ODc0N119
-->
