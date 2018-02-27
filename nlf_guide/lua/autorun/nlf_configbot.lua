--------------- Bot developed by Osmos  --------------------
 
 if !nlf then
 nlf = {}
 end 
 
nlf.bot = {}

nlf.bot.config = {}

nlf.bot.config.button = {}

nlf.bot.config.panel = {}

nlf.bot.config.popup = {}

nlf.bot.config.llanguage = {}

nlf.bot.config.adminpanel = {}

nlf.bot.version = "2.6" -- Ne pas modifier !

/* 
Toutes les commandes :

	nlf_bot_spawn	LE NOM DE VOTRE BOT
	nlf_bot_remove LE NOM DE VOTRE BOT
	nlf_bot_information 


Boutton Config :

	Cinq actions dispo :
	
    action = "txt", 	affiche une popup avec un texte définis,	text = le texte qui s'affiche dans la PopUP
    action = "urlweb",	Ouvre une page internet définis dans le navigateur steam, 					text = l'url de votre site
	action = "url", 	Ouvre une page internet définis dans la PopUP,						text = l'url de votre site
	action = "givemoneyonetime", 	Add de l'argent au joueur une fois uniquement,						text = le montant, si vous voulez déduire un montant il suffit de faire : text = "- votre montant"
	action = "exit", 	Quitte le panel du bot

--	nlf.bot.config.button[id] = {
--	name = "",   		Le nom de votre boutton
--	text = "", 
--	action = "",  		L'action choisis
--	}
	
	/!\ Vous pouvez utiliser \n pour le retour à la ligne /!\
 */
 
 ------------------------------------------------------
-- OPTION 
nlf.bot.config.adminpanel.access = {"superadmin", "admin"}

nlf.bot.config.adminpanel.command = "!nlfbotadmin"
nlf.bot.config.adminpanel.saveposs = "!nlfbotsavepos"

nlf.bot.config.llanguage.LocalLang = "FR" -- Choisis une langue pré-définis ! FR / EN 

nlf.bot.config.panel.usemusic = true 
nlf.bot.config.panel.usefilemusic = true -- Si nlf.bot.config.panel.usefilemusic = false alors nlf.bot.config.panel.filemusic = une musique par url
nlf.bot.config.panel.filemusic = "sound/music/nlftbotmainmusic.wav" 

------------------------------------------------------
-- BOT CONFIG

nlf.bot.config.namebot = "Gérard" 
nlf.bot.config.namebot2 = "A la recherche d'aide ?"
nlf.bot.config.colornamebot = Color(255, 255, 255, 255)
nlf.bot.config.skin = "models/Humans/Group02/male_06.mdl"

------------------------------------------------------
-- Panel Config 

nlf.bot.config.panel.namebot = "Gérard le helpeur !"
nlf.bot.config.panel.namebotcolor = Color( 190, 190, 190 )

nlf.bot.config.panel.useicon = true  
nlf.bot.config.panel.iconrotating = true
-- For Editing the icon file go in line 157 here

nlf.bot.config.panel.textprincipal = "Bonjour,\nSi tu a cliqué sur ce bot, c’est que tu es nouveau sur notre serveur, nous te souhaitons la bienvenue et nous espérons que tu passeras un agréable moment avec nous.\nPour toi, nous avons pris le temps de rédiger un certain nombre d’informations liées au serveur, nous espérons donc qu'à ton tour, tu prendras le temps de lire l’intégralité des rubriques afin de t'intégrer au mieux au serveur."
nlf.bot.config.panel.textprincipalColor = Color( 255, 255, 255, 255 )

nlf.bot.config.panel.blurbackgroundColor = Color( 0, 0, 0, 200 )
nlf.bot.config.panel.backgroundColor = Color( 50, 50, 50, 250 )

nlf.bot.config.panel.soundonclick = "buttons/button14.wav"
nlf.bot.config.panel.soundoncursor = "buttons/lightswitch2.wav"
------------------------------------------------------
-- Boutton Config


nlf.bot.config.button[1] = {
name = "Le serveur",
text = "Il faut que tu Il faut que tu sache, que nous nous trouvons quelque part dans le front de l’est, cette ville a été assiégée par le troisième Reich, le Führer en Il faut que tu sache, que nous nous trouvons quelque part dans le front de l’est, cette ville a été assiégée par le troisième Reich, le Führer en peIl faut que tu sache, que nous nous trouvons quelque part dans le front de l’est, cette ville a été assiégée par le troisième Reich, le Führer en persIl faut que tu sache, que nous nous trouvons quelque part dans le front de l’est, cette ville a été assiégée par le troisième Reich, le Führer en persIl faut que tu sache, que nous nous trouvons quelque part dans le front de l’est, cette ville a été assiégée par le troisième Reich, le Führer en personne à installer ses habitations dans le centre de la ville.\nLe Führer, comme tu peux l’imaginer, onne à installer ses habitations dans le centre de la ville.\nLe Führer, comme tu peux l’imaginer, onne à installer ses habitations dans le centre de la ville.\nLe Führer, comme tu peux l’imaginer, rsonne à installer ses habitations dans le centre de la ville.\nLe Führer, comme tu peux l’imaginer, personne à installer ses habitations dans le centre de la ville.\nLe Führer, comme tu peux l’imaginer, sache, que nous nous trouvons quelque part dans le front de l’est, cette ville a été assiégée par le troisième Reich, le Führer en personne à installer ses habitations dans le centre de la ville.\nLe Führer, comme tu peux l’imaginer, à établi une dictature, c'est-à-dire que tous les pouvoirs de la ville sont concentrés entre ses propres mains.\nT'es libertés individuelles sont donc réduites à néant.\nLe Führer dispose d’une armée appelée ; “La Wehrmacht ”, celle-ci dispose de toutes les autorisations de ; tirer, tuer et torturer, quiconque paraissant suspect ou dangereux.\nTu dois donc rester le plus discret possible, ne cours pas, ne crie pas, ne saute pas…",
action = "txt",
}

nlf.bot.config.button[2] = {
name = "Notre Groupe steam",
text = "http://steamcommunity.com/groups/nlfcommunaute",
action = "urlweb",
}

nlf.bot.config.button[3] = {
name = "Notre forum",
text = "https://neo-life.fr/forum/index.php",
action = "url",
}

nlf.bot.config.button[4] = {
name = "Notre Site",
text = "https://neo-life.fr",
action = "url",
}

nlf.bot.config.button[5] = {
name = "Notre boutique",
text = "https://neo-life.fr/boutique/",
action = "url",
}

nlf.bot.config.button[6] = {
name = "Notre musique ! (Via fichier)",
text = "sound/music/nlftbotmainmusic.wav",
action = "playsoundfile",
}


nlf.bot.config.button[7] = {
name = "Reçois t'es 500$ de départ !",
text = "500",
action = "givemoneyonetime",
}

nlf.bot.config.button[8] = {
name = "Je dois partir !",
action = "exit",
}

nlf.bot.config.button.namecolor = Color( 255, 255, 255 )
nlf.bot.config.button.buttonColor = Color( 25, 25, 25, 250 )
nlf.bot.config.button.cursorenteredColor =  Color( 100, 100, 100, 150 )
nlf.bot.config.scrollbar =   Color(175, 100, 100, 255)

------------------------------------------------------
-- Frame POPUP txt / url 

nlf.bot.config.popup.exitname = "OK"
nlf.bot.config.popup.exitnamecolor = color_white	-- The color of the name button
nlf.bot.config.popup.exitButtonColor = Color(44, 62, 80, 60)
nlf.bot.config.popup.exitButtonColorWhenCursor = Color(41, 128, 255, 100)	-- The color of the button when cursor entered

nlf.bot.config.popup.nameframecolor = Color(41, 128, 255, 250) -- The color where is the name nlf bot in the panel
nlf.bot.config.popup.nameframetextcolor = color_white -- Color of the text

------------------------------------------------------
-- All icon
nlf.bot.config.icon =  {}

nlf.bot.config.icon.create = "materials/osbot/create.png"

nlf.bot.config.icon.creator = "materials/osbot/creator.png"

nlf.bot.config.icon.delete = "materials/osbot/delete.png"

nlf.bot.config.icon.info = "materials/osbot/info.png"

nlf.bot.config.icon.panelicon = "materials/osbot/panel.png"

nlf.bot.config.icon.search = "materials/osbot/search.png"

nlf.bot.config.icon.showdata = "materials/osbot/showdata.png"

-------------------------------------------------------