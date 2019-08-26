-------------------------------------------------------------
-- GLOBAL CONFIGURATION
OsGuide.adminGroup = {
	["superadmin"] = true, 
	["admin"] = true
}

OsGuide.languageUse = "fr" -- fr or en

OsGuide.adminDerma = "!guideadmin"
OsGuide.spawnCommand = "!newguide"

OsGuide.title = "Gérard le helpeur !"
OsGuide.desc = "A la recherche d'aide ?"
OsGuide.titleColor = Color(255, 255, 255, 255)

OsGuide.modelNPC = "models/Humans/Group02/male_06.mdl"

-------------------------------------------------------------
-- DERMA CONFIGURATION
OsGuide.useSound = true 
OsGuide.useWebSound = true 
OsGuide.soundPath = "sound/music/nlftbotmainmusic.wav" 

OsGuide.useLogo = true
OsGuide.rotationLogo = true
OsGuide.pathLogo = "osbot/panel.png"

OsGuide.mainText = "Hey !\nSi t'as cliqué sur ce NPC cela signifie que tu es nouveau sur notre serveur, pour commencer on te souhaite la bienvenue. \nPour toi on a pris le temps de rédiger les informations les plus pertinentes liées au serveur, alors jette-y un oeil avant de te lancer dans ton aventure RP.\nEn espérant que tu passeras un agréable moment avec nous."
OsGuide.mainTextColor = Color( 255, 255, 255, 255 )

OsGuide.RegisterNewAction( {
	name = "Le serveur",
	text = "Il faut que tu Il faut que tu sache, que nous nous trouvons quelque part dans le front de l’est, cette ville a été assiégée par le troisième Reich, le Führer en Il faut que tu sache, que nous nous trouvons quelque part dans le front de l’est, cette ville a été assiégée par le troisième Reich, le Führer en peIl faut que tu sache, que nous nous trouvons quelque part dans le front de l’est, cette ville a été assiégée par le troisième Reich, le Führer en persIl faut que tu sache, que nous nous trouvons quelque part dans le front de l’est, cette ville a été assiégée par le troisième Reich, le Führer en persIl faut que tu sache, que nous nous trouvons quelque part dans le front de l’est, cette ville a été assiégée par le troisième Reich, le Führer en personne à installer ses habitations dans le centre de la ville.\nLe Führer, comme tu peux l’imaginer, onne à installer ses habitations dans le centre de la ville.\nLe Führer, comme tu peux l’imaginer, onne à installer ses habitations dans le centre de la ville.\nLe Führer, comme tu peux l’imaginer, rsonne à installer ses habitations dans le centre de la ville.\nLe Führer, comme tu peux l’imaginer, personne à installer ses habitations dans le centre de la ville.\nLe Führer, comme tu peux l’imaginer, sache, que nous nous trouvons quelque part dans le front de l’est, cette ville a été assiégée par le troisième Reich, le Führer en personne à installer ses habitations dans le centre de la ville.\nLe Führer, comme tu peux l’imaginer, à établi une dictature, c'est-à-dire que tous les pouvoirs de la ville sont concentrés entre ses propres mains.\nT'es libertés individuelles sont donc réduites à néant.\nLe Führer dispose d’une armée appelée ; “La Wehrmacht ”, celle-ci dispose de toutes les autorisations de ; tirer, tuer et torturer, quiconque paraissant suspect ou dangereux.\nTu dois donc rester le plus discret possible, ne cours pas, ne crie pas, ne saute pas…",
	action = "text",
} )

OsGuide.RegisterNewAction( {
	name = "Notre Groupe steam",
	text = "https://www.google.com/",
	action = "webURL",
} )

OsGuide.RegisterNewAction( {
	name = "Notre forum",
	text = "https://www.google.com/",
	action = "ingameURL",
} )

OsGuide.RegisterNewAction( {
	name = "Notre Site",
	text = "https://www.google.com/",
	action = "ingameURL",
} )

OsGuide.RegisterNewAction( {
	name = "Notre boutique",
	text = "https://www.google.com/",
	action = "ingameURL",
} )

OsGuide.RegisterNewAction( {
	name = "Notre musique ! (Via fichier)",
	text = "sound/music/nlftbotmainmusic.wav",
	action = "playSoundFile",
} )


OsGuide.RegisterNewAction( {
	name = "Reçois t'es 500$ de départ !",
	text = "500",
	action = "giveMoneyOneTime",
} )

OsGuide.RegisterNewAction( {
	name = "Je dois partir !",
	text = "",
	action = "leave",
} )

OsGuide.titleColor = Color( 190, 190, 190 )

OsGuide.backgroundColor = Color( 50, 50, 50, 250 )
OsGuide.backgroundContourColor = Color( 0, 0, 0, 200 )

OsGuide.navbarColor =   Color(175, 100, 100, 255)

OsGuide.buttonTextColor = Color( 255, 255, 255 )
OsGuide.buttonColor = Color( 25, 25, 25, 250 )
OsGuide.buttonHoveredColor =  Color( 100, 100, 100, 150 )

OsGuide.onClickSound = "buttons/button14.wav"
OsGuide.onHoveredSound = "buttons/lightswitch2.wav"


-------------------------------------------------------------
-- POPUP CONFIGURATION
OsGuide.popUp.titleColor = color_white
OsGuide.popUp.backgroundTitleColor = Color(41, 128, 255, 250)

OsGuide.popUp.exitTitle = "OK"

OsGuide.popUp.exitColor = Color(44, 62, 80, 60)
OsGuide.popUp.exitHover = Color(41, 128, 255, 100)

OsGuide.popUp.exitTextColor = color_white

-- ICON CONFIGURATION 

OsGuide.iconCreate = "osbot/create.png"

OsGuide.iconDelete = "osbot/delete.png"

OsGuide.iconShowData = "osbot/showdata.png"

OsGuide.iconSearch = "osbot/search.png"

OsGuide.iconCreator = "osbot/creator.png"

OsGuide.iconInfo = "osbot/info.png"