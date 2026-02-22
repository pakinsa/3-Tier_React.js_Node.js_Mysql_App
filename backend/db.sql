-- 1. Create Database and User
CREATE DATABASE IF NOT EXISTS react_node_app;
USE react_node_app;

-- Optional: App user for security
CREATE USER IF NOT EXISTS 'appuser'@'%' IDENTIFIED BY 'learnIT02#';
GRANT ALL PRIVILEGES ON react_node_app.* TO 'appuser'@'%';
FLUSH PRIVILEGES;

-- 2. Create Tables (SINGULAR to match Node.js Developer code)
CREATE TABLE IF NOT EXISTS `author` ( 
  `id` int NOT NULL AUTO_INCREMENT, 
  `name` varchar(255) NOT NULL, 
  `birthday` date NOT NULL, 
  `bio` text NOT NULL, 
  `createdAt` date NOT NULL, 
  `updatedAt` date NOT NULL, 
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci; 

CREATE TABLE IF NOT EXISTS `book` ( 
  `id` int NOT NULL AUTO_INCREMENT, 
  `title` varchar(255) NOT NULL, 
  `releaseDate` date NOT NULL, 
  `description` text NOT NULL, 
  `pages` int NOT NULL, 
  `createdAt` date NOT NULL, 
  `updatedAt` date NOT NULL, 
  `authorId` int DEFAULT NULL, 
  PRIMARY KEY (`id`), 
  KEY `FK_author_id_idx` (`authorId`), 
  CONSTRAINT `FK_author_link` FOREIGN KEY (`authorId`) REFERENCES `author` (`id`) 
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci; 

-- 3. Restore Data (Using SINGULAR table names)
INSERT INTO `author` (id, name, birthday, bio, createdAt, updatedAt) VALUES 
(1,'J.K. Rowling (Joanne Kathleen Rowling)','1965-07-31','J.K. Rowling is a British author...','2024-05-29','2024-05-29'),
(3,'Jane Austen','1775-12-16','Jane Austen was an English novelist...','2024-05-29','2024-05-29'),
(4,'Harper Lee','1960-07-11','Harper Lee was an American novelist...','2024-05-29','2024-05-29'),
(5,'J.R.R. Tolkien','1954-07-29','J.R.R. Tolkien was a British philologist...','2024-05-29','2024-05-29'),
(6,'Mary Shelley','1818-03-03','Mary Shelley was a British novelist...','2024-05-29','2024-05-29'),
(7,'Douglas Adams','1979-10-12','Douglas Adams was an English science fiction writer...','2024-05-29','2024-05-29')
ON DUPLICATE KEY UPDATE name=name; 

INSERT INTO `book` (id, title, releaseDate, description, pages, createdAt, updatedAt, authorId) VALUES 
(1,'Harry Potter and the Sorcerer\'s Stone','1997-07-26','On his birthday, Harry Potter discovers...',223,'2024-05-29','2024-05-29',1),
(3,'Harry Potter and the chamber of secrets','1998-07-02','Harry Potter and the sophomores investigate...',251,'2024-05-29','2024-05-29',1),
(4,'Pride and Prejudice','1813-01-28','An English novel of manners...',224,'2024-05-29','2024-05-29',3),
(5,'Harry Potter and the Prisoner of Azkaban','1999-07-08','Harry\'s third year of studies...',317,'2024-05-29','2024-05-29',1),
(6,'Harry Potter and the Goblet of Fire','2000-07-08','Hogwarts prepares for the Triwizard Tournament...',636,'2024-05-29','2024-05-29',1),
(7,'The Hitchhiker\'s Guide to the Galaxy','1979-10-12','A comic science fiction comedy series...',184,'2024-05-29','2024-05-29',7),
(8,'Frankenstein; or, The Modern Prometheus','1818-03-03','A Gothic novel by Mary Shelley...',211,'2024-05-29','2024-05-29',6),
(9,'The Lord of the Rings: The Fellowship of the Ring','1954-07-29','The first book in J.R.R. Tolkien\'s epic...',482,'2024-05-29','2024-05-29',5)
ON DUPLICATE KEY UPDATE title=title;

