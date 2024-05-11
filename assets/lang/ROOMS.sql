-- SQLite 3 3.37.2 dump

DROP TABLE IF EXISTS "ROOMS";
CREATE TABLE ROOMS (ID integer NOT NULL PRIMARY KEY AUTOINCREMENT, LANGUAGE text NOT NULL, NAME text NOT NULL, DESCRIPTION text NOT NULL, FACILITIES text NOT NULL, MAX_LOTATION text NOT NULL, IMG_SRC text NOT NULL, IMG_ALT text NOT NULL, TYPE text NOT NULL);

INSERT INTO "ROOMS" ("ID", "LANGUAGE", "NAME", "DESCRIPTION", "FACILITIES", "MAX_LOTATION", "IMG_SRC", "IMG_ALT", "TYPE") VALUES (1,	'en',	'Single Room',	'These rooms offer all the comfort and privacy you need.
 Comfortable beds, spacious room recently renovated. Includes bathroom with free toiletries, flat screen TV, radio, mini fridge, telephone, safe, free Wi-Fi, air conditioning and tea and coffee making facilities.',	'<li class="list-group-item">Desk</li>
<li class="list-group-item">Wardrobe</li>
<li class="list-group-item">Pay-Per-View Channels</li>
<li class="list-group-item">Sofa</li>',	'1',	'assets/img/single.jpeg',	'Single Room',	'single');
INSERT INTO "ROOMS" ("ID", "LANGUAGE", "NAME", "DESCRIPTION", "FACILITIES", "MAX_LOTATION", "IMG_SRC", "IMG_ALT", "TYPE") VALUES (2,	'en',	'Double or Twin Room',	'These rooms offer all the comfort and privacy you need.
 Comfortable beds, spacious room recently renovated. Includes bathroom with free toiletries, flat screen TV, radio, mini fridge, telephone, safe, free Wi-Fi, air conditioning and tea and coffee making facilities.',	'<li class="list-group-item">Desk</li>
<li class="list-group-item">Wardrobe</li>
<li class="list-group-item">Pay-Per-View Channels</li>
<li class="list-group-item">Sofa</li>',	'2',	'assets/img/double.jpeg',	'Double or Twin Room',	'double');
INSERT INTO "ROOMS" ("ID", "LANGUAGE", "NAME", "DESCRIPTION", "FACILITIES", "MAX_LOTATION", "IMG_SRC", "IMG_ALT", "TYPE") VALUES (3,	'en',	'Double Room With Extra Bed',	'These rooms offer all the comfort and privacy you need.
 Comfortable beds, spacious room recently renovated. Includes bathroom with free toiletries, flat screen TV, radio, mini fridge, telephone, safe, free Wi-Fi, air conditioning and tea and coffee making facilities.',	'<li class="list-group-item">Desk</li>
<li class="list-group-item">Wardrobe</li>
<li class="list-group-item">Pay-Per-View Channels</li>
<li class="list-group-item">Sofa</li>',	'3',	'assets/img/extra_bed.jpeg',	'Double Room With Extra Bed',	'double_extra_bed');
INSERT INTO "ROOMS" ("ID", "LANGUAGE", "NAME", "DESCRIPTION", "FACILITIES", "MAX_LOTATION", "IMG_SRC", "IMG_ALT", "TYPE") VALUES (4,	'pt_PT',	'Quarto Individual',	'Estes quartos oferecem todo o conforto e privacidade de que necessita.
 Camas confortáveis, quarto amplo renovado recentemente. Inclui casa de banho com produtos de higiene pessoal gratuitos, TV de ecrã plano, rádio, mini-frigorífico, telefone, cofre, Wi-Fi gratuito, ar condicionado e comodidades para preparar chá e café.',	'<li class="list-group-item">Secretária</li>
<li class="list-group-item">Roupeiro</li>
<li class="list-group-item">Canais Pay-Per-View</li>
<li class="list-group-item">Sofá</li>',	'1',	'assets/img/single.jpeg',	'Quarto Individual',	'single');
INSERT INTO "ROOMS" ("ID", "LANGUAGE", "NAME", "DESCRIPTION", "FACILITIES", "MAX_LOTATION", "IMG_SRC", "IMG_ALT", "TYPE") VALUES (5,	'pt_PT',	'Quarto Duplo',	'Estes quartos oferecem todo o conforto e privacidade de que necessita. 
 Camas confortáveis, quarto amplo renovado recentemente. Inclui casa de banho com produtos de higiene pessoal gratuitos, TV de ecrã plano, rádio, mini-frigorífico, telefone, cofre, Wi-Fi gratuito, ar condicionado e comodidades para preparar chá e café.',	'<li class="list-group-item">Secretária</li>
<li class="list-group-item">Roupeiro</li>
<li class="list-group-item">Canais Pay-Per-View</li>
<li class="list-group-item">Sofá</li>',	'2',	'assets/img/double.jpeg',	'Quarto DuploTwin',	'double');
INSERT INTO "ROOMS" ("ID", "LANGUAGE", "NAME", "DESCRIPTION", "FACILITIES", "MAX_LOTATION", "IMG_SRC", "IMG_ALT", "TYPE") VALUES (6,	'pt_PT',	'Quarto Duplo C/ Cama Extra',	'Estes quartos oferecem todo o conforto e privacidade de que necessita. Camas confortáveis, quarto amplo renovado recentemente. 
 Inclui casa de banho com produtos de higiene pessoal gratuitos, TV de ecrã plano, rádio, mini-frigorífico, telefone, cofre, Wi-Fi gratuito, ar condicionado e comodidades para preparar chá e café.',	'<li class="list-group-item">Secretária</li>
<li class="list-group-item">Roupeiro</li>
<li class="list-group-item">Canais Pay-Per-View</li>
<li class="list-group-item">Sofá</li>',	'3',	'assets/img/extra_bed.jpeg',	'Quarto Duplo Cama Extra',	'double_extra_bed');

-- 
