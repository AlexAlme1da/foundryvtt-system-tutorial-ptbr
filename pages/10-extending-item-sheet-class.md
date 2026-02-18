# Estendendo a classe ItemSheet

A classe ItemSheet é a classe associada às nossas fichas de itens. Vamos dar uma olhada no que o Boilerplate System faz:

## defaultOptions()

Muito similar à ficha de ator, começamos definindo nossas opções padrão para esta ficha. Nossa largura e altura tendem a ser menores nas fichas de itens para que não cubram completamente a ficha de personagem quando são abertas. Uma coisa que fizemos diferente da ficha de ator é que este método defaultOptions() não tem uma propriedade template. Isso é intencional, e poderia ter sido feito na ficha de ator também se precisássemos. Se você não incluir uma propriedade template, você deve criar um método getter `template()` para retornar o template correto.

```js
/**
 * Extend the basic ItemSheet with some very simple modifications
 * @extends {ItemSheet}
 */
export class BoilerplateItemSheet extends ItemSheet {

  /** @override */
  static get defaultOptions() {
    return mergeObject(super.defaultOptions, {
      classes: ["boilerplate", "sheet", "item"],
      width: 520,
      height: 480,
      tabs: [{ navSelector: ".sheet-tabs", contentSelector: ".sheet-body", initial: "description" }]
    });
  }
```

## get template()

O método `template()` tem a palavra-chave `get` colocada antes dele para sinalizar que este é um método getter para uma propriedade. Neste caso, estamos apenas retornando um único template `${path}/item-sheet.html` para todos os itens. No entanto, se você tiver múltiplos tipos de itens como `item`, `feat` e `spell`, você poderia remover a primeira instrução de retorno e descomentar a segunda instrução de retorno para retornar dinamicamente um template correspondente ao nome do tipo de item, como `templates/item/spell-sheet.html`.

```js
  /** @override */
  get template() {
    const path = "systems/boilerplate/templates/item";
    // Return a single sheet for all item types.
    return `${path}/item-sheet.html`;
    // Alternatively, you could use the following return statement to do a
    // unique item sheet by type, like `weapon-sheet.html`.

    // return `${path}/${this.item.data.type}-sheet.html`;
  }
```

## getData()

Assim como na ficha de ator, você pode usar isso para criar dados derivados para sua ficha de item, se necessário. Valores criados aqui só estariam disponíveis dentro desta classe ou no template HTML da ficha; não estariam disponíveis através do retorno da entidade item em outro lugar.

```js
  /* -------------------------------------------- */

  /** @override */
  getData() {
    const data = super.getData();
    return data;
  }

  /* -------------------------------------------- */
```

## setPosition()

Esta é uma pequena sobrescrita para lidar com a memorização da posição da ficha.

```js
  /** @override */
  setPosition(options = {}) {
    const position = super.setPosition(options);
    const sheetBody = this.element.find(".sheet-body");
    const bodyHeight = position.height - 192;
    sheetBody.css("height", bodyHeight);
    return position;
  }

  /* -------------------------------------------- */
```

## activateListeners()

Assim como na ficha de ator, é aqui que você ativaria listeners e eventos para sua ficha de item. Por exemplo, se você tivesse lógica que acontecesse no clique ou edição, ou se você tivesse um botão de rolagem dentro da ficha de item, isso poderia ir aqui. `html` é um objeto jQuery que você pode usar para encontrar outros elementos, como `html.find('.rollable')`

```js
  /** @override */
  activateListeners(html) {
    super.activateListeners(html);

    // Everything below here is only needed if the sheet is editable
    if (!this.options.editable) return;

    // Roll handlers, click handlers, etc. would go here.
  }
```

## Finalizando

Não se esqueça dos colchetes de fechamento!

```js
}
```

- **Anterior:** [Estendendo a classe Item](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/09-extending-item-class.md)
- **Próximo:** [Criando botões roláveis com listeners de evento](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/11.1-rollable.md)
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE5MzU0OTkyMzMsMjA3Mjg4Mzc4MSwxNj
M5MTM0NTczLC0zMzIxNjc5MDksMTM1MDEwODcxMl19
-->
