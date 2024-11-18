
# listar-grupos.sh

O `listar-grupos.sh` é um script em Bash que exibe os grupos do sistema conforme filtros específicos. Ele permite a busca de grupos por letras iniciais, finais ou combinações personalizadas, facilitando a administração do sistema.

## Autor
- **Leonardo N.D.**

## Descrição

Este script permite listar grupos do sistema de forma filtrada, de acordo com diferentes opções de padrões de busca. Ele também inclui uma opção de ajuda para mostrar as funcionalidades e como utilizá-lo.

### Exemplos de uso:

- Para listar grupos que começam com a letra 'r':
  ```bash
  ./listar-grupos.sh 1
  ```

- Para exibir o menu de ajuda:
  ```bash
  ./listar-grupos.sh -h
  ```

### Opções disponíveis:
**1** - Grupos que começam com a letra 'r'.
**2** - Grupos que terminam com a letra 't'.
**3** - Grupos que começam com 'r' e terminam com 't'.
**4** - Grupos que terminam com 'e' ou 'd'.
**5** - Grupos que não terminam com 'e' ou 'd'.
**6** - Grupos que começam com um dígito e a segunda letra seja 'u' ou 'd'.
**7** - Grupos com nomes de 2 a 4 dígitos de tamanho.
**8** - Grupos que começam com 'r' ou 's'.
**-h ou --help** - Exibe o menu de ajuda.

## Requisitos

Este script foi testado em sistemas com a versão 5.0.17 do `bash` e usa comandos básicos como `cut` e `grep` para processar os dados.

## Como usar

1. **Dê permissão de execução ao script**:
   ```bash
   chmod +x listar-grupos.sh
   ```

2. **Execute o script com a opção desejada**:
   ```bash
   ./listar-grupos.sh 1
   ```

## Histórico de versões

- **v1.0** - 11/11/2024: Início do programa e implementação das funcionalidades principais.
- **v1.1** - 11/11/2024: Adicionada a função de ajuda.
- **v1.2** - 11/11/2024: Melhoria no formato de exibição, inserção de negrito.

## Licença

Este script é de uso livre. Sinta-se à vontade para modificar e distribuir.
