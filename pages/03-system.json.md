# system.json

Depois de criar seu sistema, você precisará fazer algumas alterações no system.json. Aqui está como ele se parece para o Boilerplate System por padrão:

```json
{
  "name": "boilerplate",
  "title": "Boilerplate",
  "description": "The Boilerplate system for FoundryVTT!",
  "version": "1.0.0",
  "minimumCoreVersion": "0.5.5",
  "compatibleCoreVersion": "0.5.5",
  "templateVersion": 2,
  "author": "Asacolips",
  "esmodules": ["module/boilerplate.js"],
  "styles": ["css/boilerplate.css"],
  "scripts": [],
  "packs": [],
  "languages": [
    {
      "lang": "en",
      "name": "English",
      "path": "lang/en.json"
    }
  ],
  "gridDistance": 5,
  "gridUnits": "ft",
  "primaryTokenAttribute": "health",
  "secondaryTokenAttribute": "power",
  "url": "",
  "manifest": "",
  "download": "",
  "license": "LICENSE.txt"
}
```

Para uma análise completa de cada uma dessas propriedades, vá para [https://foundryvtt.com/article/system-development/](https://foundryvtt.com/article/system-development/). Mas há algumas importantes para examinar em detalhes:

- **name**: O nome seguro para máquina do seu sistema, como `meusistemarpg` ou `dnd5e`.
- **minimumCoreVersion**: A versão mínima do núcleo do Foundry necessária para instalar este sistema. Se houver mudanças na API no próprio Foundry para as quais você precisa fazer atualizações significativas, você vai querer atualizar este número.
- **compatibleCoreVersion**: A versão mais recentemente testada do Foundry para este sistema. Se o Foundry for mais novo que a versão listada aqui, os usuários receberão um aviso ao tentar instalar ou usar seu sistema. Você precisará atualizar isso frequentemente.
- **templateVersion**: Defina este valor como 2. Anteriormente, o Foundry suportava uma sintaxe template.json diferente que desde então foi removida, então isso dirá ao Foundry que seu sistema está usando a sintaxe de template atual, versão 2.
- **esmodules**: Um array de arquivos Javascript para importar como módulos ES. Se você precisar adicionar vários arquivos, pode fazer uma lista separada por vírgulas dentro dos colchetes `[]`.
- **styles**: Um array de arquivos CSS para usar no estilo do seu sistema.
- **scripts**: Um array de arquivos Javascript para incluir no seu sistema. Esses arquivos não usarão a sintaxe export/import que os módulos ES usam.
- **packs**: Pacotes de compêndio. Cada pacote será um objeto onde você especifica o nome, sistema, caminho e tipo de entidade. O sistema `dnd5e` tem vários exemplos excelentes de criação de um compêndio, e mais informações podem ser encontradas em [https://foundryvtt.com/article/compendium/](https://foundryvtt.com/article/compendium/).
- **languages**: Quaisquer definições de idioma que você criar precisarão ser listadas aqui. O Boilerplate System vem com um arquivo de idioma `en.json` incluído.
- **url**: O link para a página inicial do seu sistema, como a página Github ou Gitlab para ele.
- **manifest**: O link bruto para este arquivo `system.json`. O Foundry usa isso para descobrir informações sobre seu sistema para fins de atualização e instalação.
- **download**: O link bruto para baixar um arquivo zip do seu sistema. Isso pode ser construído por meio de ferramentas de compilação personalizadas, mas tanto o Github quanto o Gitlab geram arquivos zip do seu branch master que você pode usar aqui.

- **Anterior:** [Coisas para estar ciente](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/02-stuff-to-be-aware-of.md)
- **Próximo:** [template.json](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/04-template.json.md)
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTcwNjk3NDQ1LC0zMTk5NTk0ODcsNTQwMj
g0OTY4LDM4ODMwMjg5NSwtMjAzMjQwOTA2OCwtODk5MTE5Nzcw
XX0=
-->
