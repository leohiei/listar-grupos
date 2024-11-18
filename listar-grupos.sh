#!/usr/bin/env bash
#
# listar-grupos.sh - Exibe grupos do sistema conforme filtros específicos
#
# Autor: Leonardo N.D.    
# Manutenção: Leonardo N.D.
#
# ------------------------------------------------------------------------ #
#  Este programa exibe grupos do sistema conforme filtros definidos, 
#  permitindo buscar grupos por padrão, como letras iniciais, finais ou 
#  combinações específicas. Também exibe uma mensagem de ajuda quando 
#  solicitada.
#
#  Exemplos:
#      $ ./listar-grupos.sh 1
#      Neste exemplo, o script irá listar grupos que começam com a letra 'r'.
#      $ ./listar-grupos.sh -h
#      Neste exemplo, o script irá exibir a mensagem de ajuda.
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 11/11/2024, Leonardo N.D.:
#       - Início do programa
#       - Implementação das funcionalidades principais
#   v1.1 11/11/2024, Leonardo N.D.:
#       - Adicionada a função de ajuda com as opções do script
#   v1.2 11/11/2024, Leonardo N.D.:
#       - Inserção de negrito
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 5.0.17
# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #
NEGRITO='\e[1m'
RESET='\e[0m'

# ------------------------------- FUNÇÕES ----------------------------------------- #

# Função para exibir grupos conforme os filtros
listar_grupos() {
    case $1 in
        1)
            echo -e "${NEGRITO}Grupos que começam com a letra 'r':${RESET}"
            cut -d: -f1 /etc/group | grep "^r"
            ;;
        2)
            echo -e "${NEGRITO}Grupos que terminam com a letra 't':${RESET}"
            cut -d: -f1 /etc/group | grep "t$"
            ;;
        3)
            echo -e "${NEGRITO}Grupos que começam com 'r' e terminam com 't':${RESET}"
            cut -d: -f1 /etc/group | grep "^r.*t$"
            ;;
        4)
            echo -e "${NEGRITO}Grupos que terminam com 'e' ou 'd':${RESET}"
            cut -d: -f1 /etc/group | grep "[ed]$"
            ;;
        5)
            echo -e "${NEGRITO}Grupos que não terminam com 'e' ou 'd':${RESET}"
            cut -d: -f1 /etc/group | grep -v "[ed]$"
            ;;
        6)
            echo -e "${NEGRITO}Grupos que começam com um dígito e a segunda letra seja 'u' ou 'd':${RESET}"
            cut -d: -f1 /etc/group | grep "^[0-9][ud]"
            ;;
        7)
            echo -e "${NEGRITO}Grupos com nomes de 2 a 4 dígitos de tamanho:${RESET}"
            cut -d: -f1 /etc/group | grep -E "^.{2,4}$"
            ;;
        8)
            echo -e "${NEGRITO}Grupos que começam com 'r' ou 's':${RESET}"
            cut -d: -f1 /etc/group | grep -E "^(r|s)"
            ;;
        *)
            echo -e "${NEGRITO}Opção inválida. Use um número entre 1 e 8.${RESET}"
            ;;
    esac
}

# Função para exibir o menu de ajuda
exibir_ajuda() {
    echo -e "${NEGRITO}Menu de Ajuda:${RESET}"
    echo -e "${NEGRITO}Uso:${RESET} $0 [opção]"
    echo -e "Opções disponíveis:"
    echo -e "  ${NEGRITO}1${RESET} - Grupos que começam com a letra 'r'."
    echo -e "  ${NEGRITO}2${RESET} - Grupos que terminam com a letra 't'."
    echo -e "  ${NEGRITO}3${RESET} - Grupos que começam com 'r' e terminam com 't'."
    echo -e "  ${NEGRITO}4${RESET} - Grupos que terminam com 'e' ou 'd'."
    echo -e "  ${NEGRITO}5${RESET} - Grupos que não terminam com 'e' ou 'd'."
    echo -e "  ${NEGRITO}6${RESET} - Grupos que começam com um dígito e a segunda letra seja 'u' ou 'd'."
    echo -e "  ${NEGRITO}7${RESET} - Grupos com nomes de 2 a 4 dígitos de tamanho."
    echo -e "  ${NEGRITO}8${RESET} - Grupos que começam com 'r' ou 's'."
    echo -e "  ${NEGRITO}-h ou --help${RESET} - Exibe este menu de ajuda."
}

# ------------------------------- EXECUÇÃO ----------------------------------------- #

# Verifica se o usuário pediu ajuda
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    exibir_ajuda
    exit 0
fi

# Loop para processar argumentos usando shift
while (( $# > 0 )); do
    echo -e "${NEGRITO}Processando argumento: $1${RESET}"
    listar_grupos "$1"
    shift
done
