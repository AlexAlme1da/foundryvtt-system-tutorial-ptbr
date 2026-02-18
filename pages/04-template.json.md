# template.json

O modelo de dados do seu sistema para fichas de personagem e item é definido em `template.json`. Quaisquer alterações que você fizer neste arquivo exigirão que você retorne à tela de configuração do Foundry e reinicie seu mundo. O template.json para o Boilerplate System se parece com isto.

```json
{
  "Actor": {
    "types": ["character"],
    "templates": {
      "base": {
        "health": {
          "value": 10,
          "min": 0,
          "max": 10
        },
        "power": {
          "value": 5,
          "min": 0,
          "max": 5
        }
      }
    },
    "character": {
      "templates": ["base"],
      "biography": "",
      "attributes": {
        "level": {
          "value": 1
        }
      },
      "abilities": {
        "str": {
          "value": 10
        },
        "dex": {
          "value": 10
        },
        "con": {
          "value": 10
        },
        "int": {
          "value": 10
        },
        "wis": {
          "value": 10
        },
        "cha": {
          "value": 10
        }
      }
    }
  },
  "Item": {
    "types": ["item"],
    "templates": {
      "base": {
        "description": ""
      }
    },
    "item": {
      "templates": ["base"],
      "quantity": 1,
      "weight": 0
    }
  }
}
```

Esse arquivo pode ser um pouco difícil de entender, então vamos dividi-lo em um pouco mais de detalhe.

## A estrutura básica

A visualização de nível superior do template.json se parece com isto:

```json
{
  "Actor": {},
  "Item": {},
}
```

Essas duas propriedades correspondem aos dois tipos de entidade nas quais você pode fazer alterações no seu template.json. Ambas suportam 3 propriedades:

```json
{
  "Actor": {
    "types": ["character", "npc"],
    "templates": {
      "base": {
        "health": {
          "value": 10,
          "max": 10
        }
      }
    },
    "character": {
      "templates": ["base"],
      "foo": "",
      "bar": {
        "value": ""
      }
    },
    "npc": {
      "templates": ["base"]
    }
  }
}
```

A primeira propriedade, `types`, define os diferentes subtipos deste tipo de entidade que seu sistema usará. Neste exemplo, esses tipos são `character` e `npc`, mas você pode criar quantos precisar.

A segunda propriedade, `templates`, é onde você define atributos comuns que podem ser aplicados a qualquer um dos outros subtipos. Neste exemplo, definimos um template `base` que tem uma propriedade `health` que tem propriedades `value` e `max`.

A terceira e quarta propriedades, `character` e `npc`, corresponderão ao que você definiu na propriedade `types` anteriormente. Se você tivesse mais ou menos tipos definidos, continuaria adicionando-os um após o outro, assim como `character` e `npc` vieram depois da propriedade `templates`. Cada um desses subtipos pode ter templates aplicados a eles, como o template `base` neste exemplo. Eles também podem ter propriedades personalizadas exclusivas de seu subtipo, como as propriedades `foo` e `bar` neste exemplo.

Para mais detalhes, vá para [https://foundryvtt.com/article/system-development/](https://foundryvtt.com/article/system-development/) e role para baixo até a seção **The Data Template**.

## Atores vs. Itens

Qual é a diferença entre um Ator e um Item? Isso depende do que seu sistema precisa, e somente você pode responder essa pergunta. Em um nível técnico, atores terão tokens e podem ser adicionados a cenas, enquanto itens são normalmente usados apenas para criar conteúdo de compêndio e depois anexá-los a atores como itens possuídos. Itens não são apenas itens/equipamentos na maioria dos sistemas RPG; eles podem ser outras coisas também, como Características de Classe, Magias ou Talentos. Se seu sistema precisa rastrear mais do que algumas propriedades em algo que pode ser adicionado a fichas de personagem como uma peça discreta, provavelmente deveria ser um tipo de item.

Por exemplo, este trecho adicionaria três tipos de item diferentes ao seu sistema, alguns dos quais compartilham recursos:

```json
"Item": {
  "types": ["item", "feature", "spell"],
  "templates": {
    "base": {
      "description": ""
    },
    "class": {
      "classes": [],
      "level": 0
    }
  },
  "item": {
    "templates": ["base"],
    "quantity": 1,
    "weight": 0
  },
  "feature": {
    "templates": ["base", "class"],
    "usage": "",
    "roll": ""
  },
  "spell": {
    "templates": ["base", "class"],
    "spellLevel": 1,
	"school": "",
	"save_dc": "",
	"effect": ""
  }
}
```

- **Anterior:** [system.json](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/03-system.json.md)
- **Próximo:** [Criando seu arquivo JavaScript principal do sistema](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/05-creating-main-javascript.md)
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTgyODcyMTE1NywzMTM0MjE0NzEsOTYwMD
AzNDI1LDc3MTk1MTExOSwtMTY5NzM4NzQ0Nl19
-->
