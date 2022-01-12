/*
 Navicat Premium Data Transfer

 Source Server         : drg_mysql
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : drg_db

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 12/01/2022 18:17:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for character
-- ----------------------------
DROP TABLE IF EXISTS `character`;
CREATE TABLE `character`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `gameid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `wikia_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `favorite` tinyint(1) NULL DEFAULT 1,
  `userid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'associated user',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`userid`) USING BTREE,
  CONSTRAINT `character_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of character
-- ----------------------------
INSERT INTO `character` VALUES (1, '2B', '1649133e-d70c-4156-aeac-21da070633b4', 'https://nier.fandom.com/wiki/YoRHa_No.2_Type_B', 'https://localhost:5001/game_images/YoRHa_No.2_Type_B.png', 1, 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `character` VALUES (2, 'Kainé', 'fffdb5e7-1af6-4c8f-85fe-66f510250f6a', 'https://nier.fandom.com/wiki/Kain%C3%A9', 'https://localhost:5001/game_images/Kaine.png', 1, 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `character` VALUES (3, 'Bayonetta / Cereza', '97f3de86-4cbe-4061-adab-156af2bd2b81', 'https://bayonetta.fandom.com/wiki/Bayonetta_(character)', 'https://localhost:5001/game_images/Bayonetta character.png', 1, 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `character` VALUES (4, 'One', '4a2a3240-4f87-4835-bfd6-2096978abbb2', 'https://drakengard.fandom.com/wiki/One', 'https://localhost:5001/game_images/One.png', 1, 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `character` VALUES (5, 'Liara T Soni', '23ffb351-4ae1-461d-8d6e-1a652762ec05', 'https://masseffect.fandom.com/wiki/Liara_T%27Soni', 'https://localhost:5001/game_images/Liara.png', 1, 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `character` VALUES (6, 'Grimoire Weiss', 'fffdb5e7-1af6-4c8f-85fe-66f510250f6a', 'https://nier.fandom.com/wiki/Grimoire_Weiss', 'https://localhost:5001/game_images/Grimoire_Weiss.png', 0, 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `character` VALUES (7, 'GLaDOS', 'abc636e2-be01-43c4-9fe2-bc59ea0ca3ab', 'https://villains.fandom.com/wiki/GLaDOS', 'https://localhost:5001/game_images/GLaDOS_P2.png', 1, 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `character` VALUES (8, 'Shionne Imeris', 'f645fbdf-81b1-494c-827e-7b9369591ab7', 'https://aselia.fandom.com/wiki/Shionne_Vymer_Imeris_Daymore', 'https://localhost:5001/game_images/Shionne.png', 1, 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `character` VALUES (9, 'Julianne \"Jill\" Stingray', '50a01c39-5efb-41fc-9101-d8b2fc166e7d', 'https://va11halla.fandom.com/wiki/Julianne_Stingray', 'https://localhost:5001/game_images/Jill.png', 1, 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `character` VALUES (10, 'Estellise Sidos Heurassein', '3142455a-c2f5-4df1-ab73-0832f3c2c38c', 'https://aselia.fandom.com/wiki/Estellise_Sidos_Heurassein', 'https://localhost:5001/game_images/Estelle.png', 1, 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `character` VALUES (12, 'Atsuro Kihara', '8888f455-083e-4643-b4df-ccfa1968f021', 'https://megamitensei.fandom.com/wiki/Atsuro_Kihara?file=DeSu-Atsuro.png', 'https://localhost:5001/game_images/Atsuro.png', 1, 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');

-- ----------------------------
-- Table structure for platform
-- ----------------------------
DROP TABLE IF EXISTS `platform`;
CREATE TABLE `platform`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of platform
-- ----------------------------
INSERT INTO `platform` VALUES (1, 'PC');
INSERT INTO `platform` VALUES (2, 'PS1');
INSERT INTO `platform` VALUES (3, 'PS2');
INSERT INTO `platform` VALUES (4, 'PS3');
INSERT INTO `platform` VALUES (5, 'PS4');
INSERT INTO `platform` VALUES (6, 'PS5');
INSERT INTO `platform` VALUES (7, 'GameBoy Advance');
INSERT INTO `platform` VALUES (8, 'Nintendo DS');
INSERT INTO `platform` VALUES (9, 'Nintendo 3DS');
INSERT INTO `platform` VALUES (10, 'Nintendo WiiU');
INSERT INTO `platform` VALUES (11, 'Nintendo Switch');
INSERT INTO `platform` VALUES (12, 'PSP');
INSERT INTO `platform` VALUES (13, 'Nintendo Wii');
INSERT INTO `platform` VALUES (14, 'Android');
INSERT INTO `platform` VALUES (15, 'Other');

-- ----------------------------
-- Table structure for playedgame
-- ----------------------------
DROP TABLE IF EXISTS `playedgame`;
CREATE TABLE `playedgame`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `year` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `developer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `publisher` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `genre` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `rating` int NULL DEFAULT NULL,
  `platformid` int NULL DEFAULT NULL,
  `statusid` int NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'image URL',
  `userid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'associated user',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IX_playedgame_platformid`(`platformid`) USING BTREE,
  INDEX `IX_playedgame_statusid`(`statusid`) USING BTREE,
  INDEX `FK_playedgame_user_username`(`userid`) USING BTREE,
  CONSTRAINT `FK_playedgame_platform_platformid` FOREIGN KEY (`platformid`) REFERENCES `platform` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_playedgame_status_statusid` FOREIGN KEY (`statusid`) REFERENCES `status` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_playedgame_user_username` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of playedgame
-- ----------------------------
INSERT INTO `playedgame` VALUES ('00b3c2f5-95f7-4775-9996-a1301e070ca7', 'Brawlhalla', '2017', 'Blue Mammoth Games', 'Ubisoft', 'Platform Fighter', 6, 1, 2, 'https://localhost:5001/game_images/Brawlhalla.jfif', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('02e521f8-6d49-403d-8040-ff509f74527d', 'Saints Row Gat Out of Hell', '2015', 'Volition', 'Deep Silver', 'Open World Action', 5, 1, 5, 'https://localhost:5001/game_images/Saints Row Gat Out of Hell.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('02ef03d4-bb30-4f4b-8031-fe42e5f10238', 'Call of Duty WWII', '2017', 'Sledgehammer', 'Activision', 'First Person Shooter', 7, 1, 1, 'https://localhost:5001/game_images/Call of Duty WWII.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('0406bb3e-3685-4a36-bccd-9c5b7bd5bfe3', 'Bleach 3rd Phantom', '2008', 'SEGA, Torn Create', 'SEGA', 'Tactical RPG', 8, 8, 1, 'https://localhost:5001/game_images/Bleach 3rd Phantom.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('050bb88f-ef91-4952-9f5f-3ab50dafffd4', 'FAR Lone Sails', '2018', 'Okomotive', 'Mixtivision', '2D Adventure', 9, 1, 1, 'https://localhost:5001/game_images/FAR Lone Sails.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('057a7ba9-2cd3-4842-93ac-b06325cc76fd', 'Horizon Zero Dawn', '2017', 'Guerilla Games', 'Sony', 'Action Adventure', 9, 1, 1, 'https://localhost:5001/game_images/Horizon Zero Dawn.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('076408e8-1cdd-4da6-9d63-f207def2330f', 'Nier Re[in]carnation', '2021', 'Applibot', 'Square Enix', 'JRPG / gacha', 5, 14, 5, 'https://localhost:5001/game_images/Nier Reincarnation.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('07ae0a58-321b-4f0d-bb67-e1a61e00bb43', 'Darksiders 2', '2012', 'Virgil Games', 'THQ', 'Hack\'n Slash', 7, 1, 5, 'https://localhost:5001/game_images/Darksiders 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('07c81955-59e9-40ac-87e7-32fa24e68ed5', 'Yakuza 0', '2015', 'Ryu Ga Gotoku Studio', 'SEGA', '3D Beat\'em up', 8, 1, 5, 'https://localhost:5001/game_images/Yakuza 0.jfif', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('085cfd42-28cb-488b-8b46-d8b3757154b4', 'The King of Fighters 98', '1998', 'SNK', 'SNK', 'Fighting', 8, 2, 2, 'https://localhost:5001/game_images/The King of Fighters 98.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('08cb1b15-2ddd-4a43-b023-8d38b76a5797', 'Kirby Mass Attack', '2011', 'HAL Laboratory', 'Nintendo', 'Platform Action Adventure', 8, 8, 1, 'https://localhost:5001/game_images/Kirby Mass Attack.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('08d038ce-f796-45f2-8155-8de78273296f', 'Aeterno Blade', '2020', 'Corecell Technology', 'Arc System Works, Corecell Technology', '2D Beat\'em Up', 4, 1, 5, 'https://localhost:5001/game_images/Aeterno Blade.jfif', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('0aa5683e-47d2-48fe-a0cd-1c6582ff6edc', 'Super Smash Bros Ultimate', '2018', 'Sora Ltd. Nintendo', 'Nintendo', 'Platform Fighter', 8, 11, 2, 'https://localhost:5001/game_images/Super Smash Bros Ultimate.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('0b071dd8-deda-415b-950b-aaa407856701', 'Nascar Heat', '2000', 'Monster Games', 'Hasbro Interactive', 'Racing', 4, 2, 2, 'https://localhost:5001/game_images/Nascar Heat.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('0ceccb35-85d1-4e44-a1ff-8108af09b729', 'Metal Gear Solid V The Phantom Pain', '2015', 'Kojima Productions', 'Konami', 'Open World 3rd Person Shooter', 6, 1, 5, 'https://localhost:5001/game_images/Metal Gear Solid V The Phantom Pain.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('0d125528-db10-4f2d-a819-85be6aa19e7e', 'Star Wars The Force Unleashed 2', '2010', 'Aspyr Media', 'Lucas Art', 'Hack\'n Slash', 6, 1, 5, 'https://localhost:5001/game_images/Star Wars The Force Unleashed 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('0d97e7ac-5698-42b0-ba21-438110621a43', 'Blazblue Cross Tag Battle', '2018', 'Arc System Works', 'Arc System Works', 'Fighting', 5, 1, 2, 'https://localhost:5001/game_images/Blazblue Cross Tag Battle.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('0dbc4e11-fef1-4ec4-8e56-a1fc4ffd2dc0', 'Tales of Berseria', '2016', 'Bandai Namco', 'Bandai Namco', 'Action JRPG', 5, 1, 1, 'https://localhost:5001/game_images/Tales of Berseria.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('0faaf5d2-38d9-4aca-a7d0-1cda1b50c1fb', 'Control', '2019', 'Remedy', '505 Games', 'Action Adventure', 6, 1, 5, 'https://localhost:5001/game_images/Control.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('1009f5f0-0e12-45b7-ba68-19ced577bd3c', 'Trauma Center Under The Knife 2', '2008', 'ATLUS', 'ATLUS', 'Puzzle', 9, 8, 5, 'https://localhost:5001/game_images/Trauma Center Under The Knife 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('119f51c3-dc36-4295-9cdf-e1c6984af4e1', 'Fire Emblem Awakening', '2012', 'Intelligent Systems', 'Nintendo', 'Tactical JRPG', 8, 9, 1, 'https://localhost:5001/game_images/Fire Emblem Awakening.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('1649133e-d70c-4156-aeac-21da070633b4', 'Nier Automata', '2017', 'Platinum Games', 'Square Enix', 'Action JRPG', 10, 1, 1, 'https://localhost:5001/game_images/Nier Automata.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('179d4336-48af-40a8-b1ff-a85a0ec1ee67', 'Astria Ascending', '2021', 'Artisan Studios', ' Dear Villagers, Maple Whispering Limited', 'JRPG', 6, 1, 5, 'https://localhost:5001/game_images/Astria Ascending.jfif', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('184d54e2-ba0d-42b8-8b96-3381fd5e8424', 'Disco Elyssium', '2019', 'ZA/UM', 'ZA/UM', 'Point & Click RPG', 9, 1, 5, 'https://localhost:5001/game_images/Disco Elyssium.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('1aec268c-11ae-4f40-9d5b-049d700ab000', 'Nioh 2', '2020', 'Team Ninja', 'Koei Tecmo', 'Action RPG / Soulslike', 9, 1, 4, 'https://localhost:5001/game_images/Nioh 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('1afcad55-427d-4323-a81c-2cf5335a2e7a', 'Driver 2', '2000', 'Ubisoft Reflections', 'Infogrames', 'Open World Driving', 6, 2, 2, 'https://localhost:5001/game_images/Driver 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('1b6adcd2-1250-4124-85b2-f3c1f5bd8244', 'Voice of Cards The Isle Dragon Roars', '2021', 'Alim', 'Square Enix', 'Tabletop RPG', 8, 1, 1, 'https://localhost:5001/game_images/Voice of Cards.jfif', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('1d2f7fff-a6b8-4dcf-93be-765dbde1e0b8', 'Guilty Gear Strive', '2021', 'Arc System Works', 'Arc System Works, Bandai Namco', 'Fighting', 8, 1, 2, 'https://localhost:5001/game_images/Guilty Gear Strive.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('1e139545-589c-420a-8472-38e635ce5adc', 'Bound By Flame', '2014', 'Spiders', 'Focus Home Interactive', 'Action RPG', 5, 1, 1, 'https://localhost:5001/game_images/Bound By Flame.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('1f79a422-a786-4703-a14e-0e065706cde4', 'Atelier Ryza 2 Lost Legends & The Secret Fairy', '2021', 'Gust Co. Ltd.', 'Koei Tecmo', 'JRPG', 7, 1, 5, 'https://localhost:5001/game_images/Atelier Ryza 2 Lost Legends & The Secret Fairy.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('1fac65d0-4b6a-4742-8924-2826dc6befe0', 'Sacred 3', '2014', 'Keen Games', 'Deep Silver', 'Isometric Action', 5, 1, 5, 'https://localhost:5001/game_images/Sacred 3.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('1fb8c148-8e15-449b-98a2-bfb58fc28b65', 'Ruined King: A League of Legends Story', '2021', 'Airship Syndicate', 'Riot Games', 'RPG', 9, 1, 4, 'https://localhost:5001/game_images/Ruined King.jfif', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('1fd77937-6279-42dc-9009-2d7ad489f265', 'Cuphead', '2017', 'Studio MDHR', 'Studio MDHR', 'Platform Action', 8, 1, 5, 'https://localhost:5001/game_images/Cuphead.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('22a706be-5557-48a6-bd75-2b151a47ca78', 'Blur', '2010', 'Bizarre Creation', 'Activision', 'Racing', 6, 1, 2, 'https://localhost:5001/game_images/Blur.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('23ffb351-4ae1-461d-8d6e-1a652762ec05', 'Mass Effect', '2007', 'Bioware', 'Electronic Arts', '3rd Person Shooter RPG', 9, 1, 1, 'https://localhost:5001/game_images/Mass Effect.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('254f3c33-aa28-4294-904f-e10d84882d85', 'Digimon World Dusk', '2007', 'Bandai', 'Bandai', 'JRPG', 7, 8, 1, 'https://localhost:5001/game_images/Digimon World Dusk.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('257f011f-b597-4d65-bc38-995aebe255d9', 'YuGiOh 5DS World Championship 2009', '2009', 'Konami', 'Konami', 'Cards', 9, 8, 1, 'https://localhost:5001/game_images/YuGiOh 5DS World Championship 2009.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('25c4e179-d1fc-43db-9fa2-47f8a7d1cfef', 'Hob', '2017', 'Runic Games', 'Runic games', 'Action Adventure', 6, 1, 5, 'https://localhost:5001/game_images/Hob.jfif', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('268df007-2d33-46a0-9d62-dd198676add8', 'Steam World Dig', '2013', 'Image & Form', 'Image and Form', 'Sandbox Platform', 8, 1, 1, 'https://localhost:5001/game_images/Steam World Dig.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('27826b7a-d126-43d1-8712-c9d6721051a2', 'Sacred', '2004', 'Ascaron', 'Take Two, Deep Silver', 'ARPG isometric', 7, 1, 1, 'https://localhost:5001/game_images/Sacred.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('285132a4-375d-4978-a68c-b7e72c0b6e4b', 'Mass Effect 3', '2012', 'Bioware', 'Electronic Arts', '3rd Person Shooter RPG', 10, 1, 1, 'https://localhost:5001/game_images/Mass Effect 3.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('28b8dc74-1607-42f3-a79f-ff50b1d96b1b', 'Final Fantasy III 3D Remake', '2012', 'Square Enix', 'Square Enix', 'JRPG', 6, 12, 5, 'https://localhost:5001/game_images/Final Fantasy 3.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('294128b4-128f-4c0c-b85b-fe70dc552ffe', 'The Witness', '2016', 'Thekla Inc.', 'Thekla Inc.', 'Puzzle', 8, 1, 5, 'https://localhost:5001/game_images/The Witness.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('2b8936b8-7a6f-4645-833e-385f70da7afd', 'Greedfall', '2019', 'Spiders', 'Focus Home Interactive', 'Action RPG', 5, 1, 5, 'https://localhost:5001/game_images/Greedfall.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('2cc42cbd-e56a-4214-b106-bc403c33bd77', 'DMC Devil May Cry', '2013', 'Ninja Theory', 'CAPCOM', 'Hack\'n Slash', 6, 1, 1, 'https://localhost:5001/game_images/DMC Devil May Cry.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('2d6404dd-d518-459b-994d-f01379e61cac', 'Fantasy Strike', '2019', 'David Sirlin', 'David Sirlin', 'Fighting', 3, 1, 2, 'https://localhost:5001/game_images/Fantasy Strike.jfif', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('2ed85464-ddbe-40f2-b3a7-c3232fc853c0', 'X-Men Mutant Academy 2', '2001', 'Midway Studios', 'Sony, Activision', 'Fighting', 8, 2, 2, 'https://localhost:5001/game_images/X-Men Mutant Academy 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('308e2e29-c4bc-463d-8e85-67c455db4dd2', 'Firewatch', '2016', 'Camposanto', 'Panic, Camposanto', 'Interactive Novel', 8, 1, 1, 'https://localhost:5001/game_images/Firewatch.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('3142455a-c2f5-4df1-ab73-0832f3c2c38c', 'Tales of Vesperia Definitive Edition', '2019', 'Namco Tales Studio', 'Bandai Namco', 'Action JRPG', 9, 1, 1, 'https://localhost:5001/game_images/Tales of Vesperia Definitive Edition.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('32d41503-ea94-41f0-b867-75b26af2e28f', 'FIFA 14', '2013', 'EA Sports', 'Electronic Arts', 'Sports/Football', 7, 1, 2, 'https://localhost:5001/game_images/FIFA 14.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('32eb197b-3e08-44c9-9a18-620f59903da8', 'Call of Duty Modern Warfare 3', '2011', 'Infinite Wards', 'Activision', 'First Person Shooter', 5, 1, 1, 'https://localhost:5001/game_images/Call of Duty Modern Warfare 3.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('33a11b04-6a29-4df0-94e4-e391ca4d7979', 'Middle-Earth Shadow of Mordor', '2014', 'Monolith Studios', 'Warner Bros Interactive', 'Open World Action Adventure', 6, 1, 1, 'https://localhost:5001/game_images/Middle-Earth Shadow of Mordor.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('33daa5b6-16c5-4876-8388-bd6e7e4e196a', 'Grand Theft Auto V', '2015', 'Rockstar North', 'Rockstar Games', 'Open World 3rd Person Shooter', 8, 1, 1, 'https://localhost:5001/game_images/Grand Theft Auto V.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('356ac0f1-6859-4a00-a62a-9ca87530e3af', 'Bully', '2006', 'Rockstar Vancouver', 'Rockstar Games', 'Open World Action', 5, 1, 5, 'https://localhost:5001/game_images/Bully.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('387b0d2e-1b09-47d4-86ac-cebf8c6dde12', 'Naruto Shippuden Ultimate Ninja Storm 3', '2013', 'CyberConect 2', 'Bandai Namco', 'Arena Fighter', 7, 1, 1, 'https://localhost:5001/game_images/Naruto Shippuden Ultimate Ninja Storm 3.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('38c23499-1351-4a94-a194-0b9cc1a0bc4c', 'Astral Chain', '2019', 'Platinum Games', 'Nintendo', 'Hack\'n Slash', 9, 11, 1, 'https://localhost:5001/game_images/Astral Chain.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('3db0e11d-4b3a-4d99-ae2e-d690792ad70e', 'Naruto Ultimate Ninja Storm', '2008', 'CyberConect 2', 'Bandai Namco', 'Arena Fighter', 5, 1, 5, 'https://localhost:5001/game_images/Naruto Ultimate Ninja Storm.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('3ddf4ba9-b77f-48d6-93e9-d26b33ed8a36', 'FIFA 19', '2018', 'EA Sports', 'Electronic Arts', 'Sports / Football', 7, 1, 2, 'https://localhost:5001/game_images/FIFA 19.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('3e899ee2-808f-4e46-92f6-d3cbd534bc29', 'Final Fantasy 1 & 2 Dawn of Souls', '2004', 'Square Enix', 'Nintendo', 'JRPG', 4, 7, 5, 'https://localhost:5001/game_images/Final Fantasy 1&2 Dawn of Souls.jfif', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('3ea3976e-46b9-41e4-b680-af47d682533c', 'Twisted Metal 2', '1996', 'SingleTrac', 'Sony', 'Vehicle Combat', 7, 2, 2, 'https://localhost:5001/game_images/Twisted Metal 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('3f1870e6-629f-46d5-bbd6-1e7415deef1f', 'Hades', '2020', 'Supergiant Games', 'Supergiant Games', 'Rogue-Like', 9, 1, 4, 'https://localhost:5001/game_images/Hades.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('3f50984c-fc7f-492c-8200-2039423d81a8', 'Final Fantasy XV', '2018', 'Square Enix', 'Square Enix', 'Action JRPG', 6, 1, 1, 'https://localhost:5001/game_images/Final Fantasy XV.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('4061c455-bbc3-41e3-9d81-db0293989216', 'Super Smash Bros Brawl', '2008', 'Sora Ltd, Nintendo', 'Nintendo', 'Platform Fighter', 4, 13, 2, 'https://localhost:5001/game_images/Super Smash Bros Brawl.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('43020cc7-61cd-43d1-b3d3-c8d6b1cfc39e', 'Spiderman 2 Enter Electro', '2001', 'Vicarious Visions', 'Activision', 'Action Adventure', 7, 2, 5, 'https://localhost:5001/game_images/Spiderman 2 Enter Electro.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('43787106-c057-4494-819a-bd65d6caf521', 'Dota 2', '2013', 'Valve', 'Valve', 'MOBA', 7, 1, 2, 'https://localhost:5001/game_images/Dota 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('43d0600f-8322-49ac-8917-b8473ff3c2c7', 'Dead Or Alive 6', '2019', 'Team Ninja', 'Koei Tecmo', 'Fighting', 6, 1, 2, 'https://localhost:5001/game_images/Dead Or Alive 6.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('4411349d-6b13-4573-9318-76bef6575f17', 'Rivals of Aether', '2017', 'Dan Fornace', 'Dan Fornace', 'Platform Fighter', 9, 1, 2, 'https://localhost:5001/game_images/Rivals of Aether.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('4421e818-7a2b-41a1-bf9a-6fa1854d2aed', 'Pokémon Ranger Shadows of Almia', '2008', 'HAL Laboratory', 'Nintendo', 'Adventure RPG', 7, 8, 5, 'https://localhost:5001/game_images/Pokémon Ranger Shadows of Almia.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('4493ccb1-a182-43bd-b316-96a5d8b3ddd6', 'RWBY Grimn Eclipse', '2016', 'Rooster Teeth Games', 'Rooster Teeth', 'Action Adventure', 3, 1, 5, 'https://localhost:5001/game_images/RWBY Grimn Eclipse.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('45246225-7a3d-4ef6-a11f-18d6a3948037', 'Assassin\'s Creed IV Black Flag', '2013', 'Ubisoft', 'Ubisoft', 'Open World Action Adventure', 6, 1, 5, 'https://localhost:5001/game_images/Assassin\'s Creed IV Black Flag.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('4607597d-59c5-4ce1-9a2e-ce6010d83e6d', 'Jump Force', '2019', 'Spike Chunsoft', 'Bandai Namco', 'Arena Fighter', 2, 1, 5, 'https://localhost:5001/game_images/Jump Force.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('47994d70-4ee8-4968-8db1-8fea721771d2', 'Shovel Knight', '2014', 'Yacht Club Games', 'Yacht Club Games', 'Platform Action Adventure', 8, 1, 5, 'https://localhost:5001/game_images/Shovel Knight.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('4a2a3240-4f87-4835-bfd6-2096978abbb2', 'Drakengard 3', '2013', 'Access Games', 'Square Enix', 'Hack\'n Slash / Musou', 9, 4, 1, 'https://localhost:5001/game_images/Drakengard 3.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('4d7944f9-8912-4a93-9f8e-43ba607a1ddb', 'Bloodrayne Betrayal: Fresh Bites', '2011', 'Wayforward', 'Arc System Works, Majesco Entertainment', '2D Beat\'em Up', 3, 1, 5, 'https://localhost:5001/game_images/Bloodrayne Betrayal Fresh Bites.jfif', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('4f848327-891a-4483-b9ba-2f00da94762c', 'Indivisible', '2019', 'Lab Zero Games', '505 Games', 'ARPG / Platform', 8, 1, 5, 'https://localhost:5001/game_images/Indivisible.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('5035439a-9a7d-4705-b21b-6400426f89cb', 'Minecraft', '2009', 'Mojang', 'Microsoft', 'Sandbox', 8, 1, 2, 'https://localhost:5001/game_images/Minecraft.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('506fc4be-06d3-4bfc-b64d-3dde765a4a92', 'Naruto Shippuden Ultimate Ninja Storm Revolution', '2015', 'CyberConect 2', 'Bandai Namco', 'Arena Fighter', 5, 1, 1, 'https://localhost:5001/game_images/Naruto Shippuden Ultimate Ninja Storm Revolution.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('50a01c39-5efb-41fc-9101-d8b2fc166e7d', 'Cyberpunk Bartender Action VA-11 Hall-A', '2016', 'Sukeban Games', 'Ysbryd Games', 'Visual Novel', 10, 1, 1, 'https://localhost:5001/game_images/Cyberpunk Bartender Action VA-11 Hall-A.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('51a23132-99ae-4e91-ad7f-a4d657e83525', 'Dragon Ball Xenoverse', '2015', 'Dimps', 'Bandai Namco', 'Arena Fighter', 5, 1, 1, 'https://localhost:5001/game_images/Dragon Ball Xenoverse.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('53ff3c14-7493-4544-8a75-19c273674529', 'Undertale', '2015', 'Toby Fox', 'Toby Fox', 'RPG', 10, 1, 1, 'https://localhost:5001/game_images/Undertale.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('542705f7-98d5-4452-a0fa-5a4c7d4afd8b', 'Magic The Gathering Arena', '2019', 'Wizards of the Coast Games Studio', 'Wizards of the Coast', 'Cards', 9, 1, 2, 'https://localhost:5001/game_images/Magic The Gathering Arena.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('5555daf6-f8aa-4f2b-b7ba-f01609be307d', 'DiRT Rally', '2015', 'Codemasters', 'Codemasters', 'Racing Simulation', 7, 1, 5, 'https://localhost:5001/game_images/DiRT Rally.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('55db66ab-f7cd-4e35-8433-b6e7b4b45928', 'Age of Empires II', '1999', 'Esemble Studios, Skybox Labs', 'Microsoft', 'Real Time Strategy', 9, 1, 2, 'https://localhost:5001/game_images/Age of Empires II.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('56433617-9b22-4ae6-a3b5-ca3c52902010', 'Need For Speed Most Wanted', '2005', 'EA Black Box', 'Electronic Arts', 'Racing', 7, 1, 5, 'https://localhost:5001/game_images/Need For Speed Most Wanted.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('574654d9-fc23-4b53-b9a0-e5eeff4810c5', 'Digimon Story Cyber Sleuth', '2015', 'Media.Vision', 'Bandai Namco', 'JRPG', 9, 1, 1, 'https://localhost:5001/game_images/Digimon Story Cyber Sleuth.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('57c55914-9213-4a4e-85ff-880102debf90', 'The King of Fighters XIV', '2013', 'SNK', 'SNK', 'Fighting', 4, 1, 2, 'https://localhost:5001/game_images/The King of Fighters XIV.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('57f25d10-aeb3-4da4-ad26-4de17119f739', 'Pro Evolution Soccer 2002', '2002', 'Konami', 'Konami', 'Football', 9, 2, 1, 'https://localhost:5001/game_images/Pro Evolution Soccer 2002.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('57fe9053-ee94-4edc-ac3b-5527ea13bf4e', 'Life is Strange Before the Storm', '2017', 'Dontnold Entertainment', 'Square Enix', 'Interactive Novel', 5, 1, 5, 'https://localhost:5001/game_images/Life is Strange Before the Storm.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('59194e25-9536-4215-b728-d2327101f14a', 'Final Fantasy VII', '1997', 'Square Enix', 'Square Enix', 'JRPG', 5, 1, 5, 'https://localhost:5001/game_images/Final Fantasy VII.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('5921e706-f7c0-49b0-b1c7-3b6ae8cb9e0f', 'Funbag Fantasy', '2019', 'Waffle', 'Mangagamer', 'Visual Novel / Hentai', 7, 1, 1, 'https://localhost:5001/game_images/Funbag Fantasy.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('595a84ac-860b-4ae2-baaf-74d1892c7bc4', 'The Legend of Zelda Breath of the Wild', '2017', 'Nintendo', 'Nintendo', 'Open World Action Adventure', 8, 10, 5, 'https://localhost:5001/game_images/The Legend of Zelda Breath of the Wild.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('5c12bf90-9019-4511-83a6-efd5955efdc5', 'Lords of The Fallen', '2015', 'CI Games, Deck 13', 'CI Games, Bandai Namco', 'Action / Soulslike', 5, 1, 5, 'https://localhost:5001/game_images/Lords of The Fallen.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('5e8da665-5ef2-4f7d-b26b-307f59d3a1dd', 'A Rose in the Twilight', '2017', 'Nippon Ichi Software', 'NIS America', '2D Puzzle', 5, 1, 5, 'https://localhost:5001/game_images/A Rose in the Twilight.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('6019d098-b859-4e03-908f-0a24497e2fff', 'TERA', '2011', 'Krafton', 'Ubisoft, Gameforge Berlin', 'MMORPG', 5, 1, 2, 'https://localhost:5001/game_images/TERA.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('61018dd1-2f6b-499e-9a5a-2802794d609b', 'Doki Doki Literature Club', '2017', 'Team Salvato', 'Team Salvato', 'Visual Novel', 3, 1, 1, 'https://localhost:5001/game_images/Doki Doki Literature Club.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('6305e87a-4ecd-437c-b70f-d8dfa4a5c0f8', 'Warframe', '2013', 'Digital Extremes', 'Digital Extremes', 'MMO Action RPG', 7, 1, 2, 'https://localhost:5001/game_images/Warframe.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('64bb12c1-06eb-4c35-a51b-87e5c3325fb5', 'Guitar Hero III Legends of Rock', '2007', 'Aspyr Media', 'Activision, RedOctane', 'Rhythm', 9, 1, 1, 'https://localhost:5001/game_images/Guitar Hero III Legends of Rock.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('653068ab-bf07-4537-9f7e-295345d301cc', 'YuGiOh GX Spirit Caller', '2007', 'Konami', 'Konami', 'Cards', 9, 8, 1, 'https://localhost:5001/game_images/YuGiOh GX Spirit Caller.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('66de123b-2a1b-4b99-b78e-0b95a109dd9b', 'Grand Theft Auto San Andreas', '2004', 'Rockstar North', 'Rockstar Games', 'Open World 3rd Person Shooter', 10, 1, 1, 'https://localhost:5001/game_images/Grand Theft Auto San Andreas.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('69688e7a-fb83-436b-b8f2-217c468ba356', 'Pro Evolution Soccer 2013', '2012', 'Konami', 'Konami', 'Sports/Football', 8, 1, 1, 'https://localhost:5001/game_images/Pro Evolution Soccer 2013.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('6c45dc59-f3b6-416d-8b5c-68baf8f94d71', 'Regalia of Men and Monarchs', '2018', 'Pixelated Milk', 'Klabator', 'Tactical RPG', 7, 1, 1, 'https://localhost:5001/game_images/Regalia of Men and Monarchs.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('6d39bf73-103e-4418-b4d3-337619c78504', 'Dragon Age Origins', '2009', 'Bioware', 'Electronic Arts', 'Action RPG', 6, 1, 5, 'https://localhost:5001/game_images/Dragon Age Origins.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('6e746f05-c6e3-4be8-b58d-5809a121ec1c', 'Sekiro Shadows Die Twice', '2019', 'From Software', 'Activision', 'Action Adventure / Soulslike', 10, 1, 1, 'https://localhost:5001/game_images/Sekiro Shadows Die Twice.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('6f0982dd-b22c-4a64-bb6b-1d66ff92e74b', 'Crystar', '2018', 'Gamedrops', 'Spyke Chunsoft', 'Hack\'n Slash', 4, 1, 5, 'https://localhost:5001/game_images/Crystar.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('710706ac-8216-450b-987c-a0ed06dc7d0c', 'The Witcher 3 Wild Hunt', '2015', 'CD Projekt Red', 'CD Projekt', 'Action RPG', 8, 1, 1, 'https://localhost:5001/game_images/The Witcher 3 Wild Hunt.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('71224041-c215-42f4-861d-c3fcf80960ff', 'Mass Effect 2', '2010', 'Bioware', 'Electronic Arts', '3rd Person Shooter RPG', 10, 1, 1, 'https://localhost:5001/game_images/Mass Effect 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('73c3228a-443c-4dfb-929d-ecb322a89398', 'Watchdogs', '2014', 'Ubisoft', 'Ubisoft', 'Open World 3rd Person Shooter', 4, 1, 5, 'https://localhost:5001/game_images/Watchdogs.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('73c417df-869b-42e0-be66-3f9bd3d662bf', 'Tekken 3', '1997', 'Namco', 'Namco', 'Fighting', 9, 2, 2, 'https://localhost:5001/game_images/Tekken 3.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('7941a25c-cd84-44e1-bf9f-64a0581ff91a', 'Psycho Pass Mandatory Happiness', '2015', '5pb', 'Nippon Ichi Software, NIS America', 'Visual Novel', 6, 1, 1, 'https://localhost:5001/game_images/Psycho Pass Mandatory Happiness.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('7b3911f4-31ee-484d-ac6e-4c82d25c85ec', 'Infinity Wars', '2014', 'Lightmare Studios', 'Lightmare Studios, Yodo1 Games', 'Card Game', 6, 1, 2, 'https://localhost:5001/game_images/Infinity Wars.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('7d45769b-393d-4a09-9870-76f83ef94669', 'Nier', '2010', 'Cavia', 'Square Enix', 'Action JRPG', 9, 4, 1, 'https://localhost:5001/game_images/Nier.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('7f12e645-6c8d-4a40-bbd4-7c5a43b8f48a', 'Forza Horizon 4', '2018', 'Playground Games', 'Microsoft', 'Racing', 10, 1, 2, 'https://localhost:5001/game_images/Forza Horizon 4.jfif', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('8130c922-7d3d-4be2-a3cb-d876a871c194', 'Guilty Gear XX Accent Core +R', '2013', 'Arc System Works', 'Arc System Works', 'Fighting', 8, 1, 2, 'https://localhost:5001/game_images/Guilty Gear XX Accent Core +R.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('82bcb704-767e-4a1e-b19d-9d1af2504d47', 'Pokémon Sapphire', '2002', 'Gamefreak', 'Nintendo', 'JRPG', 6, 7, 1, 'https://localhost:5001/game_images/Pokémon Sapphire.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('82e66d29-51a2-4112-b450-8899fe15d642', 'Titanfall 2', '2017', 'Respawn Entertainment', 'Electronic Arts', 'First Person Shooter', 9, 1, 1, 'https://localhost:5001/game_images/Titanfall 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('843493b0-225b-4dd3-b535-3ed569ef3059', 'Legends of Runeterra', '2020', 'Riot Games', 'Riot Games', 'Cards', 9, 1, 2, 'https://localhost:5001/game_images/Legends of Runeterra.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('854ac049-482e-4e29-bcb6-4bdbf34203b3', 'The Witcher 2 Assassins of Kings', '2011', 'CD Projekt Red', 'CD Projekt', 'Action RPG', 9, 1, 1, 'https://localhost:5001/game_images/The Witcher 2 Assassins of Kings.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('8553db29-0b84-4172-ba4d-fb00ed5b6f6b', 'Crash Team Racing', '1999', 'Naughty Dog', 'Sony', 'Racing', 7, 2, 2, 'https://localhost:5001/game_images/Crash Team Racing.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('85f6b36d-db09-4692-b13d-41951becf16a', 'Life is Strange', '2015', 'Dontnold Entertainment', 'Square Enix', 'Interactive Novel', 9, 1, 1, 'https://localhost:5001/game_images/Life is Strange.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('865106fb-c753-49aa-9665-92b83a3ff111', 'Guilty Gear Xrd Rev 2', '2017', 'Arc System Works', 'Arc System Works', 'Fighting', 6, 1, 2, 'https://localhost:5001/game_images/Guilty Gear Xrd Rev 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('86a6fd82-3c53-4f9e-a5a2-10ee1f42ed93', 'Prototype 2', '2012', 'Radical Entertainment', 'Activision', 'Open World Action', 4, 1, 5, 'https://localhost:5001/game_images/Prototype 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('88748fd1-7beb-4c44-b9ef-21895fad4632', 'Warcraft III The Frozen Throne', '2003', 'Blizzard', 'Blizzard', 'Real Time Strategy', 6, 1, 2, 'https://localhost:5001/game_images/WarCraft III The Frozen Throne.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('8888f455-083e-4643-b4df-ccfa1968f021', 'Shin Megami Tensei Devil Survivor', '2009', 'ATLUS, Career Soft', 'ATLUS, Nintendo', 'Tactical JRPG', 10, 8, 1, 'https://localhost:5001/game_images/Shin Megami Tensei Devil Survivor.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('893312e5-5770-460d-bddb-fdce94320273', 'Journey', '2012', 'Thatgamecompany', 'Sony', 'Platform Adventure', 10, 1, 1, 'https://localhost:5001/game_images/Journey.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('896a4b00-4558-49bd-8574-309bc74acc23', 'Tower Hunter Erza\'s Trial', '2019', 'IceSitruuna', 'IceSitruuna', 'Rogue-Like', 7, 1, 2, 'https://localhost:5001/game_images/Tower Hunter Erza\'s Trial.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('897ea030-772f-445d-8a57-3bd30c7ef01b', 'Digimon Rumble Arena', '2001', 'Bandai, Hudson Soft', 'Bandai, Hudson Soft', 'Platform Fighter', 9, 2, 1, 'https://localhost:5001/game_images/Digimon Rumble Arena.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('8d243f39-a163-4040-b1e7-121f84fcad75', 'Super Smash Bros 4 WiiU', '2014', 'Sora Ltd. Nintendo', 'Nintendo', 'Platform Fighter', 7, 1, 2, 'https://localhost:5001/game_images/Super Smash Bros 4 WiiU.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('8e324497-0ca4-4473-959c-ba3d7a4111e8', 'Quake 3 Arena', '1999', 'id Software', 'Activision', '1st Person Shooter', 8, 1, 2, 'https://localhost:5001/game_images/Quake 3 Arena.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('8f714a92-4f02-427a-8fb4-7ed69c8df3f7', 'Metal Slug 2', '1998', 'SNK', 'SNK', 'Side Scrolling Shooter', 8, 2, 1, 'https://localhost:5001/game_images/Metal Slug 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('90417cba-7d5d-4c57-9d3d-c72801661a7d', 'Street Fighters V', '2016', 'CAPCOM', 'CAPCOM', 'Fighting', 7, 1, 2, 'https://localhost:5001/game_images/Street Fighters V.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('91884832-d461-47dc-bcde-d9a9887f5fcc', 'Final Fantasy Pixel Remaster', '2021', 'Square Enix', 'Square Enix', 'JRPG', 6, 1, 1, 'https://localhost:5001/game_images/Final Fantasy Pixel Remaster.jfif', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('92361edd-cf5e-4fb7-bb58-e336385f53d8', 'Devil May Cry V', '2019', 'CAPCOM', 'CAPCOM', 'Hack\'n Slash', 6, 1, 5, 'https://localhost:5001/game_images/Devil May Cry V.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('9280d41d-0230-4546-8e00-3e4894423ed6', 'Bleach The Blade of Fate', '2006', 'Treasure Co. Ltd', 'SEGA', 'Fighting', 6, 8, 1, 'https://localhost:5001/game_images/Bleach The Blade of Fate.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('92d66d1f-1237-41b4-8dc6-25a581e4d14f', 'Persona 5 Strikers', '2021', 'ATLUS, Koei Tecmo', 'SEGA', 'Musou', 10, 1, 1, 'https://localhost:5001/game_images/Persona 5 Strikers.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('92f0b197-40f3-4545-87ff-0835b4696a1f', 'Soulcalibur VI', '2018', 'Bandai Namco', 'Bandai Namco', 'Fighting', 8, 1, 2, 'https://localhost:5001/game_images/Soulcalibur VI.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('93319e3e-6fde-4858-867d-3a176631cb50', 'Bloody Roar 2', '1999', '8ing/Raizing, Hudson Soft', 'Hudson Soft, Sony, Virgin', 'Fighting', 7, 2, 2, 'https://localhost:5001/game_images/Bloody Roar 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('9376da0a-a119-4959-bf0c-1520d7b8e41f', 'Forza Horizon 3', '2016', 'Playground Games', 'Microsoft', 'Racing', 10, 1, 2, 'https://localhost:5001/game_images/Forza Horizon 3.jfif', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('93cdc5b2-049c-44bc-acaf-8c006103cf34', 'Avatar The Last Airbender Into the Inferno', '2008', 'THQ', 'THQ', 'Action Adventure', 5, 8, 5, 'https://localhost:5001/game_images/Avatar The Last Airbender Into the Inferno.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('93d7388d-0438-488f-8d34-993369a79d7b', 'Ninja Gaiden Sigma', '2007', 'Team Ninja', 'Koei Tecmo', 'Hack\'n Slash', 5, 1, 5, 'https://localhost:5001/game_images/Ninja Gaiden Sigma.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('9419daa4-fa1e-4e34-801d-bf00061e3612', 'The Beginner\'s Guide', '2015', 'Everything Unlimited Ltd', 'Everthing Unlimited Ltd', 'Interactive Novel', 8, 1, 1, 'https://localhost:5001/game_images/The Beginner\'s Guide.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('968516ae-57f8-486c-b24a-8f269400f10f', 'YuGiOh Forbidden Memories', '2002', 'Konami', 'Konami', 'Cards', 6, 2, 1, 'https://localhost:5001/game_images/YuGiOh Forbidden Memories.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('96e16551-2690-4173-a592-8ce7ca8cb6ca', 'Code of Princess EX', '2018', 'Nicalis, Studio Saizensen', 'Nicalis', '2D Beat\'em Up', 6, 1, 3, 'https://localhost:5001/game_images/Code of Princess EX.jfif', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('97f3de86-4cbe-4061-adab-156af2bd2b81', 'Bayonetta 2', '2014', 'Platinum Games', 'Nintendo', 'Hack\'n Slash', 10, 10, 1, 'https://localhost:5001/game_images/Bayonetta 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('980b0ac5-fbfb-4621-82c8-22b77c8c6958', 'YuGiOh Tag Force', '2006', 'Konami', 'Konami', 'Cards', 7, 12, 1, 'https://localhost:5001/game_images/YuGiOh Tag Force.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('991fdf9c-43a3-4c85-ab35-bf7e081fe643', 'Metal Gear Rising Revengeance', '2013', 'Platinum Games', 'Konami', 'Hack\'n Slash', 9, 1, 1, 'https://localhost:5001/game_images/Metal Gear Rising Revengeance.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('993bb0c1-ecf9-4805-b18e-e1d4d4841a83', 'Vanquish', '2013', 'Platinum Games', 'SEGA', '3rd Person Shooter', 6, 1, 5, 'https://localhost:5001/game_images/Vanquish.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('994ef2a7-8728-4142-9313-50413635dc19', 'Pro Evolution Soccer 2012', '2011', 'Konami', 'Konami', 'Sports/Football', 8, 1, 2, 'https://localhost:5001/game_images/Pro Evolution Soccer 2012.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('9ae5aa48-bc6f-44c8-9985-24d6a1f175f5', 'Spiderman (2000)', '2000', 'Neversoft', 'Activision', 'Action Adventure', 7, 2, 1, 'https://localhost:5001/game_images/Spiderman (2000).jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('9cd68099-2524-4de5-96ba-a281048ef22b', 'Bleach DS 4th Flame Bringer', '2009', 'Dimps', 'SEGA', 'Side Scrolling Action', 5, 8, 5, 'https://localhost:5001/game_images/Bleach DS 4th Flame Bringer.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('9d10443c-bc2e-4f2d-a7af-3cf47b752f52', 'Pokémon Diamond', '2006', 'Gamefreak', 'Nintendo', 'JRPG', 7, 8, 1, 'https://localhost:5001/game_images/Pokémon Diamond.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('9e481a65-e865-43aa-bc61-0a62b6e77577', 'Metal Slug', '1996', 'SNK', 'SNK', 'Side Scrolling Shooter', 8, 2, 1, 'https://localhost:5001/game_images/Metal Slug.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('9e675dfa-11cf-4992-95a4-7ba00ef040a0', 'Virtua Tennis 4', '2011', 'SEGA', 'SEGA', 'Sports/Tennis', 9, 1, 2, 'https://localhost:5001/game_images/Virtua Tennis 4.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('9f19f6fb-7c22-4551-80a4-419722cb691e', 'Shin Megami Tensei Devil Survivor 2', '2011', 'ATLUS, Career Soft', 'ATLUS, Nintendo', 'Tactical RPG', 6, 8, 5, 'https://localhost:5001/game_images/Shin Megami Tensei Devil Survivor 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('a0168499-d903-4001-976b-4b6b3877f638', 'Blade Strangers', '2018', 'Studio Saizensen', 'Nicalis', 'Fighting', 8, 1, 2, 'https://localhost:5001/game_images/Blade Strangers.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('a11004c5-64a1-49fd-8850-d2c119e42e19', 'Hot Wheels Unleashed', '2021', 'Milestone S.r.l.', 'Milestone S.r.l.', 'Racing', 4, 1, 5, 'https://localhost:5001/game_images/hot-wheels-unleashed.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('a1d17721-0c5d-4048-92c3-b040c8e96026', 'Watchdogs 2', '2016', 'Ubisoft', 'Ubisoft', 'Open World 3rd Person Shooter', 6, 1, 5, 'https://localhost:5001/game_images/Watchdogs 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('a3c6f417-6b44-4cdd-a6ed-eb8f78546864', 'Naruto Shippuden Ultimate Ninja Storm 4', '2016', 'CyberConect 2', 'Bandai Namco', 'Arena Fighter', 7, 1, 1, 'https://localhost:5001/game_images/Naruto Shippuden Ultimate Ninja Storm 4.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('a736232d-b5b0-4743-ab26-d347b766b983', 'Ninja Blade', '2009', 'From Software', 'Microsoft', 'Hack\'n Slash', 7, 1, 5, 'https://localhost:5001/game_images/Ninja Blade.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('a76d1174-c87e-495b-90b6-646864648d97', 'Medal of Honor Warfighter', '2012', 'EA Los Angeles', 'Electronic Arts', 'First Person Shooter', 5, 1, 1, 'https://localhost:5001/game_images/Medal of Honor Warfighter.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('a76f1735-3f19-4c57-9a97-f87eb8bd2e0b', 'Oninaki', '2019', 'Tokyo RPG Factory', 'Square Enix', 'Action JRPG', 7, 1, 1, 'https://localhost:5001/game_images/Oninaki.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('a87dd48e-3b64-48cd-87fc-a679bf9ce9dc', 'Final Fantasy 3 Pixel Remaster', '2021', 'Square Enix', 'Square Enix', 'JRPG', 7, 1, 1, 'https://localhost:5001/game_images/Final Fantasy 3 Pixel Remaster.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('a8a747fd-c5c3-49d4-ba65-6cea329b977d', 'Persona 5', '2017', 'ATLUS', 'ATLUS', 'JRPG / Visual Novel', 10, 4, 1, 'https://localhost:5001/game_images/Persona 5.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('a90e10b7-c243-4a4e-ad74-b82e72ae3caa', 'Devil May Cry 4', '2008', 'CAPCOM', 'CAPCOM', 'Hack\'n Slash', 8, 1, 1, 'https://localhost:5001/game_images/Devil May Cry 4.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('aa5d9f9d-1c8c-4f5e-8631-de792b4abda0', 'Ni no Kuni II Revenant Kingdom', '2018', 'Level-5', 'Bandai Namco', 'Action JRPG', 7, 1, 1, 'https://localhost:5001/game_images/Ni no Kuni 2.jfif', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('ab4413c2-a85a-4064-b379-885fb5a7d590', 'Star Wars Jedi Fallen Order', '2019', 'Respawn Entertainment', 'Electronic Arts', 'Action Adventure', 7, 1, 1, 'https://localhost:5001/game_images/Star Wars Jedi Fallen Order.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('abc636e2-be01-43c4-9fe2-bc59ea0ca3ab', 'Portal 2', '2011', 'Valve', 'Valve', '1st Person Puzzle', 10, 1, 1, 'https://localhost:5001/game_images/Portal 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('acfc9b88-1719-405f-ab2b-d300d54298e7', 'Limbo', '2010', 'Playdead', 'Microsoft', 'Side Scrolling Adventure Puzzle', 9, 1, 1, 'https://localhost:5001/game_images/Limbo.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('aeb9478c-7cfb-4ce3-b248-96765840e9f5', 'FIFA 15', '2014', 'EA Sports', 'Electronic Arts', 'Sports/Football', 8, 1, 2, 'https://localhost:5001/game_images/FIFA 15.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('af4e3c5a-b437-4d64-82cf-815683910691', 'GRIS', '2018', 'Nomada Studio', 'Devolver Digital', 'Platform', 10, 1, 1, 'https://localhost:5001/game_images/GRIS.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('b24d4c81-562e-4158-aaeb-2b0c83eae91f', 'Dark Souls 3', '2016', 'From Software', 'Bandai Namco', 'Action RPG / Souls', 8, 1, 5, 'https://localhost:5001/game_images/Dark Souls 3.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('b2874959-c214-450a-98d9-e65b3ee69791', 'Street Fighter Alpha 3', '1998', 'CAPCOM', 'CAPCOM', 'Fighting', 7, 2, 2, 'https://localhost:5001/game_images/Street Fighter Alpha 3.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('b312fb15-5a7f-446f-835c-d00a0fef8957', 'Hollow Knight', '2017', 'Team Cherry', 'Team Cherry', 'Metroidvania / Soulslike', 7, 1, 5, 'https://localhost:5001/game_images/Hollow Knight.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('b320a115-94c2-43da-ac22-0fd6c712992c', 'Megaman ZX Advent', '2007', 'CAPCOM', 'CAPCOM', 'Side Scrolling Action', 8, 8, 1, 'https://localhost:5001/game_images/Megaman ZX Advent.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('b392cb92-8396-4365-b213-8e433c62761a', 'Dragon Ball FighterZ', '2018', 'Arc System Works', 'Bandai Namco', 'Fighting', 5, 1, 5, 'https://localhost:5001/game_images/Dragon Ball FighterZ.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('b4484dd7-ed26-4939-8142-7383c21f0c26', 'Portal', '2007', 'Valve', 'Valve', 'Puzzle', 10, 1, 1, 'https://localhost:5001/game_images/Portal.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('b4a8a3a4-848e-4573-b196-bd410fb9d442', 'Harry Potter and the Sorcerer\'s Stone', '2001', 'KnowWonder', 'Electronic Arts', 'Action Adventure', 7, 2, 5, 'https://localhost:5001/game_images/Harry Potter and the Sorcerer\'s Stone.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('b6830a6d-8c0c-4554-8106-38b908ab554e', 'The Red Strings Club', '2018', 'Deconstruct Team', 'Devolver Digital', 'Visual Novel', 9, 1, 1, 'https://localhost:5001/game_images/The Red Strings Club.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('b76f9a5c-c2a0-42ac-9524-d2046488bc37', 'Slay the Spire', '2019', 'Megacrit', 'Humble Bundle', 'Card Game / Roguelike', 9, 1, 1, 'https://localhost:5001/game_images/Slay The Spire.jfif', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('b7e2938e-2a2d-4e78-a53d-be961daebbd8', 'Final Fantasy 2 Pixel Remaster', '2021', 'Square Enix', 'Square Enix', 'JRPG', 3, 1, 5, 'https://localhost:5001/game_images/Final Fantasy 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('b85aed12-fed0-4a28-88cd-76b9614e591d', 'Metroid Dread', '2021', 'Mercury Steam', 'Nintendo', '2D Platform Shooter / Metroidvania', 8, 11, 1, 'https://localhost:5001/game_images/Metroid Dread.jfif', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('b8aec9d6-ebe4-4235-8600-f45df920f6aa', 'Kingdom Hearts 358-2 Days', '2009', 'Square Enix', 'Square Enix', 'Action JRPG', 7, 8, 1, 'https://localhost:5001/game_images/Kingdom Hearts 358-2 Days.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('b8d338c7-099d-4e0c-8e4c-d4faa85cc11d', 'Final Fantasy VII Remake', '2020', 'Square Enix', 'Square Enix', 'Action JRPG', 6, 1, 3, 'https://localhost:5001/game_images/Final Fantasy VII Remake.jfif', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('b93d8f4c-4bf1-49c0-b0df-90ec290a091f', 'Rage', '2011', 'id Software', 'Bethesda', '1st Person Shooter', 6, 1, 1, 'https://localhost:5001/game_images/Rage.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('ba6fd473-729e-4225-9e30-60d0a6259592', 'X-Blades', '2007', 'TopWare, Gaijin Entertaiment', 'SouthPeak Games', 'Hack\'n Slash', 5, 1, 5, 'https://localhost:5001/game_images/X-Blades.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('bd359dee-282f-42de-8aa7-7eac28515f0c', 'Metal Slug 3', '2000', 'SNK', 'SNK', 'Side Scrolling Shooter', 8, 2, 1, 'https://localhost:5001/game_images/Metal Slug 3.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('c039fefe-b656-430a-93ee-20da34d422bb', 'Tony Hawk Pro Skater 2', '2000', 'Neversoft', 'Activision', 'Skate', 7, 2, 2, 'https://localhost:5001/game_images/Tony Hawk Pro Skater 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('c1f01545-181d-4535-b37d-bb28b0c202ea', 'Nioh', '2017', 'Team Ninja', 'Koei Tecmo', 'Action RPG / Soulslike', 10, 1, 1, 'https://localhost:5001/game_images/Nioh.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('c20f9687-326f-4084-ac6d-bd264d7525a9', 'Night in the Woods', '2017', 'Infinite Fall, Secret Labs', 'Finji', 'Interactive 2D Novel', 8, 1, 1, 'https://localhost:5001/game_images/Night in the Woods.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('c2f31855-7a8e-427d-8015-8417659bc6b5', 'Assassin\'s Creed Origins', '2017', 'Ubisoft', 'Ubisoft', 'Open World Action Adventure', 8, 1, 5, 'https://localhost:5001/game_images/Assassin\'s Creed Origins.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('c3de7e84-dddd-4c27-91e6-86d7fe947e14', 'Saints Row 4', '2013', 'Volition', 'Deep Silver', 'Open World Action', 9, 1, 1, 'https://localhost:5001/game_images/Saints Row 4.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('c3fe7fba-c0dc-4d7a-87d4-7c0d4728bc53', 'FIFA 08', '2007', 'EA Sports', 'Electronic Arts', 'Football', 8, 1, 1, 'https://localhost:5001/game_images/FIFA 08.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('c4e45e83-f846-4da8-9799-7fa57067a38d', 'Dungeon Encounters', '2021', 'Square Enix', 'Square Enix', 'Dungeon Crawler', 3, 1, 5, 'https://localhost:5001/game_images/Dungeon Encounters.jfif', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('c74b0737-2485-444f-8913-2910b5f2d206', 'Sleeping Dogs', '2012', 'United Front Games', 'Square Enix', '3D Beat\'em Up', 7, 1, 1, 'https://localhost:5001/game_images/Sleeping Dogs.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('c93347d4-7c9d-4e2d-a260-ef369c422052', 'Bloodstained Ritual of the Night', '2019', 'ArtPlay', '505 Games', 'Metroidvania', 7, 1, 1, 'https://localhost:5001/game_images/Bloodstained Ritual of the Night.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('ca45dfc9-41e1-4290-a18e-4509141348af', 'Not Tonight', '2018', 'PanicBarn', 'No More Robots', '2018', 6, 1, 5, 'https://localhost:5001/game_images/Not Tonight.jfif', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('cc07bb33-7333-438c-b361-89b2471ab018', 'Portal Knights', '2016', 'Keen Games', '505 Games', 'Sandbox Adventure', 6, 1, 5, 'https://localhost:5001/game_images/Portal Knights.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('cd06eb86-e51b-4119-920c-b1527e7486f9', 'League of Legends', '2009', 'Riot Games', 'Riot Games', 'MOBA', 8, 1, 2, 'https://localhost:5001/game_images/League of Legends.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('cdeb5e59-2178-4676-99e3-3136f72a7143', 'Euro Truck Simulator 2', '2012', 'SCS Software', 'SCS Software', 'Driving Simulation', 9, 1, 2, 'https://localhost:5001/game_images/Euro Truck Simulator 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('ce1e976e-3c67-4d31-80e0-9ba1c5e0c223', 'Scarlet Nexus', '2021', 'Bandai Namco', 'Bandai Namco', 'Action JRPG', 10, 1, 1, 'https://localhost:5001/game_images/Scarlet Nexus.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('ce6276f9-faec-49ab-916b-bb1c74039210', 'Mario Kart DS', '2005', 'Nintendo', 'Nintendo', 'Racing', 5, 8, 2, 'https://localhost:5001/game_images/Mario Kart DS.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('cebc85fd-1b39-45a3-a77a-b10a9ceb6572', 'Ori and the Blind Forest', '2015', 'Moon Studios', 'Microsoft', 'Platform Adventure', 9, 1, 1, 'https://localhost:5001/game_images/Ori and the Blind Forest.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('cf8bdf1c-8f47-4741-bfae-d784620d822a', 'Divinity Original Sin', '2014', 'Larian Studios', 'Larian Studios', 'Tabletop RPG', 10, 1, 1, 'https://localhost:5001/game_images/Divinity Original Sin.jfif', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('d0062c9f-6b90-4a59-9025-3d9894c64a91', 'Tales of Zestiria', '2015', 'Bandai Namco', 'Bandai Namco', 'Action JRPG', 7, 1, 1, 'https://localhost:5001/game_images/Tales of Zestiria.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('d09d94f0-b7a7-4d5b-8183-92a3326d1096', 'Tomb Rider (2013)', '2013', 'Crystal Dynamics, Eidos Montreal', 'Square Enix', 'Action Adventure', 7, 1, 1, 'https://localhost:5001/game_images/Tomb Rider (2013).jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('d0fb782d-cca9-435b-8470-559ba137e58c', 'Bayonetta', '2009', 'Platinum Games', 'SEGA', 'Hack\'n Slash', 10, 1, 1, 'https://localhost:5001/game_images/Bayonetta.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('d5104313-8195-4aed-b26b-51518beb2ad8', 'Dead or Alive 5 Last Round', '2012', 'Team Ninja', 'Koei Tecmo', 'Fighting', 6, 1, 2, 'https://localhost:5001/game_images/Dead or Alive 5 Last Round.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('d6b14996-79df-415e-ada2-e8704da92364', 'Ninj Gaiden Sigma 2', '2009', 'Team Ninja', 'Koei Tecmo', 'Hack\'n Slash', 7, 1, 1, 'https://localhost:5001/game_images/Ninja Gaiden Sigma 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('d7facd1c-e866-43ad-8748-ec1716bfb75d', 'FIFA 18', '2017', 'EA Sports', 'Electronic Arts', 'Sports / Football', 7, 1, 2, 'https://localhost:5001/game_images/FIFA 18.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('dae95bc2-3caa-43c5-91db-a9344595df5e', 'Rocket League', '2015', 'Psyonix', 'Psyonix', 'Sports/Vehicle Football', 10, 1, 2, 'https://localhost:5001/game_images/Rocket League.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('db39e8b8-c4f7-48cf-935a-6dd5965564db', 'Mass Effect Legendary Edition', '2021', 'Bioware', 'Electronic Arts', '3rd Person Shooter RPG', 10, 1, 4, 'https://localhost:5001/game_images/Mass Effect Legendary Edition.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('df148196-2fe5-46e5-b3d4-f6eb03308b9d', 'Bleach Dark Souls', '2007', 'Treasure Co. Ltd', 'SEGA, Viz Media', 'Fighting', 7, 8, 1, 'https://localhost:5001/game_images/Bleach Dark Souls.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('e0a39d4a-c453-4e04-9504-f86d092399ca', 'Pokémon Shield', '2019', 'Gamefreak', 'Nintendo', 'JRPG', 4, 11, 1, 'https://localhost:5001/game_images/Pokémon Shield.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('e22e665d-d75e-4be6-b7e0-2455f2ce1b1d', 'Divinity Original Sin 2', '2017', 'Larian Studios', 'Larian Studios', 'Tabletop RPG', 10, 1, 1, 'https://localhost:5001/game_images/Divinity Original Sin 2.jfif', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('e67970b9-4e9d-40e9-b31d-d3b63a09981f', 'The Legend of Zelda Ocarina of Time 3D', '2011', 'Nintendo', 'Nintendo', 'Action Adventure', 9, 9, 1, 'https://localhost:5001/game_images/The Legend of Zelda Ocarina of Time 3D.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('e809665d-b3c9-46f8-8ef5-66ad8cc6b43c', 'Gran Turismo', '1998', 'Polyphony Digital', 'Sony', 'Racing', 9, 2, 1, 'https://localhost:5001/game_images/Gran Turismo.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('e8465d5d-4cc7-4343-95a3-9d6675a0eb37', 'Tekken 7', '2017', 'Bandai Namco', 'Bandai Namco', 'Fighting', 6, 1, 2, 'https://localhost:5001/game_images/Tekken 7.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('e875cfe9-b5db-4738-9cc6-29e128579222', 'Assasin\'s Creed Altair Chronicles', '2008', 'Gameloft', 'Ubisoft, Gameloft', 'Side Scrolling Action Adventure', 7, 8, 1, 'https://localhost:5001/game_images/Assasin\'s Creed Altair Chronicles.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('e8ab5ecd-14e2-4e42-a58a-9c649923fd92', 'Shin Megami Tensei Devil Survivor Overclocked', '2011', 'ATLUS', 'ATLUS', 'Tactical JRPG', 10, 9, 1, 'https://localhost:5001/game_images/Shin Megami Tensei Devil Survivor Overclocked.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('eb5567d3-2071-46bd-a1ee-7dedfe0862f1', 'Toy Story Racer', '2001', 'Traveler\'s Tales', 'Disney Interactive, Activision', 'Racing', 6, 2, 2, 'https://localhost:5001/game_images/Toy Story Racer.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('eb594614-4cfc-4944-b9e2-2feaf599bbda', 'Duck Game', '2016', 'Landon Podbielski', 'Adult Swim Games', '2D Platform Shooter', 10, 1, 2, 'https://localhost:5001/game_images/Duck Game.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('ef217178-0829-4e07-9fb8-4065656ade12', 'Trials of Mana', '2020', 'Xeen', 'Square Enix', 'Action JRPG', 5, 1, 5, 'https://localhost:5001/game_images/Trials of Mana.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('ef406171-7720-451c-93b0-ab4cb9f02c9f', 'Bastion', '2010', 'Supergiant Games', 'Warner Bros Interactive', 'Action Adventure isometric', 8, 1, 1, 'https://localhost:5001/game_images/Bastion.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('f23c1537-c00e-4e4b-8dca-2f270e397631', 'Unreal Tournament', '1999', 'Epic Games', 'Epic Games', '1st Person Shooter', 9, 1, 2, 'https://localhost:5001/game_images/Unreal Tournament.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('f2c57145-d2ae-4515-b98a-ff2bcdbf70fd', 'Naruto Shippuden Ultimate Ninja Storm 2', '2010', 'CyberConect 2', 'Bandai Namco', 'Arena Fighter', 6, 1, 5, 'https://localhost:5001/game_images/Naruto Shippuden Ultimate Ninja Storm 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('f310cf1c-0464-4307-9fa4-18370796c20e', 'Wizard of Legend', '2018', 'Contigent99', 'Humble Bundle', 'Rogue-Like', 9, 1, 2, 'https://localhost:5001/game_images/Wizard of Legend.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('f393aded-90cf-4448-970b-3724499e9b61', 'Steam World Dig 2', '2017', 'Image & Form', 'Koch Media', '2D Sandbox Adventure', 9, 1, 1, 'https://localhost:5001/game_images/Steam World Dig 2.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('f429db97-786a-4a07-b1b8-90519a7d33cb', 'Granblue Fantasy Versus', '2020', 'Arc System Works', 'XSEED Games, Marvelous, CyGames', 'Fighting', 7, 1, 2, 'https://localhost:5001/game_images/Granblue Fantasy Versus.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('f5566305-6854-499d-94ca-b6005e4c88da', 'Dark Souls', '2010', 'From Software', 'Bandai Namco', 'Action RPG / Souls', 8, 1, 5, 'https://localhost:5001/game_images/Dark Souls.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('f587e256-58bb-42af-a582-95db70a8382d', 'Atelier Ryza Ever Darkness & The Secret Hideout', '2019', 'Gust Co. Ltd.', 'Koei Tecmo', 'JRPG', 7, 1, 5, 'https://localhost:5001/game_images/Atelier Ryza Ever Darkness & The Secret Hideout.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('f645fbdf-81b1-494c-827e-7b9369591ab7', 'Tales of Arise', '2021', 'Bandai Namco', 'Bandai Namco', 'Action JRPG', 10, 1, 6, 'https://localhost:5001/game_images/Tales of Arise.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('f7bd6f01-7f5b-459c-8be4-a016d6165986', 'Driver', '1999', 'Ubisoft Reflections', 'Ubisoft, Gameloft, Atari', 'Open World Driving', 5, 2, 2, 'https://localhost:5001/game_images/Driver.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('f9fa494f-2c36-4d72-9dc4-d6a720023748', 'Dragon Age Inquisition', '2014', 'Bioware', 'Electronic Arts', 'Action RPG', 6, 1, 1, 'https://localhost:5001/game_images/Dragon Age Inquisition.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('fde62fca-6d9d-4145-bfed-16d95f38bb4b', 'Haven', '2020', 'The Game Bakers', 'The Game Bakers', 'Action Adventure', 8, 1, 4, 'https://localhost:5001/game_images/Haven_Poster01_Haven_1920.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('fe08d3aa-ccc6-4eba-8435-070bc78c2735', 'Code Vein', '2019', 'Bandai Namco', 'Bandai Namco', 'Action RPG / Soulslike', 7, 1, 5, 'https://localhost:5001/game_images/Code Vein.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('ff1e4c6c-5e13-4c96-957f-838b972935ea', 'Fire Emblem Three Houses', '2019', 'Intelligent Systems', 'Nintendo', 'Tactical JRPG', 5, 11, 1, 'https://localhost:5001/game_images/Fire Emblem Three Houses.jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');
INSERT INTO `playedgame` VALUES ('fffdb5e7-1af6-4c8f-85fe-66f510250f6a', 'Nier Replicant ver 1.22474487139...', '2021', 'Toylogic', 'Square Enix', 'Action JRPG', 10, 1, 1, 'https://localhost:5001/game_images/Nier Replicant ver 1.22474487139....jpg', 'c26726c4-ecb2-45e2-83a9-ef96bd4473c4');

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES (1, 'Completed');
INSERT INTO `status` VALUES (2, 'Played');
INSERT INTO `status` VALUES (3, 'Playing');
INSERT INTO `status` VALUES (4, 'On Hold');
INSERT INTO `status` VALUES (5, 'Dropped');
INSERT INTO `status` VALUES (6, 'Replaying');

-- ----------------------------
-- Table structure for top10characters
-- ----------------------------
DROP TABLE IF EXISTS `top10characters`;
CREATE TABLE `top10characters`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `characterid` int NOT NULL,
  `pos` int NOT NULL,
  `top10nameid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `characterid`(`characterid`) USING BTREE,
  INDEX `top10nameid`(`top10nameid`) USING BTREE,
  CONSTRAINT `top10characters_ibfk_1` FOREIGN KEY (`characterid`) REFERENCES `character` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `top10characters_ibfk_2` FOREIGN KEY (`top10nameid`) REFERENCES `top10name` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of top10characters
-- ----------------------------
INSERT INTO `top10characters` VALUES (1, 1, 1, 1);
INSERT INTO `top10characters` VALUES (2, 2, 2, 1);
INSERT INTO `top10characters` VALUES (3, 3, 3, 1);
INSERT INTO `top10characters` VALUES (4, 4, 5, 1);
INSERT INTO `top10characters` VALUES (6, 6, 4, 1);
INSERT INTO `top10characters` VALUES (7, 7, 8, 1);
INSERT INTO `top10characters` VALUES (8, 8, 7, 1);
INSERT INTO `top10characters` VALUES (9, 9, 9, 1);
INSERT INTO `top10characters` VALUES (10, 10, 10, 1);
INSERT INTO `top10characters` VALUES (12, 12, 6, 1);

-- ----------------------------
-- Table structure for top10games
-- ----------------------------
DROP TABLE IF EXISTS `top10games`;
CREATE TABLE `top10games`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `gameid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pos` int NOT NULL,
  `top10nameid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_top10games_playedgame_game_fk`(`gameid`) USING BTREE,
  INDEX `top10_name`(`top10nameid`) USING BTREE,
  CONSTRAINT `top10_game` FOREIGN KEY (`gameid`) REFERENCES `playedgame` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `top10_name` FOREIGN KEY (`top10nameid`) REFERENCES `top10name` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of top10games
-- ----------------------------
INSERT INTO `top10games` VALUES (1, '1649133e-d70c-4156-aeac-21da070633b4', 1, 1);
INSERT INTO `top10games` VALUES (3, '285132a4-375d-4978-a68c-b7e72c0b6e4b', 2, 1);
INSERT INTO `top10games` VALUES (5, '23ffb351-4ae1-461d-8d6e-1a652762ec05', 2, 1);
INSERT INTO `top10games` VALUES (6, 'e8ab5ecd-14e2-4e42-a58a-9c649923fd92', 3, 1);
INSERT INTO `top10games` VALUES (7, '8888f455-083e-4643-b4df-ccfa1968f021', 3, 1);
INSERT INTO `top10games` VALUES (9, '97f3de86-4cbe-4061-adab-156af2bd2b81', 5, 1);
INSERT INTO `top10games` VALUES (10, 'a8a747fd-c5c3-49d4-ba65-6cea329b977d', 6, 1);
INSERT INTO `top10games` VALUES (11, '92d66d1f-1237-41b4-8dc6-25a581e4d14f', 6, 1);
INSERT INTO `top10games` VALUES (12, '4a2a3240-4f87-4835-bfd6-2096978abbb2', 7, 1);
INSERT INTO `top10games` VALUES (13, '66de123b-2a1b-4b99-b78e-0b95a109dd9b', 8, 1);
INSERT INTO `top10games` VALUES (14, 'abc636e2-be01-43c4-9fe2-bc59ea0ca3ab', 10, 1);
INSERT INTO `top10games` VALUES (15, 'fffdb5e7-1af6-4c8f-85fe-66f510250f6a', 1, 1);
INSERT INTO `top10games` VALUES (19, '7d45769b-393d-4a09-9870-76f83ef94669', 1, 1);
INSERT INTO `top10games` VALUES (23, '50a01c39-5efb-41fc-9101-d8b2fc166e7d', 4, 1);
INSERT INTO `top10games` VALUES (36, 'f645fbdf-81b1-494c-827e-7b9369591ab7', 9, 1);
INSERT INTO `top10games` VALUES (44, 'db39e8b8-c4f7-48cf-935a-6dd5965564db', 2, 1);
INSERT INTO `top10games` VALUES (47, '71224041-c215-42f4-861d-c3fcf80960ff', 2, 1);

-- ----------------------------
-- Table structure for top10name
-- ----------------------------
DROP TABLE IF EXISTS `top10name`;
CREATE TABLE `top10name`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of top10name
-- ----------------------------
INSERT INTO `top10name` VALUES (1, 'All Time');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `disabled` tinyint(1) NULL DEFAULT 0,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`userid`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('c26726c4-ecb2-45e2-83a9-ef96bd4473c4', 'DRGWeiss', '2B0108KmF', 0, 'drgweiss');

SET FOREIGN_KEY_CHECKS = 1;
