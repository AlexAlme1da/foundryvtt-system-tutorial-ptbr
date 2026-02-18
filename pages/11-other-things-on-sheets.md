# Outras coisas para fazer em fichas de Ator

## Criando rolagens que requerem entrada do usuário

## Criando abas para gerenciar múltiplos tipos de itens

## Criando estruturas de dados similares a itens

## Consultando entidades com filter

Consultar um ator por nome.

```js
let name = "My Actor";
let actors = game.actors.entities.filter(a => a.data.name == name);
```

Consultar múltiplos atores por nome.

```js
let names = [
    "My Actor",
    "My Other Actor"
];
let actors = game.actors.entities.filter(a => names.includes(a.data.name));
```

## Exibindo uma lista de atores com map

```js
let names = game.actors.entities.map(a => return a.data.name).join(', ');
```

## Modificar a marcação de uma ficha ou aplicação em JS

Na sua classe ActorSheet, ItemSheet ou application, sobrescreva o método _renderInner().

```js
async _renderInner(data, options) {
  const html = await  super._renderInner(data, options);
  // Modify the HTML by adding your stuff here
  return html;
}
```

## Alvos

```js
for (let target of game.user.targets) {
  if (target.actor.data.data.attributes.hp.value !== target.actor.data.data.attributes.hp.max) {
    let newHP = target.actor.data.data.attributes.hp.value - 10;
    await target.actor.update({"data.attributes.hp.value": newHP})
  }
}
```

## Em caso de dúvida, vá olhar outros sistemas


- **Próximo:** []()
- **Anterior:** []()
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTkxOTkzMDk4MSwtMTU3OTkwNzk5MywxMT
k4MTIzNDUsLTU3MjMyMDcxOSw4NjIyMTMzNDMsNzYxMzc0NDk3
LDEzNjU0NjYyNCw3NDMzMjE5NTMsMTQxMjg1MDUzLC0zNjQwMT
YyMTRdfQ==
-->
