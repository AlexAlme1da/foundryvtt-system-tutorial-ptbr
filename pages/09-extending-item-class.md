# Estendendo a classe Item

Você pode estender a classe Item para usar sua própria versão, assim como fizemos anteriormente com a classe Actor. Vamos começar dando uma olhada na classe BoilerplateItem em `/module/item/item.js`. Como nos exemplos anteriores, você vai querer renomear `BoilerplateItem` para qualquer que seja o nome do seu sistema, como `MeuSistemaItem`.

```js
/**
 * Extend the basic Item with some very simple modifications.
 * @extends {Item}
 */
export class BoilerplateItem extends Item {
  /**
   * Augment the basic Item data model with additional dynamic data.
   */
  prepareData() {
    super.prepareData();

    // Get the Item's data
    const itemData = this.data;
    const actorData = this.actor ? this.actor.data : {};
    const data = itemData.data;
  }
}
```

O sistema Boilerplate na verdade não inclui quaisquer outras modificações à sua classe Item, mas você poderia adicionar dados derivados aqui, como fizemos na classe Actor. Além disso, você pode definir métodos que podem ser chamados quando necessário, como um método `toRoll()` para fazer um lançamento de um item e enviá-lo para o chat. Voltaremos a essa ideia mais tarde quando adicionarmos suporte à Macrobar para itens.

- **Anterior:** [Criando templates HTML para suas fichas de ator](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/08-creating-html-templates.md)
- **Próximo:** [Estendendo a classe ItemSheet](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/10-extending-item-sheet-class.md)
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTcyNjk1MDQyMiwtMjEyODIwMzE1MiwtNj
MyMDUzOTE4LC01MzE0OTc5MDQsMTA3ODQ4ODgyOV19
-->
