# Criando seu arquivo JavaScript principal do sistema

Vamos dar uma olhada no arquivo `/module/boilerplate.js` do Boilerplate System. Vamos ver cada seção dele para entender o que está acontecendo:

## Importe suas classes
```js
// Import Modules
import { BoilerplateActor } from "./actor/actor.js";
import { BoilerplateActorSheet } from "./actor/actor-sheet.js";
import { BoilerplateItem } from "./item/item.js";
import { BoilerplateItemSheet } from "./item/item-sheet.js";
```

Nesta primeira seção, importamos 4 classes, uma para cada uma das classes Actor e Item, e uma para cada uma das classes ActorSheet e ItemSheet. Para este sistema, essas classes têm `Boilerplate` como prefixo para elas, mas você deve usar um nome mais apropriado para seu sistema ao criar o seu próprio. O código para elas é definido em `/module/actor` e `/module/item`, então temos que referenciar suas localizações de arquivo ao importar.

Importar não necessariamente faz nada neste ponto, mas temos as classes disponíveis em nosso arquivo para que possamos agora informar ao Foundry como usá-las.

## O hook 'init'

O Foundry tem um sistema de hooks muito robusto que permite que você se conecte a diferentes tipos de eventos, como `init`, `ready` ou outros hooks para mensagens de chat, renderização de cena, etc. Neste caso, usaremos o hook `init` para inicializar as substituições importantes em nosso sistema. No exemplo abaixo, tudo com exceção do registro dos helpers Handlebars deve ser considerado essencial para o hook init do seu sistema.

Este exemplo inclui comentários atrás de `//` que explicam mais sobre o que realmente está acontecendo.

```js
Hooks.once('init', async function() {

  // Coloca nossas classes em seu próprio namespace para referência posterior.
  game.boilerplate = {
    BoilerplateActor,
    BoilerplateItem
  };

  /**
   * Define uma fórmula de iniciativa para o sistema
   * @type {String}
   */
  CONFIG.Combat.initiative = {
    formula: "1d20",
    decimals: 2
  };

  // Define classes de Entidade personalizadas. Isso substituirá as classes
  // Actor e Item padrão para usar nossas versões estendidas.
  CONFIG.Actor.entityClass = BoilerplateActor;
  CONFIG.Item.entityClass = BoilerplateItem;

  // Registra classes de aplicação de ficha. Isso deixará de usar as fichas
  // principais e usará nossas versões personalizadas.
  Actors.unregisterSheet("core", ActorSheet);
  Actors.registerSheet("boilerplate", BoilerplateActorSheet, { makeDefault: true });
  Items.unregisterSheet("core", ItemSheet);
  Items.registerSheet("boilerplate", BoilerplateItemSheet, { makeDefault: true });

  // Se você precisar adicionar helpers Handlebars, aqui estão alguns exemplos úteis:
  Handlebars.registerHelper('concat', function() {
    var outStr = '';
    for (var arg in arguments) {
      if (typeof arguments[arg] != 'object') {
        outStr += arguments[arg];
      }
    }
    return outStr;
  });

  Handlebars.registerHelper('toLowerCase', function(str) {
    return str.toLowerCase();
  });
});
```

E é isso!

## Tornando-o seu

Como nos exemplos anteriores, este código de exemplo usa o Boilerplate System. Você deve renomear suas classes como `MeuSistemaRPGActor` em vez de `BoilerplateActor`, e você vai querer atualizar as linhas `.registerSheet()` para substituir `boilerplate` por `meusistemarpg`, usando o nome de máquina do seu sistema.

Agora vamos dar uma olhada na classe Actor estendida.

- **Anterior:** [template.json](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/04-template.json.md)
- **Próximo:** [Estendendo a classe Actor](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/06-extending-actor-class.md)
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEzODgxNDg1MjYsLTg4NjkyNjEyNiwtMT
I5MDYzOTg4MCw0MTQ5MTYyNjMsLTExNjAwNzcyM119
-->
