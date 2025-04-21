# Cours d'Introduction au Prompt Engineering

## Partie 1 : Comprendre les modèles de langage et les bases du prompting

### Qu'est-ce qu'un modèle de langage ?

Un modèle de langage est un système d'intelligence artificielle entraîné sur d'énormes quantités de textes pour apprendre les modèles statistiques du langage humain. Ces modèles peuvent générer du texte, répondre à des questions, résumer des informations, traduire des langues, et bien plus encore.

Les modèles de langage récents comme GPT-4, Claude ou Llama fonctionnent selon un principe de prédiction : en se basant sur une séquence de mots donnée (le "prompt"), ils prédisent les mots qui devraient suivre logiquement.

### Qu'est-ce qu'un prompt ?

Un prompt est simplement l'entrée textuelle que vous fournissez à un modèle de langage pour obtenir une réponse. C'est comme poser une question ou donner une instruction à l'IA.

**Exemple simple :**
```
Explique-moi ce qu'est l'effet de serre en termes simples.
```

**Exercice 1 :** 
Dans votre notebook, essayez d'envoyer un prompt simple au modèle.

```python
# Importez la bibliothèque nécessaire dans votre notebook
import jupyter_ai as jai

# Exemple d'un prompt simple
prompt = "Donne-moi trois idées de desserts faciles à préparer."
response = await jai.chat("claude-3-sonnet", prompt)
print(response)
```

**Correction de l'exercice 1 :**
Le modèle devrait renvoyer une liste de trois desserts faciles. Par exemple :
```
Voici trois idées de desserts faciles à préparer :
1. Mousse au chocolat rapide (chocolat, œufs, sucre)
2. Salade de fruits frais de saison avec un peu de miel et de menthe
3. Panna cotta à la vanille (crème, sucre, gélatine, vanille)
```

Ce prompt simple fonctionne, mais n'est pas optimisé pour obtenir une réponse structurée ou précise.

### Les composants d'un bon prompt

Un prompt efficace contient généralement :
1. **Instructions claires** : Ce que vous voulez que le modèle fasse
2. **Contexte** : Informations pertinentes pour aider le modèle
3. **Format souhaité** : Structure de la réponse attendue
4. **Exemples** (parfois) : Illustrations de ce que vous attendez

**Exemple amélioré :**
```
Explique l'effet de serre en termes simples. 
Inclus une analogie que je pourrais utiliser pour l'expliquer à un enfant de 8 ans. 
Ta réponse ne doit pas dépasser 5 phrases.
```

**Exercice 2 :** 
Reprenez votre prompt de l'exercice 1 et améliorez-le en ajoutant des instructions claires, du contexte et un format souhaité.

```python
# Améliorez le prompt en ajoutant des instructions claires, contexte et format
prompt_ameliore = """
Je prépare un dîner pour des amis qui sont pressés par le temps.
Donne-moi trois idées de desserts faciles à préparer qui :
1. Nécessitent moins de 6 ingrédients
2. Se préparent en moins de 20 minutes
3. Ne nécessitent pas de four

Pour chaque dessert, liste les ingrédients nécessaires, le temps de préparation et une courte instruction en une phrase.
Format ta réponse sous forme de liste numérotée.
"""

response = await jai.chat("claude-3-sonnet", prompt_ameliore)
print(response)
```

**Correction de l'exercice 2 :**
Le modèle devrait maintenant renvoyer une réponse beaucoup plus structurée et précise :

```
1. Verrines de fromage blanc aux fruits rouges
   - Ingrédients : fromage blanc, fruits rouges surgelés, miel, biscuits, jus de citron
   - Temps de préparation : 10 minutes
   - Émiettez les biscuits au fond des verrines, mélangez le fromage blanc avec le miel et le jus de citron, ajoutez par-dessus et terminez avec les fruits rouges.

2. Mousse au chocolat express
   - Ingrédients : chocolat noir, œufs, sucre, crème liquide, sel
   - Temps de préparation : 15 minutes
   - Faites fondre le chocolat, incorporez les jaunes d'œufs et le sucre, puis ajoutez délicatement les blancs montés en neige avec une pincée de sel.

3. Tiramisu aux spéculoos sans cuisson
   - Ingrédients : mascarpone, spéculoos, café fort, sucre, cacao en poudre
   - Temps de préparation : 15 minutes
   - Alternez des couches de biscuits trempés dans le café et de crème mascarpone sucrée, puis saupoudrez de cacao et réservez au frais.
```

Notez comment le prompt amélioré permet d'obtenir exactement le format demandé et des réponses qui correspondent précisément aux critères spécifiés.

## Partie 2 : Techniques de base du prompt engineering

### Zero-shot prompting

Le zero-shot prompting consiste à demander au modèle d'effectuer une tâche sans lui fournir d'exemple préalable. Le modèle s'appuie uniquement sur ses connaissances préexistantes.

**Exemple :**
```
Classifie ce commentaire client comme positif, négatif ou neutre :
"J'ai attendu 30 minutes pour être servi, mais la nourriture était délicieuse et le personnel s'est excusé pour l'attente."
```

**Exercice 3 :** 
Créez un prompt zero-shot qui demande au modèle de résumer un article de votre choix en 3 points clés.

```python
# Exemple d'article sur l'intelligence artificielle (à remplacer par un article de votre choix)
article = """
L'intelligence artificielle générative bouleverse de nombreux secteurs, de la création de contenu à la programmation. 
OpenAI a récemment dévoilé GPT-5, un modèle multimodal capable d'analyser des images, de générer du code et de 
résoudre des problèmes complexes avec un raisonnement proche de celui des humains. Cependant, des préoccupations 
éthiques émergent concernant les biais, la désinformation et l'impact sur l'emploi. Des chercheurs du MIT ont 
proposé un cadre réglementaire pour encadrer ces technologies, tandis que l'UE finalise l'AI Act. Parallèlement, 
Google et Anthropic investissent massivement dans la sécurité de l'IA pour prévenir les usages malveillants.
"""

prompt_zero_shot = """
Résume l'article suivant en 3 points clés principaux, chacun exprimé en une seule phrase concise.

Article:
""" + article

response = await jai.chat("claude-3-sonnet", prompt_zero_shot)
print(response)
```

**Correction de l'exercice 3 :**
Voici un exemple de réponse attendue :

```
1. OpenAI a dévoilé GPT-5, un modèle multimodal avancé capable d'analyser des images, générer du code et résoudre des problèmes complexes avec un raisonnement quasi-humain.

2. Des préoccupations éthiques émergent concernant les biais, la désinformation et l'impact sur l'emploi causés par l'intelligence artificielle générative.

3. Des efforts réglementaires sont en cours, avec un cadre proposé par le MIT et l'AI Act de l'UE, tandis que Google et Anthropic investissent dans la sécurité de l'IA pour prévenir les usages malveillants.
```

Cette technique zero-shot fonctionne car le modèle comprend naturellement ce qu'est un "point clé" et comment résumer un texte, sans avoir besoin d'exemples.

### Few-shot prompting

Le few-shot prompting consiste à fournir quelques exemples au modèle avant de lui demander d'effectuer une tâche similaire.

**Exemple :**
```
Voici quelques exemples de classification de sentiments :

Texte : "Ce film était absolument incroyable !"
Sentiment : Positif

Texte : "Le service client est totalement inefficace."
Sentiment : Négatif

Texte : "Le produit est arrivé à l'heure prévue."
Sentiment : Neutre

Maintenant, classifie ce texte :
"La qualité est correcte mais le prix est un peu élevé pour ce que c'est."
```

**Exercice 4 :** 
Créez un prompt few-shot pour apprendre au modèle à transformer des phrases du langage formel en langage familier. Incluez 2-3 exemples puis demandez une transformation pour une nouvelle phrase.

```python
prompt_few_shot = """
Je voudrais que tu transformes des phrases du langage formel en langage familier. Voici quelques exemples :

Phrase formelle : "Je vous serais reconnaissant de me communiquer votre décision dans les plus brefs délais."
Phrase familière : "Fais-moi savoir rapidement ce que tu décides, ok ?"

Phrase formelle : "Il serait judicieux de reconsidérer notre stratégie à la lumière des récents développements."
Phrase familière : "Vu ce qui vient de se passer, on devrait revoir notre plan, non ?"

Phrase formelle : "Nous vous prions de nous excuser pour ce désagrément et vous assurons que des mesures ont été prises."
Phrase familière : "Désolé pour la galère, t'inquiète, on a réglé le problème !"

Maintenant, transforme cette phrase formelle en langage familier :
"Suite à notre entretien téléphonique, je me permets de vous adresser les documents contractuels comme convenu."
"""

response = await jai.chat("claude-3-sonnet", prompt_few_shot)
print(response)
```

**Correction de l'exercice 4 :**
Une réponse acceptable serait :

```
Phrase familière : "Comme on en a parlé au téléphone, je t'envoie les papiers du contrat, comme promis !"
```

Ou une variante comme :

```
Phrase familière : "Après notre coup de fil, je t'envoie les docs du contrat comme on avait dit !"
```

L'approche few-shot a permis au modèle d'apprendre le style de transformation souhaité grâce aux exemples fournis, ce qui lui permet de produire une réponse qui suit le même schéma de transformation.

## Partie 3 : Techniques avancées de raisonnement

### Chain-of-Thought (Chaîne de pensée)

La technique Chain-of-Thought encourage le modèle à décomposer un problème complexe en étapes de raisonnement intermédiaires avant de donner la réponse finale.

**Exemple :**
```
Question : Un stylo et un cahier coûtent ensemble 11 euros. Le stylo coûte 10 euros de moins que le cahier. Combien coûte le cahier ?

Réfléchis étape par étape pour trouver la réponse.
```

**Exercice 5 :** 
Créez un prompt qui utilise la technique Chain-of-Thought pour résoudre un problème de logique ou de mathématiques de votre choix.

```python
prompt_cot = """
Résous ce problème en expliquant ton raisonnement étape par étape :

Dans une bibliothèque, le rayon fiction contient 3 fois plus de livres que le rayon histoire. 
Le rayon sciences contient 50 livres de moins que le rayon fiction. 
Si la bibliothèque contient au total 550 livres dans ces trois rayons, combien de livres y a-t-il dans chaque rayon ?
"""

response = await jai.chat("claude-3-sonnet", prompt_cot)
print(response)
```

**Correction de l'exercice 5 :**
Une réponse utilisant la technique Chain-of-Thought devrait ressembler à ceci :

```
Je vais résoudre ce problème étape par étape.

Étape 1 : Définissons les variables.
Soit h = nombre de livres dans le rayon histoire
Soit f = nombre de livres dans le rayon fiction
Soit s = nombre de livres dans le rayon sciences

Étape 2 : Écrivons les relations entre ces variables.
On sait que f = 3h (le rayon fiction a 3 fois plus de livres que le rayon histoire)
On sait que s = f - 50 (le rayon sciences a 50 livres de moins que le rayon fiction)

Étape 3 : Écrivons l'équation du nombre total de livres.
h + f + s = 550

Étape 4 : Substituons les variables pour tout exprimer en fonction de h.
h + f + s = 550
h + 3h + (3h - 50) = 550
h + 3h + 3h - 50 = 550
7h - 50 = 550
7h = 600
h = 600/7 = 85.71...

Comme h doit être un nombre entier et que le problème semble avoir une solution exacte, je dois vérifier mon calcul.
7h = 550 + 50 = 600
h = 600/7 ≈ 85.71...

Je pense qu'il y a une erreur dans mon calcul. Reprenons.
h + 3h + (f - 50) = 550
h + 3h + (3h - 50) = 550
7h - 50 = 550
7h = 600
h = 600/7 ≈ 85.71...

Le nombre de livres doit être un entier. Il est possible que j'aie mal interprété le problème. Vérifions avec h = 86.
Si h = 86, alors f = 3h = 3 × 86 = 258 et s = f - 50 = 258 - 50 = 208
Total: 86 + 258 + 208 = 552

Essayons avec h = 85.
Si h = 85, alors f = 3h = 3 × 85 = 255 et s = f - 50 = 255 - 50 = 205
Total: 85 + 255 + 205 = 545

Donc la réponse exacte n'est ni h = 85 ni h = 86. Vérifions une fois de plus l'équation.
h + 3h + (f - 50) = 550
Si f = 3h, alors:
h + 3h + (3h - 50) = 550
h + 3h + 3h - 50 = 550
7h - 50 = 550
7h = 600
h = 85.71...

Comme nous ne pouvons pas avoir un nombre fractionnaire de livres, la solution pourrait être h = 85 avec une légère approximation, ou il y a une erreur dans l'énoncé du problème.

En réinterprétant le problème, il est possible que s = f - 50 signifie que le rayon sciences a 50 livres de moins que le rayon fiction, mais pas nécessairement que s est exactement égal à f - 50.

Dans ce cas, prenons h = 85:
f = 3h = 3 × 85 = 255
s = 550 - h - f = 550 - 85 - 255 = 210

Vérifions: 85 + 255 + 210 = 550 ✓
Et f - s = 255 - 210 = 45, ce qui est proche de 50 mais pas exact.

Donc la réponse la plus probable est:
Rayon histoire: 85 livres
Rayon fiction: 255 livres
Rayon sciences: 210 livres
```

Cette réponse illustre bien la technique Chain-of-Thought, car le modèle expose son raisonnement pas à pas, y compris ses erreurs potentielles et ses vérifications.

### Generated Knowledge (Connaissance générée)

Cette approche demande d'abord au modèle de générer des connaissances pertinentes sur un sujet avant de répondre à une question spécifique.

**Exemple :**
```
Étape 1 : Génère les faits importants à connaître sur la photosynthèse.

Étape 2 : En utilisant ces informations, explique pourquoi les feuilles des plantes sont généralement vertes.
```

**Exercice 6 :** 
Créez un prompt à deux étapes utilisant la technique Generated Knowledge pour expliquer un phénomène scientifique ou historique de votre choix.

```python
prompt_generated_knowledge = """
Étape 1 : Génère une liste de faits importants sur la formation des aurores boréales, en te concentrant sur les mécanismes physiques qui les produisent.

Étape 2 : En utilisant ces connaissances, explique pourquoi les aurores boréales sont principalement visibles près des pôles de la Terre et pourquoi elles présentent différentes couleurs.
"""

response = await jai.chat("claude-3-sonnet", prompt_generated_knowledge)
print(response)
```

**Correction de l'exercice 6 :**
Une réponse utilisant la technique Generated Knowledge pourrait ressembler à ceci :

```
Étape 1 : Faits importants sur la formation des aurores boréales

1. Les aurores boréales sont causées par des particules chargées (principalement des électrons et des protons) provenant du Soleil.
2. Ces particules sont émises lors d'éruptions solaires et forment ce qu'on appelle le vent solaire.
3. La Terre possède un champ magnétique (magnétosphère) qui agit comme un bouclier contre ces particules.
4. Les particules du vent solaire qui parviennent à pénétrer la magnétosphère sont guidées vers les pôles magnétiques.
5. Lorsque ces particules chargées entrent en collision avec des atomes et des molécules de l'atmosphère terrestre, elles excitent leurs électrons.
6. En revenant à leur état d'énergie normal, ces atomes excités émettent des photons (lumière).
7. L'oxygène émet généralement des lumières vertes ou rouges selon l'altitude.
8. L'azote émet généralement des lumières bleues ou violettes.
9. Ces collisions se produisent principalement dans la haute atmosphère, entre 80 et 300 km d'altitude.
10. L'intensité des aurores dépend de l'activité solaire et des tempêtes géomagnétiques.

Étape 2 : Explication de la localisation polaire et des couleurs des aurores

Les aurores boréales sont principalement visibles près des pôles de la Terre en raison de la structure du champ magnétique terrestre. Le champ magnétique forme une sorte d'entonnoir aux pôles, dirigeant les particules chargées du vent solaire vers ces régions. Au niveau de l'équateur, le champ magnétique est parallèle à la surface de la Terre, ce qui empêche les particules d'y pénétrer facilement. En revanche, aux pôles, les lignes du champ magnétique sont presque perpendiculaires à la surface, créant des "entonnoirs" ou des "fenêtres" par lesquelles les particules chargées peuvent plus facilement atteindre l'atmosphère. C'est pourquoi les aurores sont concentrées dans des zones annulaires autour des pôles magnétiques, connues sous le nom d'ovales auroraux.

Quant aux différentes couleurs des aurores, elles dépendent principalement du type de gaz atmosphérique avec lequel les particules chargées entrent en collision et de l'altitude de ces collisions. L'oxygène, lorsqu'il est excité à haute altitude (environ 200-300 km), produit une lumière rouge caractéristique. À des altitudes plus basses (80-150 km), l'oxygène émet une lumière verte, qui est la couleur la plus commune dans les aurores. L'azote, quant à lui, produit des teintes bleues et violettes, ainsi que des bordures roses lors de tempêtes géomagnétiques particulièrement intenses. Ces différentes émissions de couleur créent le spectacle visuel fascinant et changeant des aurores boréales.
```

Cette réponse démontre bien la technique Generated Knowledge : le modèle a d'abord généré une base de connaissances pertinentes sur le sujet, puis a utilisé ces informations pour répondre à une question spécifique.

## Partie 4 : Techniques d'amélioration et de raffinement

### Least-to-Most (Du plus simple au plus complexe)

Cette technique décompose un problème complexe en sous-problèmes plus simples, qui sont résolus séquentiellement.

**Exemple :**
```
Problème : Une bibliothèque a 5 étagères avec 8 livres par étagère. Si on retire 7 livres et qu'on ajoute 12 nouveaux livres répartis équitablement, combien y aura-t-il de livres par étagère ?

Sous-problème 1 : Combien y a-t-il de livres au total initialement ?
Sous-problème 2 : Combien y aura-t-il de livres après avoir retiré 7 livres et ajouté 12 nouveaux ?
Sous-problème 3 : Si ces livres sont répartis équitablement sur 5 étagères, combien y aura-t-il de livres par étagère ?
```

**Exercice 7 :** 
Identifiez un problème complexe et créez un prompt utilisant l'approche Least-to-Most pour le résoudre.

```python
prompt_least_to_most = """
Je vais te présenter un problème complexe. Décompose-le en sous-problèmes plus simples, puis résous-les un par un pour arriver à la solution finale.

Problème : Dans un tournoi d'échecs, 8 joueurs s'affrontent selon un système où chaque joueur joue exactement une fois contre chacun des autres joueurs. Pour chaque partie, le gagnant reçoit 1 point, le perdant 0 point, et en cas de match nul, chaque joueur reçoit 0,5 point.

À la fin du tournoi, les scores finaux des joueurs sont tous différents et forment une suite arithmétique. Quel est le score du joueur arrivé en 3ème position ?

Résous ce problème étape par étape.
"""

response = await jai.chat("claude-3-sonnet", prompt_least_to_most)
print(response)
```

**Correction de l'exercice 7 :**
Une réponse utilisant l'approche Least-to-Most pourrait ressembler à ceci :

```
Je vais décomposer ce problème en sous-problèmes plus simples et les résoudre un par un.

Sous-problème 1 : Combien de matches sont joués au total dans le tournoi ?
Dans un tournoi où chaque joueur affronte tous les autres exactement une fois, le nombre total de matches est donné par la formule n(n-1)/2, où n est le nombre de joueurs.
Avec n = 8 joueurs, le nombre total de matches est donc 8 × 7 / 2 = 28 matches.

Sous-problème 2 : Combien de points sont distribués au total dans le tournoi ?
Chaque match distribue exactement 1 point au total (soit 1 point pour un gagnant, soit 0,5 point pour chaque joueur en cas de match nul).
Avec 28 matches, il y a donc exactement 28 points distribués au total.

Sous-problème 3 : Combien de points chaque joueur peut-il gagner au maximum ?
Chaque joueur joue contre 7 autres joueurs (tous sauf lui-même).
Le score maximum possible pour un joueur est donc de 7 points (en gagnant tous ses matches).

Sous-problème 4 : Quels sont les scores possibles dans une suite arithmétique de 8 termes tous différents ?
Une suite arithmétique a la forme a, a+d, a+2d, a+3d, ..., où a est le premier terme et d est la raison (différence constante entre deux termes consécutifs).
Pour 8 joueurs, nous avons : a, a+d, a+2d, a+3d, a+4d, a+5d, a+6d, a+7d.

Sous-problème 5 : Quelles contraintes avons-nous sur cette suite arithmétique ?
- La somme de tous les termes doit être égale à 28 (le nombre total de points distribués)
- Chaque terme doit être compris entre 0 et 7 inclus (les scores possibles)
- Tous les termes doivent être différents
- Les valeurs doivent être plausibles pour un tournoi d'échecs (probablement des multiples de 0,5)

Sous-problème 6 : Calculons la somme des termes de notre suite arithmétique.
La somme d'une suite arithmétique est donnée par la formule S = n(a + l)/2, où n est le nombre de termes, a est le premier terme et l est le dernier terme.
Dans notre cas, n = 8, a = a, et l = a+7d.
Donc, S = 8(a + (a+7d))/2 = 8(2a+7d)/2 = 8a + 28d.

Sous-problème 7 : Résolvons pour a et d.
Nous savons que S = 28, donc 8a + 28d = 28, ce qui se simplifie en a + 3.5d = 3.5.

Nous avons plusieurs possibilités pour a et d. Mais nous savons aussi que :
- a ≥ 0 (un score ne peut être négatif)
- a + 7d ≤ 7 (le score maximum est 7)
- d > 0 (les scores sont tous différents et en ordre croissant)

Si nous essayons d = 0.5 (une valeur plausible pour un tournoi d'échecs), alors a + 3.5 × 0.5 = 3.5, donc a = 3.5 - 1.75 = 1.75.

Vérifions si cette valeur de a satisfait nos contraintes :
- a = 1.75 ≥ 0 ✓
- a + 7d = 1.75 + 7 × 0.5 = 1.75 + 3.5 = 5.25 ≤ 7 ✓

Sous-problème 8 : Vérifions la suite complète.
Avec a = 1.75 et d = 0.5, notre suite arithmétique est :
1.75, 2.25, 2.75, 3.25, 3.75, 4.25, 4.75, 5.25

Vérifions la somme : 1.75 + 2.25 + 2.75 + 3.25 + 3.75 + 4.25 + 4.75 + 5.25 = 28 ✓

Sous-problème 9 : Quel est le score du joueur arrivé en 3ème position ?
Le joueur en 3ème position a le 6ème score en partant du bas (puisqu'il y a 8 joueurs au total).
Le 6ème terme de notre suite est a + 5d = 1.75 + 5 × 0.5 = 1.75 + 2.5 = 4.25.

Donc, le score du joueur arrivé en 3ème position est de 4.25 points.

Vérifions une dernière fois :
- Cette suite arithmétique a une somme de 28 points ✓
- Tous les scores sont différents ✓
- Tous les scores sont plausibles (entre 0 et 7 et sont des multiples de 0.5) ✓

La réponse est donc 4.25 points.
```

Cette réponse illustre parfaitement l'approche Least-to-Most, car le problème complexe est décomposé en sous-problèmes plus simples qui sont résolus séquentiellement, chaque étape s'appuyant sur les résultats des précédentes.

### Self-Refine (Auto-amélioration)

Cette technique consiste à demander au modèle de générer une première réponse, puis de la critiquer et de l'améliorer.

**Exemple :**
```
Étape 1 : Écris un court paragraphe expliquant comment fonctionne un moteur à combustion interne.

Étape 2 : Identifie les points faibles de ton explication précédente. Qu'est-ce qui pourrait être clarifié ou amélioré ?

Étape 3 : Réécris l'explication en tenant compte de ces améliorations.
```

**Exercice 8 :** 
Créez un prompt qui utilise la technique Self-Refine pour générer puis améliorer un texte explicatif sur un sujet de votre choix.

```python
prompt_self_refine = """
Je vais te demander d'utiliser la technique Self-Refine pour expliquer un concept scientifique.

Étape 1 : Écris un court paragraphe (environ 5 phrases) expliquant comment fonctionne l'apprentissage automatique (machine learning) pour un public non-technique.

Étape 2 : Critique ton explication précédente. Identifie au moins 3 problèmes spécifiques : imprécisions, jargon trop technique, analogies confuses, manque de contexte, etc.

Étape 3 : Réécris une explication améliorée qui corrige les problèmes identifiés à l'étape 2.

Étape 4 : Évalue si la nouvelle explication est meilleure que la première et explique pourquoi.
"""

response = await jai.chat("claude-3-sonnet", prompt_self_refine)
print(response)
```

**Correction de l'exercice 8 :**
Une réponse utilisant la technique Self-Refine pourrait ressembler à ceci :

```
Étape 1 : Explication initiale de l'apprentissage automatique

L'apprentissage automatique est une branche de l'intelligence artificielle qui permet aux ordinateurs d'apprendre à partir de données sans être explicitement programmés. Il s'appuie sur des algorithmes qui identifient des modèles dans les données et construisent des modèles mathématiques pour faire des prédictions ou prendre des décisions. Ces modèles s'améliorent progressivement avec l'expérience, c'est-à-dire avec l'exposition à davantage de données d'entraînement. Le machine learning est utilisé dans diverses applications comme la reconnaissance d'images, les recommandations de produits ou la détection de fraudes. Les réseaux de neurones, qui s'inspirent du fonctionnement du cerveau humain, sont particulièrement efficaces pour des tâches complexes comme la traduction automatique.

Étape 2 : Critique de l'explication initiale

1. Problème de jargon technique : J'ai utilisé des termes comme "algorithmes", "modèles mathématiques" et "réseaux de neurones" sans les expliquer, ce qui peut être intimidant pour un public non-technique.

2. Manque d'exemples concrets et quotidiens : L'explication reste abstraite et ne montre pas comment l'apprentissage automatique affecte la vie quotidienne des gens.

3. Analogie incomplète avec le cerveau humain : J'ai mentionné que les réseaux de neurones s'inspirent du cerveau humain sans expliquer comment ni pourquoi cette comparaison est pertinente ou limitée.

Étape 3 : Explication améliorée

## Partie 5 : Techniques avancées de dialogue et de décomposition

### Maieutic Prompting (Questionnement maïeutique)

Cette technique, inspirée de la méthode socratique, guide le modèle à travers une série de questions pour développer progressivement sa compréhension et son raisonnement.

**Exemple :**
```
Je veux comprendre les implications éthiques de l'intelligence artificielle. Pose-moi une série de questions qui m'aideront à approfondir ma réflexion sur ce sujet.
```

**Exercice 9 :** 
Créez un prompt qui utilise l'approche maïeutique pour explorer un sujet complexe de votre choix (éthique, philosophique, scientifique, etc.).

### Atomic Prompting (Prompting atomique)

Cette technique consiste à décomposer une tâche complexe en "atomes" de prompts individuels, chacun ciblant un aspect spécifique du problème.

**Exemple :**
```
Tâche globale : Analyser un poème

Prompt atomique 1 : Identifie le schéma de rimes dans ce poème.
Prompt atomique 2 : Quels sont les principaux thèmes abordés dans ce poème ?
Prompt atomique 3 : Identifie et explique trois figures de style utilisées dans ce poème.
Prompt atomique 4 : Synthétise les réponses précédentes en une analyse cohérente.
```

**Exercice 10 :** 
Choisissez une tâche complexe et décomposez-la en 3-4 prompts atomiques qui, ensemble, aideront à résoudre le problème global.

## Partie 6 : Conseils pratiques et bonnes pratiques

### Conseils pour améliorer vos prompts

1. **Soyez spécifique** : Plus votre instruction est précise, plus la réponse sera pertinente
2. **Itérez** : Raffinez progressivement vos prompts en fonction des résultats
3. **Utilisez des délimiteurs** : Séparez clairement les différentes parties de votre prompt
4. **Contrôlez la longueur** : Indiquez la longueur ou le niveau de détail souhaité
5. **Précisez le format** : Indiquez le format attendu (liste, paragraphes, tableau, etc.)

**Exemple avec délimiteurs :**
```
# CONTEXTE
Je suis un enseignant préparant un cours sur les énergies renouvelables pour des élèves de lycée.

# INSTRUCTION
Génère un plan de cours structuré sur l'énergie solaire.

# FORMAT SOUHAITÉ
- Titre principal
- 3 à 4 sections principales
- 2 à 3 sous-points par section
- 2 idées d'activités pratiques
- Durée estimée: cours de 2 heures
```

**Exercice final :** 
Choisissez une tâche complète et créez un prompt élaboré combinant plusieurs techniques vues dans ce cours pour obtenir le meilleur résultat possible.

## Conclusion

Le prompt engineering est un art qui se perfectionne avec la pratique. N'hésitez pas à expérimenter différentes approches, à combiner les techniques et à analyser ce qui fonctionne le mieux pour chaque type de tâche.

Rappelez-vous que les modèles de langage ont leurs limites et leurs biais. Un bon prompt engineer apprend non seulement à maximiser les capacités des modèles, mais aussi à reconnaître leurs points faibles et à adapter ses attentes en conséquence.

Bonne pratique !