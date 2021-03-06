# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'
require 'nokogiri'

puts 'cleaning DB'

Boat.destroy_all
User.destroy_all

puts 'Creating 20 fake users...'
20.times do
  user = User.new(
    first_name:  Faker::Name.first_name,
    last_name:   Faker::Name.last_name,
    email:       Faker::Internet.free_email,
    password:    Faker::Internet.password(10, 20)
  )
  user.save!

end

puts 'Finished!'

puts 'Creating 20 fake boats...'

# url = "https://www.clickandboat.com/location-bateau/recherche?where=Gen%C3%A8ve,%20Suisse&DateDebut=&DateFin=&ProduitTypeId=&_tri=Selection&TypeNavigation=With%20or%20without%20captain&_page=1"

# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)

# html_doc.search('.itemProduct').each do |element|
#   name = element.attr('alt')
#   category = element.attr('data-type-boat')
#   price_per_day = element.attr('data-prix-jour-acl')
#   picture = element.attr('src')
#   photo = url('https://www.clickandboat.com/location-bateau/gen%C3%A8ve/voilier/beneteau-first-21-xey1p')
#   image_url = element.attr('src')
#   boat = Boat.new(name: name, category: category, price_per_day: price_per_day, user_id: 1)


# html_doc.search('.itemCap').each do |element|
#   name_boat = element.attr('h3')


  url_one = "https://static1.clickandboat.com/v1/p/iaykapmodtz5o5vzcpkwtjad6ti0y5pb.big.jpg"
  boat_one = Boat.new(
    name: "FIRST 21",
    category: "Voilier",
    price_per_day: 115,
    description: "Le first 21 set un petit monocoque, à l'équipement spartiate mais parfaitement adapté à la navigation à la journée.
    Le bateau est n'est disponible qu'en co-navigation, avec le propriétaire, et non en location, pour des raisons d'assurance. Les co-navigations sont possibles en semaine uniquement, du lundi au jeudi, sauf en hiver quand le bateau est en hivernage. (Je ne suis pas disponible les WE, malheureusement).
    Le Départ s'effectue du Port des Eaux-vives, situé en plein coeur de Genève, à proximité du jet d'eau.
    Il permet une autre approche, très originale, pour visiter la rade de Genève et le petit lac. Le plan d'eau est entouré de montagnes et, par beau temps,  la vue sur le Mont blanc est au programme.

    La co-navigation permet également aux débutants, s'ils le souhaitent, de s'initier à la voile, en toute convivialité.",
    address: "Port du Basset, Montreux, Suisse",
    user: User.all.sample,
  )
  boat_one.remote_photo_url = url_one
  boat_one.save!

  url_two = "https://static1.clickandboat.com/v1/p/7n6n045wjx7i46215tsr0oe11juf70ad.big.jpg"
  boat_two = Boat.new(
    name: "MASTERCRAFT NXT20 2015",
    category: "Semi-rigide",
    price_per_day: 950,
    description: "Le MasterCraft NXT20 est équipé d'un V8 5.7l générant 320 cv. Les sensations fortes sont garanties même en simple balade. Les plus jeunes peuvent se laisser tracter en bouée mais le mastercraft est avant tout un bateau de wakeboard avec 400 kg de ballast avec commande au volant pour générer une belle vague pour débutant et intermédiaire.
    Le wakesurf est également possible avec 2 fat sac supplémentaires à remplir manuellement (avec pompe électrique) et un wake shaper Mission Delta.
    Il peut accueillir jusqu'à 10 passagers + le pilote.  (max: 800kg). Le cruise control assure une experience optimale pour le rider en maintenant le bateau à une vitesse constante.
    Il est également équipé d'une stereo bluetooth avec chargeur USB et entrée auxiliaire mini jack.
    Je peux vous proposer des horaires flexibles entre 8h et 22h. ",
    address: "Port des Eaux Vives, Genève, Suisse",
    user: User.all.sample,
    )
  boat_two.remote_photo_url = url_two
  boat_two.save!

  url_three = "https://static1.clickandboat.com/v1/p/mqblid092dvysnmc9u99vnbq7kk3f0i8.big.jpg"
  boat_three = Boat.new(
    name: "SEA RAY 270 SLX - GENT' LEMAN",
    category: "Bateau à moteur",
    price_per_day: 800,
    description: "Nous vous emmenons avec plaisir pour une sortie en bateau avec la famille, entre amis ou avec votre entreprise. Idéal pour des baignades, admirer le paysage magnifique de la région lémanique, une balade à Yvoire ou découvrir les restaurants du bord du lac.
    Pour ceux qui désirent s'éclater en ski nautique ou en bouée tractée, l'équipement nécessaire est à bord du bateau pour assurer l'adrénaline. N’hésitez pas à nous communiquer vos envies personnelles afin de pouvoir vous faire une offre sur mesure.
    Notre skipper ‘David’ vous souhaite la bienvenue sur notre bateau LE GENT' LEMAN. Merci et à bientôt !",
    address: "Port de Nyon, Suisse",
    user: User.all.sample,
    )
  boat_three.remote_photo_url = url_three
  boat_three.save!

  url_four = "https://files.newsnetz.ch/story/3/1/0/31082200/3/topelement.jpg"
  boat_four = Boat.new(
    name: "YAMAHA XLT 800",
    category: "Jetski",
    price_per_day: 140,
    description: "Bonjour,
    Je vous propose la location de jet-ski, yamaha XLT800 de 120 cv, 3 places, puissant, agréable à piloter et très joueur! Equipé de 2 coffres de rangements étanches, marche arrière, équipements de sécurité (gilets de sauvetages, lampes torches) et d'une ancre.
    Je peux vous accompagner si vous n'avez pas le permis pour vous faire découvrir le plaisir et la sensation d'une moto marine.
    Ce jet-ski est réservé à des personnes responsables et respectueuses, pas sérieux s' abstenir!
    Caution, permis bateau obligatoire et pièce d'identité vous seront demandés",
    address: "Port d'Ouchy, Lausanne, Suisse",
    user: User.all.sample,
      )
      boat_four.remote_photo_url = url_four
      boat_four.save!

  url_five = "https://static1.clickandboat.com/v1/p/2agyqfwfe6ncjp4e4ddei8knlovoifns.big.jpg"
  boat_five = Boat.new(
    name: "CATAMARAN DE SPORT 16'",
    category: "Catamaran",
    price_per_day: 145,
    description: "Bonjour à tous,
    Je vous propose de louer ce catamaran de 4 mètres afin de naviguer sur le lac Léman.
    Ce catamaran peut accueillir 2 personnes pour une belle journée de navigation.
    C'est un bateau sportif avec trapèzes et spinnaker. Les gilets de sauvetage sont bien entendu fournis avec le bateau. ",
    address: "Port d'Evian-les-Bains, France",
    user: User.all.sample,
    )
  boat_five.remote_photo_url = url_five
  boat_five.save!

  url_six = "https://static1.clickandboat.com/v1/p/1lqc91r45tzln977si2qt2mxiqf3wulf.big.jpg"
  boat_six = Boat.new(
    name: "VOILIER DE CROISIERE - KELT 7.60",
    category: "Voilier",
    price_per_day: 95,
    description: "Bonjour,
    Je propose à la location mon superbe voilier, un Kelt 7.60,  amarré au port d'Evian sur le Lac Leman. Le bateau est équipé avec 4 couchages et un joli coin cuisine( Glacière et deux gaz). Les sanitaires neufs sont proches du ponton du bateau sur le port. Il dispose d'une cabine, avec un carré transformable. Vous trouverez à bord une petite annexe également.
    Le lac Léman présente de nombreux ports avec des coins plus citadin et d'autres plus sauvages. Vous pouvez changer de pays en naviguant et dormir en Suisse. Certains port en Suisse propose une première nuit au port gratuite.
    Les vents sont variables et joueurs, ce qui permet de profiter vraiment du support à voile, tirer quelques bords en naviguant entre les 2 pays, un vrai bonheur.
    Vous vous retrouverez dans un véritable environnement unique à part entière, non loin du massif du Jura, vous serez au milieu de la nature, sur l'eau, entouré de verdure et de villes très sympathique à visiter. Les nombreux petits ports sont aussi des endroits très agréable à visiter.
    A très bientôt,
    PS: Il n'y a pas besoin de permis pour naviguer avec mon bateau (seulement un 4 chevaux ce qui est suffisant pour un voilier) mais il est vivement conseillé de savoir faire un minimum de voile pour ne pas se retrouver en difficulté. Merci",
    address: "Port Wilson, Genève, Suisse",
    user: User.all.sample,
    )
  boat_six.remote_photo_url = url_six
  boat_six.save!

  url_seven = "https://static1.clickandboat.com/v1/p/fa1vdxgpugrtmz3z1nhlztg7ykg92wgj.big.jpg"
  boat_seven = Boat.new(
    name: "ROYAL BOUNTY",
    category: "Péniche",
    price_per_day: 150,
    description: "Bonjour,
    Pénichette pouvant accueillir trois adultes ou deux adultes et deux enfants.
    A l'intérieur : carré avec coin cuisine aménagé et coin repas transformable en couchette, cabine avec lit double, salle de bain avec WC et douche.
    Terrasse arrière abritée de plein pied avec le carré avec table amovible. Plage de bain.
    Le bateau consomme peu. Il est très maniable.",
    address: "Port Choiseul, Versoix, Suisse",
    user: User.all.sample,
    )
  boat_seven.remote_photo_url = url_seven
  boat_seven.save!

  url_eight = "https://www.leboat.fr/sites/default/files/styles/lbt_imgstyle_gallery_lg/public/images/gallery/cirrus_rear_leboat_glg_0.jpg?itok=pnQgUxoY&timestamp=1530294261"
  boat_eight = Boat.new(
    name: "CIRRUS B",
    category: "Péniche",
    price_per_day: 130,
    description: "Grâce à ses couchages modulables dans la cabine et dans le salon, le Cirrus offre aux couples et aux petites familles (4 personnes) tout l'espace nécessaire pour conjuguer détente et style lors de leur séjour. Avec sa grande cabine à l'arrière, son salon et ses baies vitrées lumineuses, son pont supérieur et ses 2 postes de pilotage, le Cirrus dispose de tous les équipements nécessaires pour une croisière fluviale confortable !",
    address: "Port de Rolle, Suisse",
    user: User.all.sample,
    )
  boat_eight.remote_photo_url = url_eight
  boat_eight.save!



  url_nine = "https://static1.clickandboat.com/v1/p/ghzompk0s2hhcfyzmc3mssjzkllmhmqp.big.jpg"
  boat_nine = Boat.new(
    name: "FOUR WINS HORIZON 180",
    category: "Bateau à moteur",
    price_per_day: 300,
    description: "Bonjour,
    Je vous propose de louer ce superbe Four Winns Horizon 180 sur le Lac Léman.
    Ce dernier est idéal pour passer une journée en famille ou entre amis jusqu'à 7 personnes à bord! Il possède un moteur de 220 CV et a été mis à l'eau en 2002.
    Amateur de vitesse et de sports nautiques, vous ne serez pas déçus",
    address: "Port de Thonon-les-Bains, France",
    user: User.all.sample,
    )
  boat_nine.remote_photo_url = url_nine
  boat_nine.save!


  url_ten = "https://static1.clickandboat.com/v1/p/75hc52sgt48iwaxam8dy7xozaj9wmy0e.big.jpg"
  boat_ten = Boat.new(
    name: "TITANIUM 460",
    category: "Bateau à moteur",
    price_per_day: 239,
    description: "Bonjour,
    Je vous propose mon Bateau Titanium à la location. C'est un modèle de 2018 tout neuf!
    Parfait pour passer des journées inoubliables sur notre magnifique Lac Léman.
    Idéalement situé au port de Sciez-Sur-Léman, au coeur de la baie d'Excenevex et de sa plage de sable fin, vous êtes à 10 minutes d'Yvoire, 20 minutes de Thonon-les-Bains, 30 minutes d'Évian...",
    address: "Port de Sciez-Sur-Léman, France",
    user: User.all.sample,
  )
  boat_ten.remote_photo_url = url_ten
  boat_ten.save!

  url_eleven = "https://static1.clickandboat.com/v1/p/w9wzviup590b4hd4nvtf3s9tlf61v9ot.big.jpg"
  boat_eleven = Boat.new(
    name: "QUICKSILVER SPORTLAKE",
    category: "Bateau à moteur",
    price_per_day: 250,
    description: "Je loue mon bateau à moteur Quicksilver 520 !!

C'est un bateau à moteur très maniable, spacieux et surtout très agréable à naviguer.

Il dispose mainteanant d'un taud de soleil pour une bonne protection, d'une échelle de bain, d'un bain de soleil arrière.
La banquette arrière est transformable en lit.


Mon bateau est basé au port de Evian-les-Bains. Vous pourrez naviguer sur le Lac Léman sans aucun problème. Je vous conseille d'aller sur la rive nord du lac du côté de Lausanne ou de Montreux. Deux villes qui offrent des points de vues extraordinaire sur tout le lac et les alentours.
En allant à l'ouest, vous pourrez vous rendre du côté de Genève avec ses nombreux bars et restaurants!!

Je peut aussi faire le capitaine pour les personnes sans permis !!
Je connais très bien les plus beaux point de vues et crique.",
    address: "Port d'Evian-les-Bains, France",
    user: User.all.sample,
    )
  boat_eleven.remote_photo_url = url_eleven
  boat_eleven.save!


  url_twelve= "https://static1.clickandboat.com/v1/p/9zqkoqci915szw1131it9uq5dp8jms46.big.jpg"
  boat_twelve = Boat.new(
    name: "NAUTIVELA SOLING",
    category: "Voilier",
    price_per_day: 100,
    description: "
Avec ou sans capitaine 4 personnes3ch
Description du voilier de Redouane
Bonjour,

Je vous propose à la location mon Soling de 1982. C'est un voilier en bon état avec lequel j'ai habitude de naviguer souvent.

Je le propose en location avec ou sans capitaine.
La capacité d'accueil maximum est de 4 personnes.

Il est disponible de Mai à Octobre, en fonction de la météo bien sûr.

C'est un voilier idéal pour découvrir le Lac Léman et ainsi profiter d'une activité qui change de l'ordinaire !

En co-navigation, je serai très heureux de vous recevoir, que vous soyez novice ou expert de la navigation. ",
    address: "Port Choiseul, Versoix, Suisse",
    user: User.all.sample,
    )
  boat_twelve.remote_photo_url = url_twelve
  boat_twelve.save!

  url_thirteen= "https://static1.clickandboat.com/v1/p/hoznk98hsqlaui1g2vohuxd6ljp759qh.big.jpg"
  boat_thirteen = Boat.new(
    name: "AZIMUT 46 FLY EVOLUZIONE",
    category: "Bateau à moteur",
    price_per_day: 5900,
    description: "Bonjour,

Je vous propose à la location avec capitaine mon Azimut 46 Fly Evoluzione, disponible au départ de Genève.

Le bateau comprend 3 cabines doubles, 2 sdb et est équipé tout confort ; climatisation, ice maker, wet bar sur le pont supérieur etc.

Il est proposé à la location pour des sorties sur le lac telles que:
    Découvertes des rives, de la rade
    Enterrement de vie de jeunes filles / garçons
    Mariages et/ou anniversaires
    Sorties entreprises
    Montreux Jazz Festival

Pour de plus amples informations, n'hésitez pas à me contacter sur la messagerie de Click and Boat. Je serai ravi de vous aider dans votre projet de location.

A bientôt, ",
    address: "Port des Eaux-Vives, Genève, Suisse",
    user: User.all.sample,
    )
  boat_thirteen.remote_photo_url = url_thirteen
  boat_thirteen.save!

  url_fourteen= "https://static1.clickandboat.com/v1/p/lfywzswhp2r3k2j4evmxx1293xb1cgoh.big.jpg"
  boat_fourteen = Boat.new(
    name: "QUICKSILVER OPEN 675 200CH VERADO",
    category: "Bateau à moteur",
    price_per_day: 350,
    description: "Ce Quicksilver Open est amarré au port des Eaux-Vives.
Il est parfait pour les balades sur le lac en famille, la pêche ou bien encore les sports nautiques.
J'ai fait rajouter une plage arrière avec une rampe pour faciliter l accès aux personnes à mobilité réduite.
Ceci donne aussi un vrai plus pour la baignade.

Le carburant est la charge du locataire.
Il est demandé au moins deux ans de permis et une expérience nautique minimum.

Possibilité de vous prêter un wake, gilet et palonnier moyennant 50 euros supplémentaires.",
    address: "Port du Vieux-Stand, Lutry, Suisse",
    user: User.all.sample,
  )
  boat_fourteen.remote_photo_url = url_fourteen
  boat_fourteen.save!

  url_fifteen= "https://static1.clickandboat.com/v1/p/wqwkEDe0QmQa81jZ1jy4Bx7xpzqFG2db.big.jpg"
  boat_fifteen = Boat.new(
    name: "NAUTIQUE 200 SPORT",
    category: "Bateau à moteur",
    price_per_day: 800,
    description: "Je mets en location mon magnifique bateau à moteur Nautique 200 Sport parfait pour les sports nautiques.

Ce bateau est très puissant, avec son moteur de 350 cv, mais aussi très agréable et facile à prendre en main ! Il convient aussi bien au sport nautique qu'à la balade à la journée.

Il dispose d'un bain de soleil avant et de deux matelas arrière parfait pour profiter du paysage et travailler son bronzage !
",
    address: "Port de la Venoge, Saint-Sulpice, Suisse",
    user: User.all.sample,
    )
  boat_fifteen.remote_photo_url = url_fifteen
  boat_fifteen.save!

  url_sixteen= "https://static1.clickandboat.com/v1/p/u1n7utjg7nrvhmzxqwm7ewl1hlsyyzov.big.jpg"
  boat_sixteen = Boat.new(
    name: "SYLVAN BATEAU LOUNGE BOAT MIRAGE LZ",
    category: "Bateau à moteur",
    price_per_day: 1000,
    description: "Bonjour,

Nous vous proposons de vivre une expérience unique sur notre lounge boat dernière génération.

Bateau  ultra confort pour accueillir votre groupe et profiter de l'apéritif ou d'un pique nique sur le bateau.

Nous vous suggérons une excursion afin de profiter pleinement des paysages du lac ainsi que de l’apéritif sur le bateau.

De véritable coin canapé avec tables sont modulables sur le bateau. Avec la musique vous passerez un moment inoubliable.

Nous avons la possibilité d’organiser l’apéritif pour vous moyennant un supplément, ou vous pouvez également apporter votre propre apéritif.

Vous partirez à la découverte des merveilles du lac Léman, accompagné de votre pilote-guide que se chargera de vous faire découvrir le lac.

Le carburant est inclut dans le tarif.

Des arrêts sont prévus sur différents sites, permettant d’en savoir un peu plus sur les secrets que recèle le lac et profiter de la baignade.

Au cours de la balade, un arrêt apéritif/pique-nique est prévue pour vous permettre de manger et boire, de vous baigner, de bronzer…
Les bateaux sont équipés d’enceintes Bluetooth et ports usb pour jouer votre propre musique !

Nous avons la possibilité de venir vous récupérer partout autour du lac.

Le tarif comprend la mise à disposition d’un bateau exclusif avec pilote, la privatisation pendant le temps nécessaire, l’essence, les explications de nos pilotes.

En ce qui concerne la demie journée nous avons différentes offres possibles :

380 € pour 2 heures
530 € pour 3 heures
590 € pour 4 heures

Venez tester l'aventure et profiter de ce moment unique sur notre bateau ultra confort en notre compagnie.

Cordialement",
    address: "Port d'Allaman, Suisse",
    user: User.all.sample,
    )
  boat_sixteen.remote_photo_url = url_sixteen
  boat_sixteen.save!

  url_seventeen= "https://static1.clickandboat.com/v1/p/v34zodq632c0s59j6jocwhidasto98ms.big.jpg"
  boat_seventeen = Boat.new(
    name: "FOUR WINNS H230 SS",
    category: "Bateau à moteur",
    price_per_day: 800,
    description: "Venez profiter de ce superbe FourWinns H230 SS de 2015 équipé de son V8 de 300CV à transmission double hélices.

Bateau parfait pour le ski, le wakeboard, les ballades, les apéros au soleil couchant....

Avec sa conduite facile et agréable il vous permettra de vivre une expérience unique sur le lac Léman.

Parmi les nombreux équipements du bateau vous trouverez une arche de wakeboard ou un taud de soleil pour se protéger des fortes chaleurs.

Il possède également une plate-forme de bain à l'arrière du bateau agréable et spacieuse, intégrant une échelle  facile d'utilisation. Il est équipé de matériel stéréo hi-fi à bord, prenant en charge vos pistes USB, auxiliaire et Bluetooth.",
    address: "Port de Saint-Prex, Suisse",
    user: User.all.sample,
    )
  boat_seventeen.remote_photo_url = url_seventeen
  boat_seventeen.save!

  url_eighteen= "https://static1.clickandboat.com/v1/p/npvodt4xhmqtl67gwlf3leugxsfyd1pp.big.jpg"
  boat_eighteen = Boat.new(
    name: "TES 678 GASPARD",
    category: "Voilier",
    price_per_day: 200,
    description: "Bonjour à tous,

Nous louons ce TES 678 de 2010 au départ de Thonon-les-Bains. Ce voilier s'appelle Gaspard et il vous attend au Grand Port.

De tempérament joueur, il est toujours partant pour une virée sur le lac, pour satisfaire vos envies de baignades loin de la foule, explorer les côtes sauvages du Lac et ses eaux vert émeraude, ou bien même une soirée festive au coucher du soleil.

C'est un voilier très confortable avec ses 2 cabines, il accueille agréablement 2 couples pour une ou plusieurs nuits. Nous conseillons d'embarquer à 4 personnes maximum pour être tout à fait à l'aise. ",
    address: "Port de Thonon-les-Bains, France",
    user: User.all.sample,
    )
  boat_eighteen.remote_photo_url = url_eighteen
  boat_eighteen.save!


  url_nineteen= "https://static1.clickandboat.com/v1/p/mrfvs9rnruh57v0l0aes04w9ap75vrdz.big.jpg"
  boat_nineteen = Boat.new(
    name: "DUFOUR 365 GL",
    category: "Voilier",
    price_per_day: 230,
    description: "Bonjour à tous,

De l’air, de l’eau et des montagnes !

Venez découvrir notre patrimoine Lémanique
à bord du Dufour 365 Grand Large.

Remarquable spécimen de la gamme «Grand Large», le Dufour 365 GL jouit d'une réputation sans faille auprès des plaisanciers.

De son côté, l’espace habitable propose des cabines très réussies, un carré aussi sympathique que pratique et un coin-cuisine bien équipé et peut  offrir 6 couchages agréables.

Basé dans le petit port de Nernier (la perle du lac), à 1 km d'Yvoire, village très connu pour son charme.  Vous apprécierez le calme et la bonne ambiance de cet endroit.",
    address: "Port de Nernier, France",
    user: User.all.sample,
    )
  boat_nineteen.remote_photo_url = url_nineteen
  boat_nineteen.save!

  url_twenty= "https://static1.clickandboat.com/v1/p/poao55y4p90bkhb1cugybx2106fn8c4x.big.jpg"
  boat_twenty = Boat.new(
    name: "JEANNEAU CAP CAMARAT 505",
    category: "Bateau à moteur",
    price_per_day: 238,
    description: "Bonjour,

Je vous propose en location mon Cap Camarat 505. Ce bateau peut accueillir jusqu'à 6 personnes avec accastillage pour le lac et sera donc parfait pour des sorties en famille ou entre amis sur le magnifique lac d'Annecy.

Ce bateau est accessible au ponton de Duingt. Il est prévu pour la baignade, la balade et le pique nique puisqu'il dispose d'une table à manger pour profiter tranquillement d'un instant au mouillage.
Vous trouverez également sur le bateau un taud de soleil pour vous abriter lors de fortes chaleurs, des coussins pour un maximum de confort ainsi qu'une échelle de bain.

Ce bateau très agréable et suffisant pour le lac. Il est très maniable et vous permettra de vous amuser au rythme tranquille et paisible de l'eau.
Au départ de Sciez, vous pourrez vous balader sur tout le lac. Je vous conseille particulière le coin de Sevrier avec un haut-fond pour se baigner, l'eau y est très clair.

Le carburant est à la charge du locataire.
",
    address: "Port de Sciez-Sur-Léman, France",
    user: User.all.sample,
    )
  boat_twenty.remote_photo_url = url_twenty
  boat_twenty.save!


puts 'Finished!'
