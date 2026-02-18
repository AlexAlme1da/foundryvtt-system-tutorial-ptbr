# Criando templates HTML para suas fichas de ator

Além das classes JS que as definem, atores e itens também possuem templates HTML que definem a estrutura das suas fichas de personagem e itens. No Boilerplate System, estes são colocados em `/templates/actor/actor-sheet.html` e `/templates/item/item-sheet.html`. Esses caminhos não são descobertos automaticamente; você precisa especificar seu caminho completo no método defaultOptions() da sua classe ActorSheet e ItemSheet. Você provavelmente adicionará muitos mais templates do que apenas esses dois conforme seu sistema avança no desenvolvimento, mas o processo é o mesmo para todos eles.

Templates HTML no Foundry usam [Handlebars](https://handlebarsjs.com/guide/) como seu motor de templates. Se você estiver usando um editor de código como [Visual Studio Code](https://code.visualstudio.com/), você pode definir o modo de destaque de sintaxe para Handlebars e obter uma coloração útil para ajudar a reconhecer as várias declarações e variáveis nos seus templates.

Vamos começar dando uma olhada em como o template `actor-sheet.html` está disposto em alto nível.

```handlebars
<form class="{{cssClass}} flexcol" autocomplete="off">

    {{!-- Sheet Header --}}
    <header class="sheet-header">
        {{!-- Header stuff goes here --}}
        <img class="profile-img" src="{{actor.img}}" data-edit="img" title="{{actor.name}}" height="100" width="100"/>
        <div class="header-fields">
            <h1 class="charname"><input name="name" type="text" value="{{actor.name}}" placeholder="Name"/></h1>
            <div class="resources grid grid-2col">{{!-- resources here --}}</div>
            <div class="abilities grid grid-3col">{{!-- abilities here --}}</div>
        </div>
    </header>

    {{!-- Sheet Tab Navigation --}}
    <nav class="sheet-tabs tabs" data-group="primary">
        <a class="item" data-tab="description">Description</a>
        <a class="item" data-tab="items">Items</a>
    </nav>

    {{!-- Sheet Body --}}
    <section class="sheet-body">
		{{!-- Tab content goes here --}}
    </section>
</form>
```

E aqui está uma versão anotada de como isso se parece:

![boilerplate character sheet annotated](https://mattsmithin.nyc3.digitaloceanspaces.com/assets/boilerplate-character.png)

## O `<form>`

O elemento que envolve toda a nossa ficha é um elemento `<form>` com uma variável que exibe `{{cssClass}}`. Esta é uma versão combinada do array de classes CSS que fizemos anteriormente no método defaultOptions() do arquivo actor-sheet.js. Você também pode incluir classes e outros atributos diretamente no template, como fizemos aqui com `flexcol`. A classe flexcol é uma classe auxiliar fornecida pelo Foundry que pode ser usada para dispor coisas verticalmente sem ter que escrever CSS adicional. Existem várias dessas incluídas pelo Foundry, e o Boilerplate System também inclui várias para grids.

> ### Layout básico de ficha no Boilerplate System
>
> Este sistema inclui um punhado de classes CSS auxiliares para ajudá-lo a dispor suas fichas se você não se sentir confortável mergulhando totalmente no CSS. Estas são:
>
> -   `flexcol`: Incluída pelo próprio Foundry, isso dispõe os elementos filhos de qualquer elemento em que você colocar isso verticalmente.
> -   `flexrow`: Incluída pelo próprio Foundry, isso dispõe os elementos filhos de qualquer elemento em que você colocar isso horizontalmente.
> -   `flex-center`: Quando usada em algo que está usando flexrow ou flexcol, isso centralizará os itens e o texto.
> -   `flex-between`: Quando usada em algo que está usando flexrow ou flexcol, isso tentará colocar espaço entre os itens. Similar a "justificar" em processadores de texto.
> -   `flex-group-center`: Adiciona uma borda, padding e centraliza todos os itens.
> -   `flex-group-left`: Adiciona uma borda, padding e alinha todos os itens à esquerda.
> -   `flex-group-right`: Adiciona uma borda, padding e alinha todos os itens à direita.
> -   `grid`: Quando combinado com as classes `grid-Ncol`, isso disporá os elementos filhos em uma grade.
> -   `grid-Ncol`: Substitua `N` por qualquer número de 1-12, como `grid-3col`. Quando combinado com `grid`, isso disporá os elementos filhos em uma grade com um número de colunas igual ao número especificado.

## O `<header>`

O elemento header é usado para criar a seção de cabeçalho do formulário onde colocamos uma pequena quantidade de informações importantes sobre nosso personagem que devem estar sempre visíveis, como nome, pontos de vida e atributos. Isso variará muito dependendo das necessidades do seu sistema. Vamos passar por cada seção do cabeçalho:

```handlebars
    {{!-- Sheet Header --}}
    <header class="sheet-header">
        <img class="profile-img" src="{{actor.img}}" data-edit="img" title="{{actor.name}}" height="100" width="100"/>
        <div class="header-fields">
            <h1 class="charname"><input name="name" type="text" value="{{actor.name}}" placeholder="Name"/></h1>
            {{!-- ...continued... --}}
```

O primeiro elemento no nosso cabeçalho é a imagem do ator. Além de adicionar classes adicionais ou ajustar os valores de height/width, suas imagens de ator devem sempre seguir esse padrão se precisarem ser editáveis pelo foundry. Estamos imprimindo o caminho para a imagem com a variável `{{actor.img}}`, e o `data-edit="img"` diz ao Foundry que esta é uma imagem que deve ser editável ao clicar.

> ### Variáveis no Handlebars
> Se você estiver dentro de um template de ficha de ator, o objeto `actor` estará disponível para imprimir coisas como o nome do ator e a fonte da imagem do ator com variáveis como `actor.name` e `actor.img`. O objeto `actor.data.data` também está disponível em uma variável `data` mais conveniente, então para propriedades que são únicas ao seu sistema você pode imprimir valores como `{{data.health.value}}`.

### A grade de recursos

O próximo item no nosso `<div class="header-fields">` é a grade de recursos.

```handlebars
            {{!-- ...continued... --}}
            <div class="resources grid grid-2col">
              <div class="resource flex-group-center">
                  <label for="data.health.value" class="resource-label">Health</label>
                  <div class="resource-content flexrow flex-center flex-between">
                    <input type="text" name="data.health.value" value="{{data.health.value}}" data-dtype="Number"/>
                    <span> / </span>
                    <input type="text" name="data.health.max" value="{{data.health.max}}" data-dtype="Number"/>
                  </div>
              </div>
              <div class="resource flex-group-center">
                  <label for="data.power.value" class="resource-label">Power</label>
                  <div class="resource-content flexrow flex-center flex-between">
                    <input type="text" name="data.power.value" value="{{data.power.value}}" data-dtype="Number"/>
                    <span> / </span>
                    <input type="text" name="data.power.max" value="{{data.power.max}}" data-dtype="Number"/>
                  </div>
              </div>
          </div>
          {{!-- ...continued... --}}
```

Neste caso, temos uma div container com as classes `resources`, `grid` e `grid-2col`. As duas últimas classes são as que conduzem o layout aqui; quaisquer elementos imediatamente dentro da div resources (ou divs `resource` neste caso) serão dispostos como uma grade de duas colunas. Também estamos usando a classe `flex-group-center` nas divs `resource` individuais para adicionar algum padding, uma borda e centralização de texto nelas.

Cada recurso tem alguns campos. Há um label com uma classe especial `resource-label` que o torna negrito e maiúsculo. Também temos uma div `resource-content` com várias classes flex diferentes nela para dispor seu conteúdo em uma linha.

Finalmente, temos nossos inputs. Inputs de texto no Foundry sempre seguem este padrão:

```handlebars
<input type="text" name="data.health.value" value="{{data.health.value}}" data-dtype="Number" />
```

Aqui está o que isso está fazendo:

- **name**: Este atributo é usado para dizer ao Foundry qual campo no ator deve ser atualizado quando mudanças são feitas. Este deve ser texto simples, então _não_ coloque-o dentro de colchetes `{{ variable }}`.
- **value**: Este é o valor atual do input, e o que o usuário pode mudar. Como este é o valor, precisamos colocá-lo em colchetes `{{ variable }}` para que o Foundry exiba o valor correto para ele.
- **data-dtype**: Este é um atributo especial que o Foundry usa para validar o input do formulário. Existem vários, mas os mais comuns são `Number` para números, `String` para texto e `Boolean` para checkboxes verdadeiro/falso.

### A `<div>` de atributos

A div de atributos é muito similar a recursos, mas neste caso temos um grupo de atributos relacionados que podem ser iterados em loop.

```handlebars
          {{!-- ...continued... --}}
          <div class="abilities grid grid-3col">
            {{#each data.abilities as |ability key|}}
              <div class="ability flexrow flex-group-center">
                <label for="data.abilities.{{key}}.value" class="resource-label">{{key}}</label>
                <input type="text" name="data.abilities.{{key}}.value" value="{{ability.value}}" data-dtype="Number"/>
                <span class="ability-mod">{{numberFormat ability.mod decimals=0 sign=true}}</span>
              </div>
            {{/each}}
          </div>
        </div>
    </header>
    {{!-- ...continued... --}}
```

Primeiro, estamos usando as mesmas classes `grid` de antes, exceto que agora estamos fazendo `grid-3col` para um layout de três colunas.

A grande diferença é que estamos executando um loop com `{{#each}}`. Vamos olhar essa declaração em mais detalhes:

```handlebars
{{#each data.abilities as |ability key|}}
  {{!-- stuff --}}
{{/each}}
```

Um bloco each começa com `#each` e termina com `/each`. A primeira coisa após o `{{#each` é o objeto ou array sobre o qual queremos iterar, ou neste caso `data.abilities`.

Você pode iterar apenas sobre os valores, o que seria `data.abilities as ability` ou sobre os valores com as chaves disponíveis também, que é o que estamos fazendo com `data.abilities as |ability key|`. Ao fazer isso podemos acessar o índice/chave usando a variável `{{key}}`, que seria avaliada como algo como "str", "dex" ou "con". A variável `{{ability}}` nos dará o objeto para cada atributo, o que nos permitirá imprimir o valor atual com `{{ability.value}}`.

Aqui está como o input de atributo real se parece:

```handlebars
<input type="text" name="data.abilities.{{key}}.value" value="{{ability.value}}" data-dtype="Number"/>
```

A primeira coisa a notar é que **name** e **value** são muito diferentes do que eram no nosso exemplo anterior! O atributo name precisa ser exatamente o conjunto de propriedades que o Foundry usaria para atualizar o valor, então estamos principalmente imprimindo-o como texto simples, exceto pela parte que seria "str" ou "dex". Para isso temos que imprimir a `{{key}}` atual. Então no nosso loop estamos usando `data.abilities.{{key}}.value` para o name, que será renderizado como algo como `data.abilities.str.value`.

O valor é um pouco diferente. Como já temos o objeto de atributo atual na variável `{{ability}}`, podemos simplesmente imprimir `{{ability.value}}` sem nos preocupar com a estrutura completa de `data.abilities`.

Finalmente, vamos dar uma olhada no modificador de atributo:

```handlebars
<span class="ability-mod">{{numberFormat ability.mod decimals=0 sign=true}}</span>
```

O usuário não precisa editar isso, então estamos apenas exibindo o valor como conteúdo dentro de um elemento span em vez do valor em um input. Por que é um span? Se você apenas precisa de um elemento que não tem significado semântico da forma que uma tag `<p>` tem para parágrafos, as tags `<div>` e `<span>` são bons curingas para agrupar conteúdo. Div normalmente se esticará e ocupará toda uma linha horizontalmente (a menos que você mude isso com CSS) enquanto spans são inline e só ocuparão tanto espaço quanto seu texto requerer.

Algo que estamos fazendo diferente para o modificador é que estamos usando o helper Handlebars `numberFormat`. Este é um helper especial que o Foundry inclui e permite que você formate números com sinais `+` e `-` dependendo do seu valor, juntamente com o arredondamento de decimais. Neste caso estamos usando numberFormat em `ability.mod`, que derivamos anteriormente, e definindo as decimais e o sinal `+/-` como verdadeiro.

## As abas `<nav>`

O elemento de navegação (nav) é usado para criar as abas da nossa ficha para navegação para múltiplas páginas.

```handlebars
    {{!-- ...continued... --}}
    {{!-- Sheet Tab Navigation --}}
    <nav class="sheet-tabs tabs" data-group="primary">
        <a class="item" data-tab="description">Description</a>
        <a class="item" data-tab="items">Items</a>
    </nav>
    {{!-- ...continued... --}}
```

Abas são criadas como um elemento `<nav>` com uma classe `tabs` e um `data-group`. O nome exato do data-group não importa muito, contanto que também corresponda às divs de conteúdo de aba que faremos mais tarde. Por exemplo, você poderia fazer `data-group="primary"` para um conjunto de abas e `data-group="secondary"` para um conjunto completamente não relacionado de abas (ou até abas aninhadas).

Cada aba dentro do nav é um link `<a>` com um atributo `data-tab`. Muito como `data-group`, o conteúdo de `data-tab` não importa contanto que correspondam exatamente a um atributo `data-tab` na sua div de conteúdo de aba que é criada mais tarde.

## O corpo `<section>`

Finalmente, também temos um elemento `<section>` que é usado para criar o corpo da ficha onde as várias páginas (que são navegadas via abas) viverão. Isso não precisa ser um elemento section; também poderia ter sido algo como uma `<div>`, mas sections podem ser usadas para dizer ao navegador "este é um pedaço discreto de conteúdo relacionado", como múltiplos parágrafos em um livro que estão todos sob o mesmo título.

Como estamos usando abas nesta ficha, cada item dentro de sheet-body é uma aba que também precisa de atributos `data-group` e `data-tab`. Aqui está a marcação para isso no Boilerplate System:

```handlebars
    {{!-- ...continued... --}}
    {{!-- Sheet Body --}}
    <section class="sheet-body">

        {{!-- Biography Tab --}}
        <div class="tab biography" data-group="primary" data-tab="description">
            {{editor content=data.biography target="data.biography" button=true owner=owner editable=editable}}
        </div>

        {{!-- Owned Items Tab --}}
        <div class="tab items" data-group="primary" data-tab="items">
            <ol class="items-list">
                <li class="item flexrow item-header">
                  <div class="item-image"></div>
                  <div class="item-name">Name</div>
                  <div class="item-controls">
                    <a class="item-control item-create" title="Create item" data-type="item"><i class="fas fa-plus"></i> Add item</a>
                  </div>
                </li>
            {{#each actor.items as |item id|}}
                <li class="item flexrow" data-item-id="{{item._id}}">
                    <div class="item-image"><img src="{{item.img}}" title="{{item.name}}" width="24" height="24"/></div>
                    <h4 class="item-name">{{item.name}}</h4>
                    <div class="item-controls">
                        <a class="item-control item-edit" title="Edit Item"><i class="fas fa-edit"></i></a>
                        <a class="item-control item-delete" title="Delete Item"><i class="fas fa-trash"></i></a>
                    </div>
                </li>
            {{/each}}
            </ol>
        </div>

    </section>
    {{!-- ...continued... --}}
```

### A aba de biografia

A aba de biografia no Boilerplate System é tanto um exemplo de como fazer uma aba quanto de como usar um editor TinyMCE.

```handlebars
{{!-- Biography Tab --}}
<div class="tab biography" data-group="primary" data-tab="description">
  {{editor content=data.biography target="data.biography" button=true owner=owner editable=editable}}
</div>
```

Primeiro, temos a classe `tab` para estabelecer que esta é uma aba, e uma classe `biography` que poderíamos usar para estilização CSS mais específica se necessário. O atributo `data-group` nos permite associar com o grupo de abas primário, e o atributo `data-tab` diz ao Foundry que esta é especificamente a aba description (que definimos anteriormente no elemento `<nav>`).

`{{editor}}` é um helper Handlebars especial que retornará um editor de texto TinyMCE. Você normalmente vai querer formatá-lo de forma muito similar a este exemplo, substituindo as propriedades `content` e `target` com qualquer propriedade de dados que você queira que o editor faça mudanças.

### A aba de itens possuídos

A aba de itens possuídos começa de forma muito parecida com a aba de biografia:

```handlebars
<div class="tab items" data-group="primary" data-tab="items">
{{!-- ...continued... --}}
```

O conteúdo é significativamente diferente. Para itens possuídos, estamos exibindo em um formato tipo tabela usando listas ordenadas.

```handlebars
  {{!-- ...continued... --}}
  <ol class="items-list">
    <li class="item flexrow item-header">
      <div class="item-image"></div>
      <div class="item-name">Name</div>
      <div class="item-controls">
        <a class="item-control item-create" title="Create item" data-type="item"><i class="fas fa-plus"></i> Add item</a>
      </div>
    </li>
    {{!-- ...continued... --}}
```

Primeiro, estamos definindo uma lista ordenada com a classe `items-list`. Precisamos de um cabeçalho, então criamos manualmente uma tag `<li>` com as classes `item`, `flexrow` e `item-header`. A classe `item-header` é usada para permitir que o CSS incluído com o Boilerplate saiba que este é um cabeçalho para uma lista e deve usar pesos de fonte em negrito.

Então temos uma div para cada coluna dos nossos itens, a imagem, nome e controles. Não precisamos de um label para a imagem, então é deixada vazia, mas ainda precisamos da div vazia para que o layout flexbox corresponda às nossas linhas de itens mais tarde. Item name tem o label de nome incluído nele. Para controles de item, na verdade adicionamos uma tag `<a>` que é usada para criar novos itens em vez de apenas colocar um label que diz "controles". Voltaremos a isso em um passo posterior do tutorial, mas a classe `item-create` será usada para um listener de evento de clique, e o atributo `data-type` será usado para especificar o tipo de item a criar (como item, spell ou feat). Você também pode voltar no tutorial para o `actor-sheet.js` e no método `activateListeners()`, você verá onde listeners de clique foram adicionados para esta funcionalidade.

A seguir, temos o loop para imprimir todos os itens possuídos:

```handlebars
    {{!-- ...continued... --}}
    {{#each actor.items as |item id|}}
      <li class="item flexrow" data-item-id="{{item._id}}">
        <div class="item-image"><img src="{{item.img}}" title="{{item.name}}" width="24" height="24"/></div>
        <h4 class="item-name">{{item.name}}</h4>
        <div class="item-controls">
          <a class="item-control item-edit" title="Edit Item"><i class="fas fa-edit"></i></a>
          <a class="item-control item-delete" title="Delete Item"><i class="fas fa-trash"></i></a>
        </div>
      </li>
    {{/each}}
    {{!-- ...continued... --}}
```

Como fizemos anteriormente com atributos, podemos iterar sobre os itens de um ator. Este é um loop um pouco simples pois estamos iterando sobre _todos_ os itens de um ator, sejam eles itens, magias, talentos ou qualquer outro subtipo que definimos. Reformularemos isso em um passo posterior do tutorial para dividi-lo em grupos ordenados dos diferentes tipos de itens, mas por enquanto isso nos permitirá iterar sobre tudo.

Na maior parte, as tags `<li>` neste loop `#each` são muito similares às que fizemos para a linha de cabeçalho, mas há algumas diferenças. Primeiro, temos um atributo especial `data-item-id="{{item._id}}"` no item da lista. Ter isso é muito importante para tornar sua vida mais fácil, porque ao tê-lo no item de lista pai, quaisquer links que fizermos em um dos elementos aninhados no item de lista serão capazes de pegar esse ID para uso no nosso Javascript.

A seguir, estamos exibindo as variáveis `item.img` e `item.name` conforme necessário.

E finalmente, estamos exibindo os controles de item. Note que os controles têm classes `item-edit` e `item-delete`, similares à classe `item-create` que adicionamos à div item-head anteriormente? Essas são duas classes adicionais que têm listeners de clique definidos em `actor-sheet.js`. Vamos voltar para `actor-sheet.js` e dar uma olhada no método `activateListeners()`:

```js
  /** @override */
  activateListeners(html) {
    super.activateListeners(html);

    // Everything below here is only needed if the sheet is editable
    if (!this.options.editable) return;

    // Add Inventory Item
    html.find('.item-create').click(this._onItemCreate.bind(this));

    // Update Inventory Item
    html.find('.item-edit').click(ev => {
      const li = $(ev.currentTarget).parents(".item");
      const item = this.actor.getOwnedItem(li.data("itemId"));
      item.sheet.render(true);
    });

    // Delete Inventory Item
    html.find('.item-delete').click(ev => {
      const li = $(ev.currentTarget).parents(".item");
      this.actor.deleteOwnedItem(li.data("itemId"));
      li.slideUp(200, () => this.render(false));
    });
  }
```

O que está acontecendo aqui? Primeiro, estamos ativando quaisquer listeners que o próprio Foundry define com `super.activateListeners(html)`.

Segundo, estamos retornando cedo se a ficha não for editável (o que geralmente significa que um observador a tem aberta em vez do dono da ficha).

Terceiro, estamos definindo um listener de clique para `item-create`. Entramos em detalhes anteriormente sobre o que o método `_onItemCreate()` fez, então vamos pular isso aqui.

Quarto, estamos definindo listeners de clique para `item-edit` e `item-delete`. Esses dois listeners são similares; ambos pegam o elemento para o item da lista que é um pai do botão sendo clicado, que é o que `$(ev.currentTarget).parents('.item')` faz. Como temos o atributo `data-item-id` nos itens da lista, podemos então usar os métodos do ator para ou pegar o item possuído e renderizar sua ficha de item ou deletar o item possuído, dependendo de qual listener estamos. Se estivermos deletando o item, também fazemos uma pequena animação com `li.slideUp()` para animar a remoção do item.

## Finalizando

Voltando ao template actor-sheet.html, cobrimos a lista da lógica nele para o sistema Boilerplate. Não se esqueça das suas tags de fechamento!

```handlebars
            {{!-- ...continued... --}}
            </ol>
        </div>
    </section>
</form>
```

- **Anterior:** [Estendendo a classe ActorSheet](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/07-extending-actor-sheet-class.md)
- **Próximo:** [Estendendo a classe Item](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/09-extending-item-class.md)
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEzMTI1OTUyODQsMjMyNDA4ODQ0LDcyNj
MxMzYzMSwtMTA1ODE1MDcwNywtNTE4ODc4NTkyLDczOTgzMTI1
Niw0MzU1NDc1MTgsLTU3NjI2OTcyMywtMTI4MTc0MzEzNSwtMT
U4NzMwMjA0M119
-->
