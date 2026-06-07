# Recommandation de Produits Financiers — Apriori + CLIPS

Projet universitaire (Machine learning combiné aux règles d'association) illustrant la complémentarité entre machine learning et systèmes à base de règles appliquée au domaine financier.

## Problématique

Comment recommander des actions et ETFs à un investisseur en se basant sur les portefeuilles d'autres investisseurs ? C'est la logique des systèmes de recommandation type Amazon — *les investisseurs qui détiennent X détiennent aussi fréquemment Y* — appliquée à la finance.

## Approche

Le projet se déroule en deux étapes complémentaires :

1. **Algorithme Apriori** — découverte sans hypothèse préalable des associations entre produits financiers dans 35 000 portefeuilles simulés
2. **Système expert CLIPS** — encodage des 94 meilleures règles découvertes pour produire des recommandations personnalisées en temps réel

## Dataset

Le dataset a été créé manuellement car les vraies données de portefeuilles sont confidentielles. Il contient :

- **35 000 investisseurs** simulés 
- **15 produits financiers** : 8 actions (Apple, Microsoft, TotalEnergies, LVMH, Airbus, BNP Paribas, Tesla, Amazon) et 7 ETFs (S&P500, CAC40, Monde, Technologie, Énergie Verte, Obligations, Immobilier)

## Résultats

- Support minimum : 7% (soit au moins 2 450 investisseurs par combinaison)
- Confiance minimum : 70%
- Lift minimum retenu : 1.4
- **94 règles d'association** générées et encodées en CLIPS

Exemples de règles découvertes :

| Si l'investisseur détient | Alors recommander | Confiance |
|---|---|---|
| LVMH + Airbus + BNP Paribas + ETF CAC40 | TotalEnergies | 71% |
| Airbus + TotalEnergies + BNP Paribas | LVMH | 73% |
| Apple + Amazon + Tesla + ETF Technologie | Microsoft | 74% |
| LVMH + TotalEnergies + Airbus | ETF CAC40 | 81% |

## Structure du projet

```
├── portefeuille_investisseurs_clean.csv   # Dataset des 35 000 investisseurs
├── projet_LO12_portefeuille_investisseurs.ipynb  # Notebook Jupyter
├── recommandation.clp                     # Fichier CLIPS (94 règles)
└── README.md
```

## Installation

```bash
pip install pandas matplotlib mlxtend
```

## Utilisation

### Notebook Jupyter
Ouvrir `recommandation_portefeuille.ipynb` et exécuter les cellules dans l'ordre.

### CLIPS
Dans CLIPS IDE, charger le fichier de règles et tester un portefeuille :

```clips
(load "recommandation.clp")
(reset)
(assert (portefeuille (investisseur_id "test") (produits "Apple" "Amazon" "Tesla" "ETF_Technologie")))
(run)
(facts)
```

## Technologies

![Python](https://img.shields.io/badge/Python-3.x-blue)
![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-orange)
![CLIPS](https://img.shields.io/badge/CLIPS-6.4-green)

- **Python** — pandas, matplotlib, mlxtend
- **CLIPS 6.4** — système expert à base de règles
