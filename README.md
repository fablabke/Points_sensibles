
# Points sensibles : une broderie participative 
## **Résidence Fablab’ke 2023 - Un projet de broderie générative pour visualiser nos interactions.**


Bonjour ! 

Je suis Juliette Vandermosten, designer sociale, et mon travail porte principalement sur des outils de communication. Comment le design peut-il créer un contexte dans lequel la vulnérabilité, la confiance et les échanges profonds sont possibles ?


Au cours de l'automne 2023, j'ai été artiste en résidence au [Fablab'ke](https://fablabke.be/), un atelier de fabrication numérique à vocation pédagogique situé à la MCCS - Maison des Cultures et de la Cohésion Sociale de Molenbeek (Bruxelles).

Je suis arrivée au Fablab’ke avec l’intention d’explorer comment un objet tactile peut amener différentes manières de communiquer. Mes expérimentations avec la brodeuse numérique du fablab m’ont ensuite amenée à combiner textile et programmation, et à explorer la broderie générative. 

J’ai donc développé un système de broderie générative à l’aide des programmes Arduino et Processing. Le résultat de cette recherche a été présenté au public le dimanche 3 décembre lors de l’événement [_Dimanche à la Maison_](https://fablabke.be/2023/12/12/dimanche-a-la-maison/) organisé par la Maison des Cultures.
Le public était invité à partager un moment avec moi et à participer ainsi à broder collectivement une banderole de nos émotions. Concrètement, j’accueillais les participant.es avec des cartes tirées du jeu « Dixit », cartes qui servaient de point de départ pour engager une conversation, se raconter des histoires ou se tirer les cartes façon tarot. Durant cette conversation, les participant.es étaient invités à manipuler un cube rembourré -sorte de balle anti-stress- dans lequel se trouvait un capteur flex. La manipulation de ce cube générait ensuite un motif de broderie unique, qui était ensuite envoyé à la brodeuse numérique. Ainsi, d'histoire en histoire, de conversation en conversation, de motif en motif, la banderole a pris forme. 

<img src="https://github.com/fablabke/Points_sensibles/assets/158562798/2a05eaf6-766c-407c-b005-f7f6dc443ab2" height="500">
<img src="https://github.com/fablabke/Points_sensibles/assets/158562798/4fc5172c-02a8-4dba-9521-c3adb1b467a3" height="500">

_Le projet _Points Sensibles_ lors de l'événement _Dimanche à la Maison_ à la MCCS._






### 1. Le cube : comment utiliser un capteur flex.

Nous avons utilisé Arduino pour récolter les données d'un capteur flex, capteur qui est ensuite dissimulé dans un cube de tissu rempli de mousse. 
Le fichier Arduino est disponible [ICI](https://github.com/fablabke/Points_sensibles/tree/main/Arduino).

Nous avons utilisé le plan de raccordement de [ce tutoriel d'Instructables](https://www.instructables.com/How-to-use-a-Flex-Sensor-Arduino-Tutorial/). À la seule différence que nous n'avons pas raccordé de LED et donc pas utilisé les cables verts.


<img src="https://github.com/fablabke/Points_sensibles/assets/158562798/b8cbf6cb-6228-472f-8d50-791b6fbc32b6" height="500">

_Le plan de raccordement proposé par Instructables._

<img src="https://github.com/fablabke/Points_sensibles/assets/158562798/9933cdd2-263c-47ee-8da8-b9f1cd80648c" width="400"> 
<img src="https://github.com/fablabke/Points_sensibles/assets/158562798/f209e61f-27e6-44fa-879b-fd13b28720e9" width="400">

_À gauche, l'Arduino raccordé à un capteur flex. À droite, les différents essais de balles anti-stress. Environ 4cm de large._






### 2. Processing : utiliser les données du capteur flex et la librairie PEmbroider.

Le fichier Processing du projet est disponible [ICI](https://github.com/fablabke/Points_sensibles/tree/main/Processing-PEmbroider). 

Dans le dossier Archives, vous trouverez également des fichiers Processing qui permettent de se familiariser en plusieurs étapes au lien entre Arduino et Processing, ainsi qu'à la librairie PEmbroider. 

[PEmbroider](https://github.com/CreativeInquiry/PEmbroider) est une librairie créée par Golan Levin, Lingdong Huang, and Tatyana Mustakos qui permet de générer des fichiers de broderie en utilisant Processing. Elle permet donc de générer directement certains types de points tout en les combinant avec les possibilités nombreuses de Processing, qui est au départ un logiciel d’art génératif. 

Leur Github est très riches en explications, exemples et liste de commandes. Il faut cependant être familiarisé avec Processing pour pouvoir l'exploiter au maximum, étant donné que la librairie se base beaucoup sur des commandes existantes, les transposant simplement à la génération d'un fichier de broderie plutôt que d'un visuel simple.

Voici quelques conseils qui m'ont aidé durant mes expérimentations : 
- PEmbroider ne fonctionne que dans le "void setup", pour un motif génératif en direct et donc pour pouvoir utiliser les données du flex en temps réel, il faut donc créer une loop dans le "setup" au lieu de travailler dans le "draw".
- Pour appliquer une commander Processing classique au fichier de broderie, il faut ajouter "E." devant la commande.

Le principe du motif génératif utilisé pour ce projet est celui-ci : le motif de base (si le flex n'est pas manipulé pendant le temps de la loop) est un cercle. Dès que le flex est manipulé, sa résistance va changer, et un point du cercle va se rapprocher du centre. Plus fort le flex est écrasé, plus ce point se rapprochera du centre. De cette façon, si on manipule beaucoup le flex, on va obtenir un motif en soleil. 

Voici quelques exemples de motifs générés et de leur résultat après broderie : 

<img src="https://github.com/fablabke/Points_sensibles/assets/158562798/ea96af48-67ae-4b1f-b45b-e8bc103af293" width="400">
<img src="https://github.com/fablabke/Points_sensibles/assets/158562798/fb60eb09-5e2b-452c-bfce-96fb95616c88" width="400">
<img src="https://github.com/fablabke/Points_sensibles/assets/158562798/3d85187e-c7b8-479f-9e41-3e9f11438cfd" width="400">
<img src="https://github.com/fablabke/Points_sensibles/assets/158562798/e005a65a-a7de-48c6-a230-291b2c258a67" width="400">




