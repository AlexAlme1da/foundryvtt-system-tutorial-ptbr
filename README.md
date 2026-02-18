# Tutorial de Sistema - Do Início ao Fim

> **⚠️ TRADUÇÃO NÃO OFICIAL**
>
> Esta é uma tradução não oficial para português brasileiro do tutorial original de desenvolvimento de sistemas para Foundry VTT criado por Asacolips.
>
> **Repositório original:** [foundryvtt-system-tutorial](https://gitlab.com/asacolips-projects/foundry-mods/foundryvtt-system-tutorial) (em inglês)
>
> **Autor original:** Asacolips (@asacolips#1867 no Discord do Foundry)

---

Bem-vindo ao tutorial de desenvolvimento de sistemas para FoundryVTT! O objetivo é guiá-lo através do desenvolvimento de sistemas com pouco ou nenhum conhecimento do Foundry ou das linguagens que ele usa. No início, vamos percorrer os passos para criar sistemas relativamente simples que permitem coletar dados para coisas como estatísticas e atributos e calcular modificadores para eles, mas eventualmente chegaremos a tópicos mais avançados como fazer rolagens de dados da sua ficha ou permitir que itens sejam convertidos em macros.

Se você tiver alguma dúvida sobre o tutorial original, pode encontrar o autor no Discord do Foundry como @asacolips#1867. E com isso, vamos ao tutorial!

- [Montando um sistema vazio](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/01-getting-started.md)
	- Começar com um sistema boilerplate
	- Usando SWS
	- Usando um CLI
- [Coisas para estar ciente](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/02-stuff-to-be-aware-of.md)
	- Scripts ou módulos ES6?
	- Pré-processadores CSS
	- Handlebars
	- E quanto a bibliotecas de terceiros?
	- Localização
- [system.json](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/03-system.json.md)
- [template.json](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/04-template.json.md)
	- Definindo tipos de atores e itens
- [Criando seu arquivo JavaScript principal do sistema](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/05-creating-main-javascript.md)
- [Estendendo a classe Actor](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/06-extending-actor-class.md)
	- Dados básicos vs. dados derivados
	- Criando valores derivados com prepareData()
	- _prepareCharacterData()
- [Estendendo a classe ActorSheet](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/07-extending-actor-sheet-class.md)
	- defaultOptions
	- getData()
	- activateListeners()
- [Criando templates HTML para suas fichas de atores](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/08-creating-html-templates.md)
- [Estendendo a classe Item](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/09-extending-item-class.md)
- [Estendendo a classe ItemSheet](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/10-extending-item-sheet-class.md)
- Outras coisas para fazer em fichas de atores
	- [Criando botões roláveis com event listeners](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/11.1-rollable.md)
	- [Agrupando itens por tipo](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/11.3-grouping-items.md)
	- [Separando tipos de itens em abas](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/11.4-item-type-tabs.md)
	- [Adicionando suporte à barra de macros para seus itens](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/16-macrobar-support.md)

## Seções em Desenvolvimento

Além do acima, há várias outras seções que serão adicionadas a este tutorial ao longo do tempo! Volte a cada poucas semanas para ver se alguma adição foi feita. Se há um tópico relacionado ao desenvolvimento de sistemas que você gostaria de ver adicionado a esta lista, me envie uma mensagem no Discord!

- Outras coisas para fazer em fichas de atores
	- Criando botões roláveis com diálogos
	- Criando estruturas de dados semelhantes a itens
	- Consultando entidades com map e filter
	- Em caso de dúvida, olhe outros sistemas
- CONFIG e coisas para fazer com isso
- Mais Localização
- TabsV2
- Flags
- Configurações de Sistema
- Tornando coisas arrastáveis em sua ficha
- Sobrescrevendo comportamentos do núcleo (como o rastreador de combate)
- Padrões de desenvolvimento para estar ciente na API
<!--stackedit_data:
eyJoaXN0b3J5IjpbMzMyMTM4OSwtMjAxOTUyNzIyLDE0ODkwNT
MzNDQsMTcyMDgzMjAxMywtOTExNTQ0MTM0LDEwODE0ODc0NDEs
LTMxOTEwNTAsLTIwNzA0MTg1NDgsLTg2MjE4OTA5NiwxNTgwMT
U1MDY4LC0xNTMwNDg1MzA2LDEwNTcwMTgwNDcsLTMzOTU2ODc4
MCwtMzM5NTY4NzgwXX0=
-->
