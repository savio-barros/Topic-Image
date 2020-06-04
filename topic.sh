#!/usr/bin/env bash
#--[ Informações ]---------------------------------------------------------------+
#                                                                                |
# Nome: Topic Image                                                              |
# Versão: 1.0                                                                    |
# Criador: Sávio Cavalcante                                                      |
# Dependências: imagemagick                                                      |
# Data de Criação: 04/06/2020                                                    |
#                                                                                |
#--[ Descrição ]-----------------------------------------------------------------+
#                                                                                |
# Crie uma imagem semelhante as imagens de topic do YouTube.                     |
#                                                                                |
#--[ Comandos ]------------------------------------------------------------------+
#                                                                                |
# -clone     : https://imagemagick.org/script/command-line-options.php#clone     |
# -resize    : https://imagemagick.org/script/command-line-options.php#resize    |
# -gravity   : https://imagemagick.org/script/command-line-options.php#gravity   |
# -extent    : https://imagemagick.org/script/command-line-options.php#extent    |
# -blur      : https://imagemagick.org/script/command-line-options.php#blur      |
# -quality   : https://imagemagick.org/script/command-line-options.php#quality   |
# -compose   : https://imagemagick.org/script/command-line-options.php#compose   |
# -composite : https://imagemagick.org/script/command-line-options.php#composite |
# -delete    : https://imagemagick.org/script/command-line-options.php#delete    |
#                                                                                |
#--------------------------------------------------------------------------------+

# Função de uso.
usage() {
  printf "%-5s: %s\n" "Uso" "$0 <Imagem>"
  exit 1
}

# Se o valor de 1 for nulo, retorne a função de uso.
[ -z "$1" ] && usage

# 1) Criar um clone da imagem e redimensionar para 1920x1080.
#
# 2) Criar um clone da imagem e redimensionar para 500x500.
#
# 3) Juntar o clone-1 e o clone-2 e criar um clone-3.
#
#   1. O clone-1 ─ imagem de fundo;
#   2. O clone-2 ─ imagem de centro;
#   3. O clone-3 ─ unir as duas imagens.
#
# 4) Deletar o clone-1 e o clone-2, clones criados, e renomear para a imagem final ("Imagem.png").
#
# 5) Imagem final.

convert "$1" \
	\( -clone 0 -resize '1920x1080^' -gravity center -extent '1920x1080' -blur 0x30 -quality 100 \) \
	\( -clone 0 -resize '500x500^' -gravity center -extent '500x500' -quality 100 \)                \
	\( -clone 1,2 -gravity center -compose over -composite \)                                       \
	-delete 0,1,2                                                                                   \
	"Imagem.png"                                                                                     

