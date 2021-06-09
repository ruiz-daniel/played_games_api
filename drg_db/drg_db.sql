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

 Date: 09/06/2021 08:13:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for __efmigrationshistory
-- ----------------------------
DROP TABLE IF EXISTS `__efmigrationshistory`;
CREATE TABLE `__efmigrationshistory`  (
  `MigrationId` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of __efmigrationshistory
-- ----------------------------
INSERT INTO `__efmigrationshistory` VALUES ('20210525230936_InitialDb', '5.0.5');

-- ----------------------------
-- Table structure for platform
-- ----------------------------
DROP TABLE IF EXISTS `platform`;
CREATE TABLE `platform`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IX_playedgame_platformid`(`platformid`) USING BTREE,
  INDEX `IX_playedgame_statusid`(`statusid`) USING BTREE,
  CONSTRAINT `FK_playedgame_platform_platformid` FOREIGN KEY (`platformid`) REFERENCES `platform` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_playedgame_status_statusid` FOREIGN KEY (`statusid`) REFERENCES `status` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of playedgame
-- ----------------------------
INSERT INTO `playedgame` VALUES ('0406bb3e-3685-4a36-bccd-9c5b7bd5bfe3', 'Bleach 3rd Phantom', '2008', 'SEGA, Torn Create', 'SEGA', 'Tactical RPG', 8, 8, 1);
INSERT INTO `playedgame` VALUES ('085cfd42-28cb-488b-8b46-d8b3757154b4', 'The King of Fighters 98', '1998', 'SNK', 'SNK', 'Fighting', 8, 2, 2);
INSERT INTO `playedgame` VALUES ('08cb1b15-2ddd-4a43-b023-8d38b76a5797', 'Kirby Mass Attack', '2011', 'HAL Laboratory', 'Nintendo', 'Platform Action Adventure', 9, 8, 1);
INSERT INTO `playedgame` VALUES ('0b071dd8-deda-415b-950b-aaa407856701', 'Nascar Heat', '2000', 'Monster Games', 'Hasbro Interactive', 'Racing', 4, 2, 2);
INSERT INTO `playedgame` VALUES ('0d125528-db10-4f2d-a819-85be6aa19e7e', 'Star Wars The Force Unleashed 2', '2010', 'Aspyr Media', 'Lucas Art', 'Hack\'n Slash', 6, 1, 5);
INSERT INTO `playedgame` VALUES ('1009f5f0-0e12-45b7-ba68-19ced577bd3c', 'Trauma Center Under The Knife 2', '2008', 'ATLUS', 'ATLUS', 'Puzzle', 9, 8, 5);
INSERT INTO `playedgame` VALUES ('1649133e-d70c-4156-aeac-21da070633b4', 'Nier Automata', '2017', 'Platinum Games', 'Square Enix', 'ARPG', 10, 1, 1);
INSERT INTO `playedgame` VALUES ('1afcad55-427d-4323-a81c-2cf5335a2e7a', 'Driver 2', '2000', 'Ubisoft Reflections', 'Infogrames', 'Open World Driving', 6, 2, 2);
INSERT INTO `playedgame` VALUES ('22a706be-5557-48a6-bd75-2b151a47ca78', 'Blur', '2010', 'Bizarre Creation', 'Activision', 'Racing', 6, 1, 2);
INSERT INTO `playedgame` VALUES ('23ffb351-4ae1-461d-8d6e-1a652762ec05', 'Mass Effect', '2007', 'Bioware', 'Electronic Arts', '3rd Person Shooter RPG', 9, 1, 1);
INSERT INTO `playedgame` VALUES ('254f3c33-aa28-4294-904f-e10d84882d85', 'Digimon World Dusk', '2007', 'Bandai', 'Bandai', 'JRPG', 7, 8, 1);
INSERT INTO `playedgame` VALUES ('257f011f-b597-4d65-bc38-995aebe255d9', 'YuGiOh 5DS World Championship 2009', '2009', 'Konami', 'Konami', 'Cards', 9, 8, 1);
INSERT INTO `playedgame` VALUES ('27826b7a-d126-43d1-8712-c9d6721051a2', 'Sacred', '2004', 'Ascaron', 'Take Two, Deep Silver', 'ARPG isometric', 7, 1, 1);
INSERT INTO `playedgame` VALUES ('285132a4-375d-4978-a68c-b7e72c0b6e4b', 'Mass Effect 3', '2012', 'Bioware', 'Electronic Arts', '3rd Person Shooter RPG', 10, 1, 1);
INSERT INTO `playedgame` VALUES ('28b8dc74-1607-42f3-a79f-ff50b1d96b1b', 'Final Fantasy 3', '1992', 'Square Enix', 'Square Enix', 'JRPG', 6, 12, 5);
INSERT INTO `playedgame` VALUES ('2ed85464-ddbe-40f2-b3a7-c3232fc853c0', 'X-Men Mutant Academy 2', '2001', 'Midway Studios', 'Sony, Activision', 'Fighting', 8, 2, 2);
INSERT INTO `playedgame` VALUES ('356ac0f1-6859-4a00-a62a-9ca87530e3af', 'Bully', '2006', 'Rockstar Vancouver', 'Rockstar Games', 'Open World Action', 5, 1, 5);
INSERT INTO `playedgame` VALUES ('3db0e11d-4b3a-4d99-ae2e-d690792ad70e', 'Naruto Ultimate Ninja Storm', '2008', 'CyberConect 2', 'Bandai Namco', 'Arena Fighter', 5, 1, 5);
INSERT INTO `playedgame` VALUES ('3ea3976e-46b9-41e4-b680-af47d682533c', 'Twisted Metal 2', '1996', 'SingleTrac', 'Sony', 'Vehicle Combat', 7, 2, 2);
INSERT INTO `playedgame` VALUES ('4061c455-bbc3-41e3-9d81-db0293989216', 'Super Smash Bros Brawl', '2008', 'Sora Ltd, Nintendo', 'Nintendo', 'Platform Fighter', 4, 13, 2);
INSERT INTO `playedgame` VALUES ('43020cc7-61cd-43d1-b3d3-c8d6b1cfc39e', 'Spiderman 2 Enter Electro', '2001', 'Vicarious Visions', 'Activision', 'Action Adventure', 7, 2, 5);
INSERT INTO `playedgame` VALUES ('4421e818-7a2b-41a1-bf9a-6fa1854d2aed', 'Pokémon Ranger Shadows of Almia', '2008', 'HAL Laboratory', 'Nintendo', 'Adventure RPG', 7, 8, 5);
INSERT INTO `playedgame` VALUES ('5035439a-9a7d-4705-b21b-6400426f89cb', 'Minecraft', '2009', 'Mojang', 'Microsoft', 'Sandbox', 8, 1, 2);
INSERT INTO `playedgame` VALUES ('55db66ab-f7cd-4e35-8433-b6e7b4b45928', 'Age of Empires II', '1999', 'Esemble Studios, Skybox Labs', 'Microsoft', 'Real Time Strategy', 9, 1, 2);
INSERT INTO `playedgame` VALUES ('56433617-9b22-4ae6-a3b5-ca3c52902010', 'Need For Speed Most Wanted', '2005', 'EA Black Box', 'Electronic Arts', 'Racing', 7, 1, 5);
INSERT INTO `playedgame` VALUES ('57f25d10-aeb3-4da4-ad26-4de17119f739', 'Pro Evolution Soccer 2002', '2002', 'Konami', 'Konami', 'Football', 9, 2, 1);
INSERT INTO `playedgame` VALUES ('59194e25-9536-4215-b728-d2327101f14a', 'Final Fantasy VII', '1997', 'Square Enix', 'Square Enix', 'JRPG', 5, 1, 5);
INSERT INTO `playedgame` VALUES ('64bb12c1-06eb-4c35-a51b-87e5c3325fb5', 'Guitar Hero III Legends of Rock', '2007', 'Aspyr Media', 'Activision, RedOctane', 'Rhythm', 9, 1, 1);
INSERT INTO `playedgame` VALUES ('653068ab-bf07-4537-9f7e-295345d301cc', 'YuGiOh GX Spirit Caller', '2007', 'Konami', 'Konami', 'Cards', 9, 8, 1);
INSERT INTO `playedgame` VALUES ('66de123b-2a1b-4b99-b78e-0b95a109dd9b', 'Grand Theft Auto San Andreas', '2004', 'Rockstar North', 'Rockstar Games', 'Open World 3rd Person Shooter', 10, 1, 1);
INSERT INTO `playedgame` VALUES ('6d39bf73-103e-4418-b4d3-337619c78504', 'Dragon Age Origins', '2009', 'Bioware', 'Electronic Arts', 'Action RPG', 6, 1, 5);
INSERT INTO `playedgame` VALUES ('71224041-c215-42f4-861d-c3fcf80960ff', 'Mass Effect 2', '2010', 'Bioware', 'Electronic Arts', '3rd Person Shooter RPG', 10, 1, 1);
INSERT INTO `playedgame` VALUES ('73c417df-869b-42e0-be66-3f9bd3d662bf', 'Tekken 3', '1997', 'Namco', 'Namco', 'Fighting', 9, 2, 2);
INSERT INTO `playedgame` VALUES ('7d45769b-393d-4a09-9870-76f83ef94669', 'Nier', '2010', 'Cavia', 'Square Enix', 'ARPG', 9, 4, 1);
INSERT INTO `playedgame` VALUES ('82bcb704-767e-4a1e-b19d-9d1af2504d47', 'Pokémon Sapphire', '2002', 'Gamefreak', 'Nintendo', 'JRPG', 8, 7, 1);
INSERT INTO `playedgame` VALUES ('854ac049-482e-4e29-bcb6-4bdbf34203b3', 'The Witcher 2 Assassins of Kings', '2011', 'CD Projekt Red', 'CD Projekt', 'Action RPG', 9, 1, 1);
INSERT INTO `playedgame` VALUES ('8553db29-0b84-4172-ba4d-fb00ed5b6f6b', 'Crash Team Racing', '1999', 'Naughty Dog', 'Sony', 'Racing', 7, 2, 2);
INSERT INTO `playedgame` VALUES ('8888f455-083e-4643-b4df-ccfa1968f021', 'Shin Megami Tensei Devil Survivor', '2009', 'ATLUS, Career Soft', 'ATLUS, Nintendo', 'Tactical RPG', 9, 8, 1);
INSERT INTO `playedgame` VALUES ('897ea030-772f-445d-8a57-3bd30c7ef01b', 'Digimon Rumble Arena', '2001', 'Bandai, Hudson Soft', 'Bandai, Hudson Soft', 'Platform Fighter', 9, 2, 1);
INSERT INTO `playedgame` VALUES ('8e324497-0ca4-4473-959c-ba3d7a4111e8', 'Quake 3 Arena', '1999', 'id Software', 'Activision', '1st Person Shooter', 8, 1, 2);
INSERT INTO `playedgame` VALUES ('8f714a92-4f02-427a-8fb4-7ed69c8df3f7', 'Metal Slug 2', '1998', 'SNK', 'SNK', 'Side Scrolling Shooter', 8, 2, 1);
INSERT INTO `playedgame` VALUES ('9280d41d-0230-4546-8e00-3e4894423ed6', 'Bleach The Blade of Fate', '2006', 'Treasure Co. Ltd', 'SEGA', 'Fighting', 6, 8, 1);
INSERT INTO `playedgame` VALUES ('93319e3e-6fde-4858-867d-3a176631cb50', 'Bloody Roar 2', '1999', '8ing/Raizing, Hudson Soft', 'Hudson Soft, Sony, Virgin', 'Fighting', 7, 2, 2);
INSERT INTO `playedgame` VALUES ('93cdc5b2-049c-44bc-acaf-8c006103cf34', 'Avatar The Last Airbender Into the Inferno', '2008', 'THQ', 'THQ', 'Action Adventure', 5, 8, 5);
INSERT INTO `playedgame` VALUES ('968516ae-57f8-486c-b24a-8f269400f10f', 'YuGiOh Forbidden Memories', '2002', 'Konami', 'Konami', 'Cards', 6, 2, 1);
INSERT INTO `playedgame` VALUES ('980b0ac5-fbfb-4621-82c8-22b77c8c6958', 'YuGiOh Tag Force', '2006', 'Konami', 'Konami', 'Cards', 7, 12, 1);
INSERT INTO `playedgame` VALUES ('9ae5aa48-bc6f-44c8-9985-24d6a1f175f5', 'Spiderman (2000)', '2000', 'Neversoft', 'Activision', 'Action Adventure', 7, 2, 1);
INSERT INTO `playedgame` VALUES ('9cd68099-2524-4de5-96ba-a281048ef22b', 'Bleach DS 4th Flame Bringer', '2009', 'Dimps', 'SEGA', 'Side Scrolling Action', 5, 8, 5);
INSERT INTO `playedgame` VALUES ('9d10443c-bc2e-4f2d-a7af-3cf47b752f52', 'Pokémon Diamond', '2006', 'Gamefreak', 'Nintendo', 'JRPG', 8, 8, 1);
INSERT INTO `playedgame` VALUES ('9e481a65-e865-43aa-bc61-0a62b6e77577', 'Metal Slug', '1996', 'SNK', 'SNK', 'Side Scrolling Shooter', 8, 2, 1);
INSERT INTO `playedgame` VALUES ('a04d557f-9b08-4dbd-9099-95a53612fbd5', 'Final Fantasy', '1990', 'Square Enix', 'Square Enix', 'JRPG', 6, 7, 5);
INSERT INTO `playedgame` VALUES ('a736232d-b5b0-4743-ab26-d347b766b983', 'Ninja Blade', '2009', 'From Software', 'Microsoft', 'Hack\'n Slash', 7, 1, 5);
INSERT INTO `playedgame` VALUES ('a90e10b7-c243-4a4e-ad74-b82e72ae3caa', 'Devil May Cry 4', '2008', 'CAPCOM', 'CAPCOM', 'Hack\'n Slash', 8, 1, 1);
INSERT INTO `playedgame` VALUES ('abc636e2-be01-43c4-9fe2-bc59ea0ca3ab', 'Portal 2', '2011', 'Valve', 'Valve', '1st Person Puzzle', 10, 1, 1);
INSERT INTO `playedgame` VALUES ('acfc9b88-1719-405f-ab2b-d300d54298e7', 'Limbo', '2010', 'Playdead', 'Microsoft', 'Side Scrolling Adventure Puzzle', 9, 1, 1);
INSERT INTO `playedgame` VALUES ('b2874959-c214-450a-98d9-e65b3ee69791', 'Street Fighter Alpha 3', '1998', 'CAPCOM', 'CAPCOM', 'Fighting', 7, 2, 2);
INSERT INTO `playedgame` VALUES ('b320a115-94c2-43da-ac22-0fd6c712992c', 'Megaman ZX Advent', '2007', 'CAPCOM', 'CAPCOM', 'Side Scrolling Action', 8, 8, 1);
INSERT INTO `playedgame` VALUES ('b4484dd7-ed26-4939-8142-7383c21f0c26', 'Portal', '2007', 'Valve', 'Valve', 'Puzzle', 10, 1, 1);
INSERT INTO `playedgame` VALUES ('b4a8a3a4-848e-4573-b196-bd410fb9d442', 'Harry Potter and the Sorcerer\'s Stone', '2001', 'KnowWonder', 'Electronic Arts', 'Action Adventure', 7, 2, 5);
INSERT INTO `playedgame` VALUES ('b8aec9d6-ebe4-4235-8600-f45df920f6aa', 'Kingdom Hearts 358-2 Days', '2009', 'Square Enix', 'Square Enix', 'Action RPG', 7, 8, 1);
INSERT INTO `playedgame` VALUES ('ba6fd473-729e-4225-9e30-60d0a6259592', 'X-Blades', '2007', 'TopWare, Gaijin Entertaiment', 'SouthPeak Games', 'Hack\'n Slash', 5, 1, 5);
INSERT INTO `playedgame` VALUES ('bd359dee-282f-42de-8aa7-7eac28515f0c', 'Metal Slug 3', '2000', 'SNK', 'SNK', 'Side Scrolling Shooter', 8, 2, 1);
INSERT INTO `playedgame` VALUES ('c039fefe-b656-430a-93ee-20da34d422bb', 'Tony Hawk Pro Skater 2', '2000', 'Neversoft', 'Activision', 'Skate', 7, 2, 2);
INSERT INTO `playedgame` VALUES ('c3fe7fba-c0dc-4d7a-87d4-7c0d4728bc53', 'FIFA 08', '2007', 'EA Sports', 'Electronic Arts', 'Football', 8, 1, 1);
INSERT INTO `playedgame` VALUES ('ce6276f9-faec-49ab-916b-bb1c74039210', 'Mario Kart DS', '2005', 'Nintendo', 'Nintendo', 'Racing', 5, 8, 2);
INSERT INTO `playedgame` VALUES ('d0fb782d-cca9-435b-8470-559ba137e58c', 'Bayonetta', '2009', 'Platinum Games', 'SEGA', 'Hack\'n Slash', 10, 1, 1);
INSERT INTO `playedgame` VALUES ('df148196-2fe5-46e5-b3d4-f6eb03308b9d', 'Bleach Dark Souls', '2007', 'Treasure Co. Ltd', 'SEGA, Viz Media', 'Fighting', 7, 8, 1);
INSERT INTO `playedgame` VALUES ('e809665d-b3c9-46f8-8ef5-66ad8cc6b43c', 'Gran Turismo', '1998', 'Polyphony Digital', 'Sony', 'Racing', 9, 2, 1);
INSERT INTO `playedgame` VALUES ('e875cfe9-b5db-4738-9cc6-29e128579222', 'Assasin\'s Creed Altair Chronicles', '2008', 'Gameloft', 'Ubisoft, Gameloft', 'Side Scrolling Action Adventure', 7, 8, 1);
INSERT INTO `playedgame` VALUES ('eb5567d3-2071-46bd-a1ee-7dedfe0862f1', 'Toy Story Racer', '2001', 'Traveler\'s Tales', 'Disney Interactive, Activision', 'Racing', 6, 2, 2);
INSERT INTO `playedgame` VALUES ('ef406171-7720-451c-93b0-ab4cb9f02c9f', 'Bastion', '2010', 'Supergiant Games', 'Warner Bros Interactive', 'Action Adventure isometric', 8, 1, 1);
INSERT INTO `playedgame` VALUES ('f23c1537-c00e-4e4b-8dca-2f270e397631', 'Unreal Tournament', '1999', 'Epic Games', 'Epic Games', '1st Person Shooter', 9, 1, 2);
INSERT INTO `playedgame` VALUES ('f2c57145-d2ae-4515-b98a-ff2bcdbf70fd', 'Naruto Shippuden Ultimate Ninja Storm 2', '2010', 'CyberConect 2', 'Bandai Namco', 'Arena Fighter', 6, 1, 5);
INSERT INTO `playedgame` VALUES ('f5566305-6854-499d-94ca-b6005e4c88da', 'Dark Souls', '2010', 'From Software', 'Bandai Namco', 'Action RPG', 8, 1, 5);
INSERT INTO `playedgame` VALUES ('f7bd6f01-7f5b-459c-8be4-a016d6165986', 'Driver', '1999', 'Ubisoft Reflections', 'Ubisoft, Gameloft, Atari', 'Open World Driving', 5, 2, 2);
INSERT INTO `playedgame` VALUES ('fcf4b35b-2c32-495c-912d-74f744b3e8ab', 'Final Fantasy 2', '1991', 'Square Enix', 'Square Enix', 'JRPG', 6, 7, 5);

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES (1, 'Completed');
INSERT INTO `status` VALUES (2, 'Played');
INSERT INTO `status` VALUES (3, 'Playing');
INSERT INTO `status` VALUES (4, 'On Hold');
INSERT INTO `status` VALUES (5, 'Dropped');
INSERT INTO `status` VALUES (6, 'Watched');

SET FOREIGN_KEY_CHECKS = 1;
