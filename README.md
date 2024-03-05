
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









