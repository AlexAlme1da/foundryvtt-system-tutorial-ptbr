# Como começar

Ao construir um novo sistema, você tem várias opções para escolher. Você pode copiar um sistema existente (dependendo de sua licença) como o sistema Simple World-building, pode usar um gerador de sistemas ou pode começar do zero e ter controle total.

## Opção 1: Download

1. Baixe uma versão zip do [Boilerplate System](https://gitlab.com/asacolips-projects/foundry-mods/boilerplate/-/archive/master/boilerplate-master.zip)
2. Extraia para o diretório `/Data/systems` na pasta userData do seu Foundry e renomeie de `boilerplate-master` para o nome do seu sistema (minúsculas, seguro para máquina).
3. Procure no diretório por quaisquer arquivos com o nome `boilerplate` e renomeie-os para o nome seguro para máquina do seu sistema, como `meusistemarpg`.
4. Procure nos arquivos por quaisquer ocorrências de `Boilerplate` (sensível a maiúsculas) e substitua-as por uma versão capitalizada do nome do seu sistema que ainda seja segura para máquina, como `MeuSistemaRPG`. Estes são normalmente usados para as classes nos arquivos Javascript.
5. Procure nos arquivos por quaisquer ocorrências de `boilerplate` (sensível a maiúsculas) e substitua-as por uma versão em minúsculas segura para máquina do nome do seu sistema, como `meusistemarpg`.
6. Se as instruções de substituição do passo 4 também incluíram atualizar sua descrição no system.json, você deve editar isso agora para ser mais legível, como "Meu Sistema RPG".

## Opção 2: Gerar com npm

Você precisará estar confortável com seu terminal/linha de comando e ter o npm instalado. Se estiver, execute os seguintes dois comandos:

```
npm install -g yo
npm install -g generator-foundry
```

Depois disso, você só precisa abrir seu diretório `/Data/systems` na pasta userData do Foundry no seu terminal e executar

```
yo foundry
```
para gerar seu sistema. O gerador perguntará qual deve ser o nome do seu sistema e fornecerá exemplos.


A partir daqui, você pode pular para a próxima página ou continuar lendo se quiser ler sobre as outras opções para iniciar um novo sistema.

## Outras opções

Se você quiser ver outras opções para começar a construir um novo sistema a partir do qual começar, veja a página [Outras opções](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/01.2-other-options.md).

- **Próximo**: [Coisas para estar ciente](https://github.com/AlexAlme1da/foundryvtt-system-tutorial-ptbr/blob/master/pages/02-stuff-to-be-aware-of.md)
<!--stackedit_data:
eyJoaXN0b3J5IjpbNjc2OTkzODAzLDEyMDQ3NDk5NzcsLTE4OT
M0NDcxNTYsLTE5NjUyNzE2NjQsLTg1MjczOTM0NSwxODMxNDQy
NDE2LDE5MzMzNDY2ODAsLTIxNDYxNjU3NjNdfQ==
-->
