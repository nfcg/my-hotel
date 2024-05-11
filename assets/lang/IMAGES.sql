-- SQLite 3 3.37.2 dump

DROP TABLE IF EXISTS "IMAGES";
CREATE TABLE "IMAGES" (
  "ID" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "IMG_ALT" text NOT NULL,
  "DESCRIPTION" text NOT NULL,
  "IMG_SRC" text NOT NULL,
  "TYPE" text NOT NULL,
  "LANGUAGE" text NOT NULL,
  "GAL_NAME" text NOT NULL
);

INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (1,	'Hotel Image 1',	'Hotel Image 1 Description',	'assets/img/hotel_1.jpg',	'gallery_hotel',	'en',	'Hotel Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (2,	'Hotel Image 2',	'Hotel Image 2 Description',	'assets/img/hotel_2.jpg',	'gallery_hotel',	'en',	'Hotel Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (3,	'Hotel Image 3',	'Hotel Image 3 Description',	'assets/img/hotel_3.jpg',	'gallery_hotel',	'en',	'Hotel Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (4,	'Hotel Image 4',	'Hotel Image 4 Description',	'assets/img/hotel_4.jpg',	'gallery_hotel',	'en',	'Hotel Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (5,	'Hotel Image 5',	'Hotel Image 5 Description',	'assets/img/hotel_5.jpg',	'gallery_hotel',	'en',	'Hotel Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (6,	'Hotel Image 6',	'Hotel Image 6 Description',	'assets/img/hotel_6.jpg',	'gallery_hotel',	'en',	'Hotel Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (7,	'Hotel Image 7',	'Hotel Image 7 Description',	'assets/img/hotel_7.jpg',	'gallery_hotel',	'en',	'Hotel Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (8,	'Rooms Image 1',	'Rooms Image 1 Description',	'assets/img/room_1.jpg',	'gallery_room',	'en',	'Rooms Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (9,	'Rooms Image 2',	'Rooms Image 2 Description',	'assets/img/room_2.jpg',	'gallery_room',	'en',	'Rooms Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (10,	'Rooms Image 3',	'Rooms Image 3 Description',	'assets/img/room_3.jpg',	'gallery_room',	'en',	'Rooms Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (11,	'Rooms Image 4',	'Rooms Image 4 Description',	'assets/img/room_4.jpg',	'gallery_room',	'en',	'Rooms Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (12,	'Rooms Image 5',	'Rooms Image 5 Description',	'assets/img/room_5.jpg',	'gallery_room',	'en',	'Rooms Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (13,	'Rooms Image 6',	'Rooms Image 6 Description',	'assets/img/room_6.jpg',	'gallery_room',	'en',	'Rooms Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (14,	'Rooms Image 7',	'Rooms Image 7 Description',	'assets/img/room_7.jpg',	'gallery_room',	'en',	'Rooms Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (15,	'Restaurant Image 1',	'Restaurant Image 1 Description',	'assets/img/restaurant_1.jpg',	'gallery_restaurant',	'en',	'Restaurant Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (16,	'Restaurant Image 2',	'Restaurant Image 2 Description',	'assets/img/restaurant_2.jpg',	'gallery_restaurant',	'en',	'Restaurant Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (17,	'Restaurant Image 3',	'Restaurant Image 3 Description',	'assets/img/restaurant_3.jpg',	'gallery_restaurant',	'en',	'Restaurant Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (18,	'Restaurant Image 4',	'Restaurant Image 4 Description',	'assets/img/restaurant_4.jpg',	'gallery_restaurant',	'en',	'Restaurant Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (19,	'Restaurant Image 5',	'Restaurant Image 5 Description',	'assets/img/restaurant_5.jpg',	'gallery_restaurant',	'en',	'Restaurant Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (20,	'Restaurant Image 6',	'Restaurant Image 6 Description',	'assets/img/restaurant_6.jpg',	'gallery_restaurant',	'en',	'Restaurant Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (21,	'Restaurant Image 7',	'Restaurant Image 7 Description',	'assets/img/restaurant_7.jpg',	'gallery_restaurant',	'en',	'Restaurant Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (22,	'My Hotel Image 1',	'Description Carousel Image 1',	'assets/img/carousel_1.jpg',	'gallery_carousel',	'en',	'Carousel Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (23,	'My Hotel Image 2',	'Description Carousel Image 2',	'assets/img/carousel_2.jpg',	'gallery_carousel',	'en',	'Carousel Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (24,	'My Hotel Image 3',	'Description Carousel Image 3',	'assets/img/carousel_3.jpg',	'gallery_carousel',	'en',	'Carousel Images');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (25,	'Hotel Imagem 1',	'Descrição Imagem Hotel 1',	'assets/img/hotel_1.jpg',	'gallery_hotel',	'pt_PT',	'Imagens Hotel');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (26,	'Hotel Imagem 2',	'Descrição Imagem Hotel 2',	'assets/img/hotel_2.jpg',	'gallery_hotel',	'pt_PT',	'Imagens Hotel');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (27,	'Hotel Imagem 3',	'Descrição Imagem Hotel 3',	'assets/img/hotel_3.jpg',	'gallery_hotel',	'pt_PT',	'Imagens Hotel');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (28,	'Hotel Imagem 4',	'Descrição Imagem Hotel 4',	'assets/img/hotel_4.jpg',	'gallery_hotel',	'pt_PT',	'Imagens Hotel');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (29,	'Hotel Imagem 5',	'Descrição Imagem Hotel 5',	'assets/img/hotel_5.jpg',	'gallery_hotel',	'pt_PT',	'Imagens Hotel');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (30,	'Hotel Imagem 6',	'Descrição Imagem Hotel 6',	'assets/img/hotel_6.jpg',	'gallery_hotel',	'pt_PT',	'Imagens Hotel');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (31,	'Hotel Imagem 7',	'Descrição Imagem Hotel 7',	'assets/img/hotel_7.jpg',	'gallery_hotel',	'pt_PT',	'Imagens Hotel');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (32,	'Quartos Imagem 1',	'Descrição Imagem Quarto 1',	'assets/img/room_1.jpg',	'gallery_room',	'pt_PT',	'Imagens Quartos');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (33,	'Quartos Imagem 2',	'Descrição Imagem Quarto 2',	'assets/img/room_2.jpg',	'gallery_room',	'pt_PT',	'Imagens Quartos');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (34,	'Quartos Imagem 3',	'Descrição Imagem Quarto 3',	'assets/img/room_3.jpg',	'gallery_room',	'pt_PT',	'Imagens Quartos');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (35,	'Quartos Imagem 4',	'Descrição Imagem Quarto 4',	'assets/img/room_4.jpg',	'gallery_room',	'pt_PT',	'Imagens Quartos');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (36,	'Quartos Imagem 5',	'Descrição Imagem Quarto 5',	'assets/img/room_5.jpg',	'gallery_room',	'pt_PT',	'Imagens Quartos');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (37,	'Quartos Imagem 6',	'Descrição Imagem Quarto 6',	'assets/img/room_6.jpg',	'gallery_room',	'pt_PT',	'Imagens Quartos');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (38,	'Quartos Imagem 7',	'Descrição Imagem Quarto 7',	'assets/img/room_7.jpg',	'gallery_room',	'pt_PT',	'Imagens Quartos');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (39,	'Restaurante Imagem 1',	'Descrição Imagem Restaurante 1',	'assets/img/restaurant_1.jpg',	'gallery_restaurant',	'pt_PT',	'Imagens Restaurante');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (40,	'Restaurante Imagem 2',	'Descrição Imagem Restaurante 2',	'assets/img/restaurant_2.jpg',	'gallery_restaurant',	'pt_PT',	'Imagens Restaurante');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (41,	'Restaurante Imagem 3',	'Descrição Imagem Restaurante 3',	'assets/img/restaurant_3.jpg',	'gallery_restaurant',	'pt_PT',	'Imagens Restaurante');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (42,	'Restaurante Imagem 4',	'Descrição Imagem Restaurante 4',	'assets/img/restaurant_4.jpg',	'gallery_restaurant',	'pt_PT',	'Imagens Restaurante');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (43,	'Restaurante Imagem 5',	'Descrição Imagem Restaurante 5',	'assets/img/restaurant_5.jpg',	'gallery_restaurant',	'pt_PT',	'Imagens Restaurante');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (44,	'Restaurante Imagem 6',	'Descrição Imagem Restaurante 6',	'assets/img/restaurant_6.jpg',	'gallery_restaurant',	'pt_PT',	'Imagens Restaurante');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (45,	'Restaurante Imagem 7',	'Descrição Imagem Restaurante 7',	'assets/img/restaurant_7.jpg',	'gallery_restaurant',	'pt_PT',	'Imagens Restaurante');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (46,	'My Hotel Imagem 1',	'Descrição Imagem Carousel 1',	'assets/img/carousel_1.jpg',	'gallery_carousel',	'pt_PT',	'Imagens Carousel');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (47,	'My Hotel Imagem 2',	'Descrição Imagem Carousel 2',	'assets/img/carousel_2.jpg',	'gallery_carousel',	'pt_PT',	'Imagens Carousel');
INSERT INTO "IMAGES" ("ID", "IMG_ALT", "DESCRIPTION", "IMG_SRC", "TYPE", "LANGUAGE", "GAL_NAME") VALUES (48,	'My Hotel Imagem 3',	'Descrição Imagem Carousel 3',	'assets/img/carousel_3.jpg',	'gallery_carousel',	'pt_PT',	'Imagens Carousel');

-- 
