### Emacs: -*- coding: utf-8; fill-column: 62; comment-column: 27; -*-
##
## Copyright (C) 2018 Vincent Goulet
##
## Ce fichier fait partie du projet
## «Théorie de la crédibilité avec R»
## http://github.com/vigou3/theorie-credibilite-avec-r
##
## Cette création est mise à disposition selon le contrat
## Attribution-Partage dans les mêmes conditions 4.0
## International de Creative Commons.
## http://creativecommons.org/licenses/by-sa/4.0/

###
### EXEMPLE 4.4
###

## Charger le package actuar en mémoire
library(actuar)

## Les données doivent se trouver dans un data frame ou une matrice,
## avec une colonne pour identifier le "numéro" du contrat. Les
## colonnes doivent être étiquetées.
(x <- data.frame(contract = 1:3,
                 matrix(c(0, 3, 3,
                          1, 4, 3,
                          2, 2, 2,
                          1, 1, 1,
                          2, 4, 2,
                          0, 4, 1), nrow = 3)))

## Ajustement du modèle de Bühlmann aux données. Par défaut, la
## fonction considérera que toutes les colonnes (autres que celles
## présentes dans la formule) contiennent des données.
(fit <- cm(~ contract, x))                 # appel simple
(fit <- cm(~ contract, x, ratios = X1:X6)) # équivalent ici

## Calcul des primes de crédibilité.
predict(fit)

## Résultats détaillés.
summary(fit)
