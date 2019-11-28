CREATE TABLE `Floor` (
	`number` int NOT NULL UNIQUE,
	`genre` varchar(50) UNIQUE,
	`maintainer` varchar(50) NOT NULL UNIQUE,
	`forbidden` BOOLEAN NOT NULL DEFAULT 'FALSE',
	PRIMARY KEY (`number`)
);

CREATE TABLE `Alcove` (
	`name` varchar(255) NOT NULL UNIQUE,
	`floor` int NOT NULL,
	`Feature` varchar(255) NOT NULL,
	`information` varchar(255) NOT NULL,
	PRIMARY KEY (`name`)
);

CREATE TABLE `Feature` (
	`name` varchar(255) NOT NULL UNIQUE,
	`designer` varchar(50),
	`age` int,
	PRIMARY KEY (`name`)
);

CREATE TABLE `Book` (
	`title` varchar(255) NOT NULL UNIQUE,
	`floor` int NOT NULL,
	`category` varchar(16) NOT NULL,
	`inAlcove` varchar(255) DEFAULT 'NULL',
	PRIMARY KEY (`title`)
);

CREATE TABLE `Worker` (
	`id` int NOT NULL UNIQUE,
	`name` varchar(50) NOT NULL,
	`role` varchar(16),
	`inLibrary` BOOLEAN NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Visitor` (
	`id` int NOT NULL UNIQUE,
	`name` varchar(50) NOT NULL,
	`floor` int NOT NULL,
	`book` varchar(255),
	`offering` varchar(255) NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Floor` ADD FOREIGN KEY (`maintainer`) REFERENCES `Worker`(`id`);

ALTER TABLE `Alcove` ADD FOREIGN KEY (`floor`) REFERENCES `Floor`(`number`);

ALTER TABLE `Alcove` ADD FOREIGN KEY (`Feature`) REFERENCES `Feature`(`name`);

ALTER TABLE `Book` ADD FOREIGN KEY (`floor`) REFERENCES `Floor`(`number`);

ALTER TABLE `Book` ADD FOREIGN KEY (`inAlcove`) REFERENCES `Alcove`(`name`);

ALTER TABLE `Visitor` ADD FOREIGN KEY (`floor`) REFERENCES `Floor`(`number`);

ALTER TABLE `Visitor` ADD FOREIGN KEY (`book`) REFERENCES `Book`(`title`);

ALTER TABLE `Visitor` ADD FOREIGN KEY (`offering`) REFERENCES `Book`(`title`);

INSERT INTO Worker VALUES(1,`Wan Shi Tong`, `owner`, TRUE);
INSERT INTO Worker VALUES(2,`Alex`, `gatherer`, FALSE);
INSERT INTO Worker VALUES(3,`Samantha`, `maintainer`, TRUE);
INSERT INTO Worker VALUES(4,`Peter`, `gatherer`, TRUE);
INSERT INTO Worker VALUES(5,`Gary`, `maintainer`, TRUE);
INSERT INTO Worker VALUES(6,`Andrew`, `maintainer`, TRUE);
INSERT INTO Worker VALUES(7,`Joshua`, `gatherer`, FALSE);
INSERT INTO Worker VALUES(8,`Joey`, `maintainer`, TRUE);
INSERT INTO Worker VALUES(9,`Georgia`, `maintainer`, TRUE);

INSERT INTO Floor VALUES(1, `Ancient History of the Earth Kingdom`, `Gary`, FALSE);
INSERT INTO Floor VALUES(2, `Tribe of the North Pole`, `Andrew`, TRUE);
INSERT INTO Floor VALUES(3, `Southern Temples and Antiquities`, `Georgia`, FALSE);
INSERT INTO Floor VALUES(4, `Stories from the 2nd Century`, `Joey`, FALSE);
INSERT INTO Floor VALUES(5, `Legends of the Western Swamps`, `Samantha`, FALSE);

INSERT INTO Feature VALUES(`A Natural Phenomenon`, NULL, 131);
INSERT INTO Feature VALUES(`The First Tools`, NULL, NULL);
INSERT INTO Feature VALUES(`Ba Sing Se: A City Divided`, `Marcus Zhang`, 14);
INSERT INTO Feature VALUES(`Monk Statue #17`, NULL, 268);
INSERT INTO Feature VALUES(`The Spirit Escapes`, `Julian Haru`, 1);

INSERT INTO Alcove VALUES(`The Aurora Room`, 2, `A Natural Phenomenon`, `About the Northern Lights`);
INSERT INTO Alcove VALUES(`The Clay Tool Room`, 1, `The First Tools`, `On the oldest tools of the Earth Kingdom`);
INSERT INTO Alcove VALUES(`The Great Divide Room`, 1, `Ba Sing Se: A City Divided`, `On the Architecture of the Ba Sing Se Wall`);
INSERT INTO Alcove VALUES(`The Room of Southern Monks`, 3, `Monk Statue #17`, `The life of Southern Temple monks`);
INSERT INTO Alcove VALUES(`The Room of the Swamp Monster`, 5, NULL, `Is the swamp monster fact or fiction?`);
INSERT INTO Alcove VALUES(`The Room of the The Blue Spirit`, 4, `The Spirit Escapes`, `On the stories of the Blue Spirit`);

INSERT INTO Book VALUES(`Tales of the Full Moon`,2,`fiction`,NULL);
INSERT INTO Book VALUES(`People of the Vines`,5,`myth`,`The Room of the Swamp Monster`);
INSERT INTO Book VALUES(`Architect of the Wall`,1,`non-fiction`,`The Great Divide Room`);
INSERT INTO Book VALUES(`The Impact of the Caste System on the Ba Sing Se Economy`,1,`non-fiction`, NULL);
INSERT INTO Book VALUES(`Mating Behaviour of Sky Bisons in the Southern Temples`,3,`non-fiction`,NULL);
INSERT INTO Book VALUES(`The Use of High-Altitude Winds to create Music`,3,`non-fiction`,NULL);
INSERT INTO Book VALUES(`The Life of Monk Kiatsu: A Biography`,3,`non-fiction`,`The Room of Southern Monks`);

INSERT INTO Visitor VALUES(1, `Leo`, 1, NULL,`Mating Behaviour of Sky Bisons in the Southern Temples`);
INSERT INTO Visitor VALUES(2, `Ryan`, 3, NULL,`People of the Vines`);
INSERT INTO Visitor VALUES(3, `Luke`, 3, `Mating Behaviour of Sky Bisons in the Southern Temples`,`Architect of the Wall`);
INSERT INTO Visitor VALUES(4, `Sarah`, 4, `Architect of the Wall`,`The Impact of the Caste System on the Ba Sing Se Economy`);
INSERT INTO Visitor VALUES(5, `Liza`, 5, NULL,`The Life of Monk Kiatsu: A Biography`);

