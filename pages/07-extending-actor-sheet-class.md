# Estendendo a classe ActorSheet

A classe ActorSheet é a classe associada às fichas de personagem dos nossos atores. Vamos dar uma olhada no que o Boilerplate System faz:

## defaultOptions()

Toda ficha precisa definir suas opções padrão.

```js
/**
 * Extend the basic ActorSheet with some very simple modifications
 * @extends {ActorSheet}
 */
export class BoilerplateActorSheet extends ActorSheet {

  /** @override */
  static get defaultOptions() {
    return mergeObject(super.defaultOptions, {
      classes: ["boilerplate", "sheet", "actor"],
      template: "systems/boilerplate/templates/actor/actor-sheet.html",
      width: 600,
      height: 600,
      tabs: [{ navSelector: ".sheet-tabs", contentSelector: ".sheet-body", initial: "description" }]
    });
  }
```

Primeiro, estamos exportando a classe (não se esqueça de renomear a sua!) e definindo as opções padrão para a ficha. No método `defaultOptions()` precisamos retornar um mergedObject das opções padrão da classe ActorSheet principal e nossas customizações. Essas customizações são:

-  **classes**: um array de classes CSS para aplicar à ficha de personagem.
- **template**: o caminho para o template HTML Handlebars que usaremos para esta ficha de personagem. Este precisa ser relativo à raiz do Foundry, então você precisa incluir `systems/NOMEDOMEUISTEMA` no início do caminho.
- **width**: largura padrão da janela
- **height**: altura padrão da janela
- **tabs**: Use isto para definir suas abas na ficha de personagem. Isso deve corresponder ao que você criou no seu template HTML, mas você deve ter uma classe CSS de seletor de navegação, classe CSS de seletor de conteúdo e escolher uma aba padrão/inicial.

## getData()

Muito parecido com o método `prepareData()` da classe Actor, podemos usar o método `getData()` para derivar novos dados para a ficha de personagem. A principal diferença é que os valores criados aqui só estarão disponíveis dentro desta classe e no template HTML da ficha de personagem. Se você usasse o inspetor do seu navegador para dar uma olhada nos dados disponíveis de um ator, você não veria esses valores na lista, ao contrário daqueles criados em prepareData().

```js
  /* -------------------------------------------- */

  /** @override */
  getData() {
    const data = super.getData();
    data.dtypes = ["String", "Number", "Boolean"];
    for (let attr of Object.values(data.data.attributes)) {
      attr.isCheckbox = attr.dtype === "Boolean";
    }
    return data;
  }
```

Não há muito acontecendo neste exemplo de getData(), pois estamos apenas verificando que tipo de atributo é este e definindo o tipo como Boolean se for uma checkbox. Você pode não precisar usar isso, então sinta-se livre para pular se você tiver tudo o que precisa do método prepareData().

## activateListeners()

Se você quiser que sua ficha seja interativa, é aqui que isso precisa acontecer. O método `activateListeners()` é onde você pode executar jQuery na sua ficha para fazer coisas como criar habilidades e poderes roláveis, adicionar novos itens ou deletar itens. Este método recebe um objeto `html` que se comporta muito como `$('.sheet')` faria se você estivesse tentando executar lógica jQuery na sua ficha no console do seu navegador.

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

O Boilerplate System inclui três exemplos de listeners de clique: um para criar novos itens, um para editar itens existentes e um para deletar itens. Voltaremos a isso mais tarde no tutorial para adicionar um listener para atributos roláveis.

O primeiro listener de clique que adicionamos foi para criar novos itens, mas note que ele usa `this._onItemCreate.bind(this)` em vez de chamar seu código diretamente como os listeners de edição e exclusão fazem. Você pode seguir esse padrão de código para separar seus listeners em métodos customizados para tornar seu código mais organizado conforme cresce ao longo do tempo. Por enquanto, vamos dar uma olhada mais de perto no método customizado `_onItemCreate()`:

```js
  /* -------------------------------------------- */

  /**
   * Handle creating a new Owned Item for the actor using initial data defined in the HTML dataset
   * @param {Event} event   The originating click event
   * @private
   */
  _onItemCreate(event) {
    event.preventDefault();
    const header = event.currentTarget;
    // Get the type of item to create.
    const type = header.dataset.type;
    // Grab any data associated with this control.
    const data = duplicate(header.dataset);
    // Initialize a default name.
    const name = `New ${type.capitalize()}`;
    // Prepare the item object.
    const itemData = {
      name: name,
      type: type,
      data: data
    };
    // Remove the type from the dataset since it's in the itemData.type prop.
    delete itemData.data["type"];

    // Finally, create the item!
    return this.actor.createOwnedItem(itemData);
  }
```

Estamos fazendo algumas coisas diferentes aqui. Primeiro, estamos pegando o elemento (header) que foi clicado, e depois estamos descobrindo que tipo de item era. Neste caso, esse tipo é `item`, mas também poderia ser algo como `feature` ou `spell`. Depois disso, estamos pegando quaisquer atributos de dados customizados no elemento que foi clicado e usando-os para criar um novo objeto `itemData`. Finalmente, estamos passando tudo isso para `this.actor.createdOwnedItem(itemData)` para criar o item neste ator.

E já que esses exemplos foram as seções individuais, não se esqueça do seu colchete de fechamento para a própria classe!

```js
}
```

- **Anterior:** [Estendendo a classe Actor](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/06-extending-actor-class.md)
- **Próximo:** [Criando templates HTML para suas fichas de ator](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/08-creating-html-templates.md)
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTU2OTgxNjc4NywyMDE2NzA3NTM5LC04OD
U1NTY1ODMsODQzNzY1MDYzLC03NjA2MjYzMzRdfQ==
-->
