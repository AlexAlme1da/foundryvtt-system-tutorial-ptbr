# Adicionando suporte à macrobar aos seus Itens

## Atualize seu JS principal do sistema

Primeiro, precisamos atualizar seu objeto `game.nomedomeuistema` no seu hook init. Para o Boilerplate System, isso se parece com isto:

```js
game.boilerplate = {
  BoilerplateActor,
  BoilerplateItem,
  rollItemMacro
};
```

A única mudança que fizemos de antes é que adicionamos uma nova linha para `rollItemMacro`, que definiremos mais tarde.

A seguir, precisamos criar (ou modificar) seu hook ready no arquivo JS principal do sistema. Para o Boilerplate System, isso é `boilerplate.js`

```js
Hooks.once("ready", async function() {
  // Wait to register hotbar drop hook on ready so that modules could register earlier if they want to
  Hooks.on("hotbarDrop", (bar, data, slot) => createBoilerplateMacro(data, slot));
});
```

A seguir, precisaremos adicionar duas novas funções tanto para adicionar o comportamento de soltar quanto a função de rolagem. Coloque o seguinte depois (não dentro) do seu hook ready. Renomeie a função `createBoilerplateMacro` tanto aqui quanto no hook ready acima para ser mais apropriada ao seu sistema, como `createNomeDoMeuSistemaMacro`

```js
/* -------------------------------------------- */
/*  Hotbar Macros                               */
/* -------------------------------------------- */

/**
 * Create a Macro from an Item drop.
 * Get an existing item macro if one exists, otherwise create a new one.
 * @param {Object} data     The dropped data
 * @param {number} slot     The hotbar slot to use
 * @returns {Promise}
 */
async function createBoilerplateMacro(data, slot) {
  if (data.type !== "Item") return;
  if (!("data" in data)) return ui.notifications.warn("You can only create macro buttons for owned Items");
  const item = data.data;

  // Create the macro command
  const command = `game.boilerplate.rollItemMacro("${item.name}");`;
  let macro = game.macros.entities.find(m => (m.name === item.name) && (m.command === command));
  if (!macro) {
    macro = await Macro.create({
      name: item.name,
      type: "script",
      img: item.img,
      command: command,
      flags: { "boilerplate.itemMacro": true }
    });
  }
  game.user.assignHotbarMacro(macro, slot);
  return false;
}

/**
 * Create a Macro from an Item drop.
 * Get an existing item macro if one exists, otherwise create a new one.
 * @param {string} itemName
 * @return {Promise}
 */
function rollItemMacro(itemName) {
  const speaker = ChatMessage.getSpeaker();
  let actor;
  if (speaker.token) actor = game.actors.tokens[speaker.token];
  if (!actor) actor = game.actors.get(speaker.actor);
  const item = actor ? actor.items.find(i => i.name === itemName) : null;
  if (!item) return ui.notifications.warn(`Your controlled Actor does not have an item named ${itemName}`);

  // Trigger the item roll
  return item.roll();
}
```

A primeira função é usada para criar uma nova entidade de macro ao soltar e definir seu comando para `game.boilerplate.rollItemMacro(NOMEDO ITEM)`, e a segunda função é a função real que acionará a rolagem no item. Renomeie `boilerplate` nesse comando para qualquer que seja o namespace do seu sistema. Este namespace é para o mesmo objeto que criamos no primeiro passo deste tutorial, então deve corresponder a isso.

A última linha da função `rollItemMacro()` é chamar `item.roll()`. Então vamos mudar para sua classe `Item` e adicionar esse método.

## Adicionando `roll()` à classe Item

O método `roll()` é o que estamos chamando quando a macro é clicada, então você pode colocar qualquer lógica nisso. Aqui está um exemplo do Boilerplate System, mas você deve modificar isso para atender suas necessidades.

```js
/**
 * Handle clickable rolls.
 * @param {Event} event   The originating click event
 * @private
 */
async roll() {
  // Basic template rendering data
  const token = this.actor.token;
  const item = this.data;
  const actorData = this.actor ? this.actor.data.data : {};
  const itemData = item.data;

  // Define the roll formula.
  let roll = new Roll('d20+@abilities.str.mod', actorData);
  let label = `Rolling ${item.name}`;
  // Roll and send to chat.
  roll.roll().toMessage({
    speaker: ChatMessage.getSpeaker({ actor: this.actor }),
    flavor: label
  });
}
```

Estamos quase terminando! A última coisa que temos que fazer é garantir que sua ficha de personagem tenha os eventos de arrastar adequados para poder arrastar para a macrobar.

## Adicionar eventos de arrastar à classe ActorSheet

No seu método `activeListeners()`, adicione o seguinte código.

```js
// Drag events for macros.
if (this.actor.owner) {
  let handler = ev => this._onDragItemStart(ev);
  // Find all items on the character sheet.
  html.find('li.item').each((i, li) => {
    // Ignore for the header row.
    if (li.classList.contains("item-header")) return;
    // Add draggable attribute and dragstart listener.
    li.setAttribute("draggable", true);
    li.addEventListener("dragstart", handler, false);
  });
}
```

Se este for o dono do ator, estamos percorrendo todas as tags `<li>` com a classe `.item`, ignorando aquelas com a classe `.item-header`. Você deve atualizar esses dois seletores para corresponder ao que seu sistema realmente usa se forem diferentes. Uma vez que estamos dentro do loop, adicionamos o atributo `draggable` e o evento `dragstart` ao item da lista para torná-lo arrastável para suporte à macrobar. Isso também permitirá que você faça outras coisas com o evento de arrastar, mas isso está fora do escopo desta parte do tutorial.


<!--stackedit_data:
eyJoaXN0b3J5IjpbMjA5MDMxMTQwLDIxODc3MTgzNiwxMDM2ND
AzODk2XX0=
-->
