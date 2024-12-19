-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Dic 19, 2024 alle 22:07
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `huddle`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `eventi`
--

CREATE TABLE `eventi` (
  `event_id` int(11) NOT NULL,
  `titolo` varchar(255) DEFAULT NULL,
  `descrizione` text DEFAULT NULL,
  `creatore_id` int(11) DEFAULT NULL,
  `luogo` varchar(255) DEFAULT NULL,
  `data_evento` datetime DEFAULT NULL,
  `creato_il` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tipo_evento_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `eventi`
--

INSERT INTO `eventi` (`event_id`, `titolo`, `descrizione`, `creatore_id`, `luogo`, `data_evento`, `creato_il`, `tipo_evento_id`) VALUES
(1, 'Festa di Compleanno', 'Una festa di compleanno per amici e familiari.', 1, 'Casa di Marco', '2024-12-25 18:00:00', '2024-12-18 14:18:57', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `opzioni_sondaggio`
--

CREATE TABLE `opzioni_sondaggio` (
  `opzione_id` int(11) NOT NULL,
  `sondaggio_id` int(11) DEFAULT NULL,
  `descrizione` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `opzioni_sondaggio`
--

INSERT INTO `opzioni_sondaggio` (`opzione_id`, `sondaggio_id`, `descrizione`) VALUES
(1, 1, '25 Dicembre 2024'),
(2, 1, '26 Dicembre 2024'),
(3, 1, '31 Dicembre 2024');

-- --------------------------------------------------------

--
-- Struttura della tabella `partecipanti`
--

CREATE TABLE `partecipanti` (
  `partecipante_id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `stato_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `partecipanti`
--

INSERT INTO `partecipanti` (`partecipante_id`, `event_id`, `user_id`, `stato_id`) VALUES
(1, 1, 2, 1),
(2, 1, 3, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `sondaggi`
--

CREATE TABLE `sondaggi` (
  `sondaggio_id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `tipo_sondaggio_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `sondaggi`
--

INSERT INTO `sondaggi` (`sondaggio_id`, `event_id`, `tipo_sondaggio_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `stati_partecipante`
--

CREATE TABLE `stati_partecipante` (
  `stato_id` int(11) NOT NULL,
  `descrizione` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `stati_partecipante`
--

INSERT INTO `stati_partecipante` (`stato_id`, `descrizione`) VALUES
(1, 'Confermato'),
(2, 'Pendente'),
(3, 'Rifiutato');

-- --------------------------------------------------------

--
-- Struttura della tabella `tipi_evento`
--

CREATE TABLE `tipi_evento` (
  `tipo_evento_id` int(11) NOT NULL,
  `descrizione` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tipi_evento`
--

INSERT INTO `tipi_evento` (`tipo_evento_id`, `descrizione`) VALUES
(1, 'Festa'),
(2, 'Conferenza'),
(3, 'Meetup');

-- --------------------------------------------------------

--
-- Struttura della tabella `tipi_sondaggio`
--

CREATE TABLE `tipi_sondaggio` (
  `tipo_sondaggio_id` int(11) NOT NULL,
  `descrizione` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tipi_sondaggio`
--

INSERT INTO `tipi_sondaggio` (`tipo_sondaggio_id`, `descrizione`) VALUES
(1, 'Data'),
(2, 'Luogo'),
(3, 'Attività');

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nome_cognome` varchar(255) DEFAULT NULL,
  `registrato_il` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `autenticazione_provider` varchar(50) DEFAULT 'email',
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`user_id`, `email`, `password`, `nome_cognome`, `registrato_il`, `autenticazione_provider`, `is_active`) VALUES
(1, 'marco@example.com', 'hashed_password_1', 'Marco Rossi', '2024-12-18 14:18:57', 'email', 1),
(2, 'lucia@example.com', 'hashed_password_2', 'Lucia Bianchi', '2024-12-18 14:18:57', 'email', 1),
(3, 'giovanni@example.com', 'hashed_password_3', 'Giovanni Verdi', '2024-12-18 14:18:57', 'email', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `voti`
--

CREATE TABLE `voti` (
  `voto_id` int(11) NOT NULL,
  `sondaggio_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `opzione_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `voti`
--

INSERT INTO `voti` (`voto_id`, `sondaggio_id`, `user_id`, `opzione_id`) VALUES
(1, 1, 2, 1),
(2, 1, 3, 2);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `eventi`
--
ALTER TABLE `eventi`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `creatore_id` (`creatore_id`),
  ADD KEY `tipo_evento_id` (`tipo_evento_id`);

--
-- Indici per le tabelle `opzioni_sondaggio`
--
ALTER TABLE `opzioni_sondaggio`
  ADD PRIMARY KEY (`opzione_id`),
  ADD KEY `sondaggio_id` (`sondaggio_id`);

--
-- Indici per le tabelle `partecipanti`
--
ALTER TABLE `partecipanti`
  ADD PRIMARY KEY (`partecipante_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `stato_id` (`stato_id`);

--
-- Indici per le tabelle `sondaggi`
--
ALTER TABLE `sondaggi`
  ADD PRIMARY KEY (`sondaggio_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `tipo_sondaggio_id` (`tipo_sondaggio_id`);

--
-- Indici per le tabelle `stati_partecipante`
--
ALTER TABLE `stati_partecipante`
  ADD PRIMARY KEY (`stato_id`);

--
-- Indici per le tabelle `tipi_evento`
--
ALTER TABLE `tipi_evento`
  ADD PRIMARY KEY (`tipo_evento_id`);

--
-- Indici per le tabelle `tipi_sondaggio`
--
ALTER TABLE `tipi_sondaggio`
  ADD PRIMARY KEY (`tipo_sondaggio_id`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indici per le tabelle `voti`
--
ALTER TABLE `voti`
  ADD PRIMARY KEY (`voto_id`),
  ADD KEY `sondaggio_id` (`sondaggio_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `opzione_id` (`opzione_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `eventi`
--
ALTER TABLE `eventi`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `opzioni_sondaggio`
--
ALTER TABLE `opzioni_sondaggio`
  MODIFY `opzione_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `partecipanti`
--
ALTER TABLE `partecipanti`
  MODIFY `partecipante_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `sondaggi`
--
ALTER TABLE `sondaggi`
  MODIFY `sondaggio_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `stati_partecipante`
--
ALTER TABLE `stati_partecipante`
  MODIFY `stato_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `tipi_evento`
--
ALTER TABLE `tipi_evento`
  MODIFY `tipo_evento_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `tipi_sondaggio`
--
ALTER TABLE `tipi_sondaggio`
  MODIFY `tipo_sondaggio_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `voti`
--
ALTER TABLE `voti`
  MODIFY `voto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `eventi`
--
ALTER TABLE `eventi`
  ADD CONSTRAINT `eventi_ibfk_1` FOREIGN KEY (`creatore_id`) REFERENCES `utenti` (`user_id`),
  ADD CONSTRAINT `eventi_ibfk_2` FOREIGN KEY (`tipo_evento_id`) REFERENCES `tipi_evento` (`tipo_evento_id`);

--
-- Limiti per la tabella `opzioni_sondaggio`
--
ALTER TABLE `opzioni_sondaggio`
  ADD CONSTRAINT `opzioni_sondaggio_ibfk_1` FOREIGN KEY (`sondaggio_id`) REFERENCES `sondaggi` (`sondaggio_id`);

--
-- Limiti per la tabella `partecipanti`
--
ALTER TABLE `partecipanti`
  ADD CONSTRAINT `partecipanti_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `eventi` (`event_id`),
  ADD CONSTRAINT `partecipanti_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `utenti` (`user_id`),
  ADD CONSTRAINT `partecipanti_ibfk_3` FOREIGN KEY (`stato_id`) REFERENCES `stati_partecipante` (`stato_id`);

--
-- Limiti per la tabella `sondaggi`
--
ALTER TABLE `sondaggi`
  ADD CONSTRAINT `sondaggi_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `eventi` (`event_id`),
  ADD CONSTRAINT `sondaggi_ibfk_2` FOREIGN KEY (`tipo_sondaggio_id`) REFERENCES `tipi_sondaggio` (`tipo_sondaggio_id`);

--
-- Limiti per la tabella `voti`
--
ALTER TABLE `voti`
  ADD CONSTRAINT `voti_ibfk_1` FOREIGN KEY (`sondaggio_id`) REFERENCES `sondaggi` (`sondaggio_id`),
  ADD CONSTRAINT `voti_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `utenti` (`user_id`),
  ADD CONSTRAINT `voti_ibfk_3` FOREIGN KEY (`opzione_id`) REFERENCES `opzioni_sondaggio` (`opzione_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
