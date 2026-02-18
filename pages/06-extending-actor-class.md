# Estendendo a classe Actor

Vamos começar dando uma olhada na classe BoilerplateActor em `/module/actor/actor.js`. Como nos exemplos anteriores, você vai querer renomear `BoilerplateActor` para o nome do seu sistema, como `MeuSistemaRPGActor`.

```js
/**
 * Estende a entidade base Actor definindo uma estrutura de dados de rolagem personalizada que é ideal para o sistema Simple.
 * @extends {Actor}
 */
export class BoilerplateActor extends Actor {

  /**
   * Aumenta os dados básicos do ator com dados dinâmicos adicionais.
   */
  prepareData() {
    super.prepareData();

    const actorData = this.data;
    const data = actorData.data;
    const flags = actorData.flags;

    // Faça métodos separados para cada tipo de Actor (character, npc, etc.) para manter
    // as coisas organizadas.
    if (actorData.type === 'character') this._prepareCharacterData(actorData);
  }

  /**
   * Prepara dados específicos do tipo Character
   */
  _prepareCharacterData(actorData) {
    const data = actorData.data;

    // Faça modificações aos dados aqui. Por exemplo:

    // Percorre as pontuações de habilidade e adiciona seus modificadores à saída da nossa ficha.
    for (let [key, ability] of Object.entries(data.abilities)) {
      // Calcula o modificador usando regras d20.
      ability.mod = Math.floor((ability.value - 10) / 2);
    }
  }

}
```

Estamos fazendo algumas coisas aqui. Primeiro, estamos usando `export` nesta classe para que ela esteja disponível para nosso arquivo principal de módulo ES para importação. Em segundo lugar, estamos estendendo a classe base `Actor` que o Foundry fornece para que obtenhamos toda a lógica que vem com isso por padrão.

Podemos sobrescrever qualquer método na [classe Actor](https://foundryvtt.com/api/Actor.html), mas neste caso estamos apenas sobrescrevendo o método `prepareData()`.

## Dados básicos vs. dados derivados

Então, qual é a diferença entre dados básicos e dados derivados? Dados básicos são coisas que você define em seu arquivo `template.json` e devem ser editáveis na ficha de personagem. Por exemplo, pontuações de habilidade em D&D seriam dados básicos.

Dados derivados são o tipo de dados que você na verdade não armazena e em vez disso calcula quando você precisa deles. Por exemplo, modificadores de habilidade são baseados na aplicação de uma fórmula às pontuações de habilidade, então não temos razão para fazer o usuário inseri-los manualmente. Por causa disso, precisamos criar esses valores no método `prepareData()`.

## Criando valores derivados com prepareData()

`prepareData()` pode ser usado para preparar dados adicionais em tempo de execução que não necessariamente temos definido em nosso arquivo principal `template.json`.

Vamos dar uma olhada mais de perto no método prepareData():

```js
/**
 * Aumenta os dados básicos do ator com dados dinâmicos adicionais.
 */
prepareData() {
  super.prepareData();

  const actorData = this.data;
  const data = actorData.data;
  const flags = actorData.flags;

  // Faça métodos separados para cada tipo de Actor (character, npc, etc.) para manter
  // as coisas organizadas.
  if (actorData.type === 'character') this._prepareCharacterData(actorData);
}
```

Primeiro, estamos usando `super.prepareData()` para continuar usando o método prepareData() original da classe Actor principal.

Segundo, estamos fazendo algumas variáveis de conveniência relacionadas ao ator. Essas são `actorData`, `data` e `flags`. Estas são opcionais, mas sem elas você estará fazendo coisas como `this.data.data.abilities.value`, o que pode ficar confuso.

> **O que há com `data.data`?**
> Alguns dados são sempre incluídos independentemente do sistema, como `name` e são acessíveis em `actor.data.name`, enquanto as propriedades únicas do seu sistema são armazenadas em uma propriedade data aninhada, como `actor.data.data.abilities.str`.

Terceiro, estamos verificando qual tipo de ator este é. Se este é um personagem, o executamos através de um método personalizado que criamos chamado `_prepareCharacterData()` para preparar valores derivados adicionais. Também poderíamos fazer o mesmo para coisas como NPCs se tivéssemos necessidade disso.

### _prepareCharacterData()

Agora que segmentamos um método personalizado que pode preparar dados de personagem sem afetar também NPCs, vamos calcular modificadores de habilidade a partir de pontuações de habilidade.

```js
/**
 * Prepara dados específicos do tipo Character
 */
_prepareCharacterData(actorData) {
  const data = actorData.data;

  // Faça modificações aos dados aqui. Por exemplo:

  // Percorre as pontuações de habilidade e adiciona seus modificadores à saída da nossa ficha.
  for (let [key, ability] of Object.entries(data.abilities)) {
    // Calcula o modificador usando regras d20.
    ability.mod = Math.floor((ability.value - 10) / 2);
  }
}
```

Você poderia colocar qualquer tipo de lógica neste método! Neste caso, sabemos que o sistema Boilerplate tem uma propriedade `abilities` em seu modelo de dados, então estamos percorrendo-a. A sintaxe é um pouco complicada para o loop real, mas `Object.entries` retornará pares de itens chave/valor para qualquer coisa que você aplicar, e quando percorrermos isso, cada loop terá uma `key` que seria o rótulo como `str` ou `dex` e também uma `ability` que seria o objeto de habilidade.

Neste caso, o objeto de habilidade tem apenas uma propriedade `value`, então usamos alguma matemática baseada nas regras d20 para calcular qual deveria ser o modificador de habilidade e atribuí-lo a `ability.mod`.

E com isso, terminamos de derivar novos valores! Não precisamos retornar nada; porque estamos trabalhando com objetos e não os clonamos ou copiamos, as alterações que fizemos em `ability.mod` automaticamente voltarão ao objeto `actorData` original.

- **Anterior:** [Criando seu arquivo JavaScript principal do sistema](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/05-creating-main-javascript.md)
- **Próximo:** [Estendendo a classe ActorSheet](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/07-extending-actor-sheet-class.md)
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTA0Mjg4NjIyNywzOTE3OTM2NTEsMTg1OT
QzMDQ0MywtMTA3MDEzNTQ2M119
-->
