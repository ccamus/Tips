#!/bin/sh
# Script de renommage d'une arbo de fichiers
# Le script prend en entrée un répertoire
# Celui-ci doit contenir des sous-répertoire qui eux-mêmes contiennet des fichiers
# Les fichiers seront renommés en nom_sous_répertoire-nom_fichier

if [ ! -d "$1" ]
then
	echo "$1 n'est pas un répertoire"
	exit
fi

SAVE_IFS=$IFS
IFS=${IFS#??}
for d in $(find "$1" -type d | sed '1d')
do
	for f in $(ls "$d")
	do
		nomRep=$(echo "${d##*/}")
		mv "$d/$f" "$d/$nomRep-$f"
	done
done
IFS=$SAVE_IFS
