-- SQLite 3 3.37.2 dump

DROP TABLE IF EXISTS "SERVICES";
CREATE TABLE "SERVICES" (
  "ID" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "LANGUAGE" text NOT NULL,
  "NAME" text NOT NULL,
  "DESCRIPTION" text NOT NULL,
  "IMG_SRC" text NOT NULL,
  "IMG_ALT" text NOT NULL
);

INSERT INTO "SERVICES" ("ID", "LANGUAGE", "NAME", "DESCRIPTION", "IMG_SRC", "IMG_ALT") VALUES (1,	'en',	'Restaurant',	'Overlooking the swimming pool, the hotel restaurant offers a wide variety of hot and cold dishes in a varied buffet.

Opening hours:
Breakfast: 07:30am - 10:30am
Lunch: 12:30am - 2:30pm / Dinner: 7:30pm – 10:00pm',	'assets/img/restaurant.jpeg',	'Restaurant');
INSERT INTO "SERVICES" ("ID", "LANGUAGE", "NAME", "DESCRIPTION", "IMG_SRC", "IMG_ALT") VALUES (2,	'en',	'Gym & Massages',	'More active guests can take advantage of the hotel''s gym, equipped with various machines.

  The hotel also offers massage services during the high season.',	'assets/img/gymnasium.jpeg',	'Gym and Massages');
INSERT INTO "SERVICES" ("ID", "LANGUAGE", "NAME", "DESCRIPTION", "IMG_SRC", "IMG_ALT") VALUES (3,	'en',	'Transfer Service',	'The hotel offers its guests a private transfer service.

Prices: From 1 to 4 Passengers = 40,00 € * / From 5 to 8 Passengers  = 50,00 €

 ** One-way price. The price is doubled for return journeys.',	'assets/img/transfer.jpeg',	'Transfer Service');
INSERT INTO "SERVICES" ("ID", "LANGUAGE", "NAME", "DESCRIPTION", "IMG_SRC", "IMG_ALT") VALUES (4,	'pt_PT',	'Restaurante',	'Com vista para a piscina, o restaurante do Hotel tem uma grande variedade de pratos quentes e frios num buffet variado.

Horário Funcionamento:
Pequeno-Almoço: 07:30am - 10:30am
Almoço: 12:30am - 2:30pm / Jantar: 7:30pm – 10:00pm',	'assets/img/restaurant.jpeg',	'Restaurante');
INSERT INTO "SERVICES" ("ID", "LANGUAGE", "NAME", "DESCRIPTION", "IMG_SRC", "IMG_ALT") VALUES (5,	'pt_PT',	'Ginásio & Massagens',	'Os hóspedes mais activos podem tirar partido do ginásio que o hotel possui, equipado com várias máquinas.

  O hotel também oferece serviços de massagem durante a época alta.',	'assets/img/gymnasium.jpeg',	'Ginásio & Massagens');
INSERT INTO "SERVICES" ("ID", "LANGUAGE", "NAME", "DESCRIPTION", "IMG_SRC", "IMG_ALT") VALUES (6,	'pt_PT',	'Serviço de Transfer',	'O Hotel oferece aos seus hóspedes um serviço de transfer privado.

Preços: De 1 a 4 Passageiros = 40,00 € * / De 5 a 8 Passageiros = 50,00 €

 ** Preço só ida. O preço é duplicado para viagens de ida e volta.',	'assets/img/transfer.jpeg',	'Serviço de Transfer');

-- 
