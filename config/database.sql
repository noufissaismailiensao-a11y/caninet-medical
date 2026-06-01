CREATE DATABASE IF NOT EXISTS cabinet_medical
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE cabinet_medical;

CREATE TABLE IF NOT EXISTS utilisateurs (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    nom         VARCHAR(100) NOT NULL,
    email       VARCHAR(150) NOT NULL UNIQUE,
    mot_de_passe VARCHAR(255) NOT NULL,       -- bcrypt hash
    role        ENUM('admin','secretaire') DEFAULT 'admin',
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS medecins (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    nom          VARCHAR(100) NOT NULL,
    prenom       VARCHAR(100) NOT NULL,
    specialite   VARCHAR(100) NOT NULL,
    telephone    VARCHAR(20),
    email        VARCHAR(150),
    heure_debut  TIME DEFAULT '08:00:00',
    heure_fin    TIME DEFAULT '16:00:00',
    actif        TINYINT(1) DEFAULT 1,
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS patients (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    nom          VARCHAR(100) NOT NULL,
    prenom       VARCHAR(100) NOT NULL,
    date_naissance DATE,
    telephone    VARCHAR(20),
    email        VARCHAR(150),
    adresse      TEXT,
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS rendez_vous (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    patient_id   INT NOT NULL,
    medecin_id   INT NOT NULL,
    date_rdv     DATE NOT NULL,
    heure_rdv    TIME NOT NULL,
    motif        VARCHAR(255),
    statut       ENUM('en_attente','confirme','annule') DEFAULT 'en_attente',
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE,
    FOREIGN KEY (medecin_id) REFERENCES medecins(id) ON DELETE CASCADE
);


-- Admin (mot de passe : admin123)
INSERT INTO utilisateurs (nom, email, mot_de_passe, role) VALUES
('Administrateur', 'admin@cabinet.ma', '$2y$12$SBfzEsCQvdw1qWi2jrIlW.02N4Diy8bQZV/iadAziDXS5DkmAvtEu', 'admin');

-- Médecins
INSERT INTO medecins (nom, prenom, specialite, telephone, heure_debut, heure_fin) VALUES
('Benali',   'Ahmed',  'Cardiologue',        '0536123456', '08:00', '16:00'),
('Amgharbi',  'Siham', 'Pédiatre',           '0536224478', '09:00', '17:00'),
('Abbasi',  'Karim',  'Médecine Générale',  '0536335590', '08:30', '15:30'),
('Mansouri', 'Amal',  'Dermatologiste',     '0536446612', '10:00', '18:00');

-- Patients
INSERT INTO patients (nom, prenom, date_naissance, telephone) VALUES
('Alami',    'Mohammed',    '1985-03-12', '0661234567'),
('Idrissi',  'Hanae','2010-07-22', '0662345678'),
('El Amrani','Youssef',     '1992-11-05', '0663456789'),
('Benmoussa','Samir',       '1978-06-18', '0664567890'),
('Tahiri',   'Hassan',      '1965-01-30', '0665678901');

-- Rendez-vous (aujourd'hui = CURDATE())
INSERT INTO rendez_vous (patient_id, medecin_id, date_rdv, heure_rdv, motif, statut) VALUES
(1, 1, CURDATE(), '08:30', 'Consultation cardiaque',      'confirme'),
(2, 2, CURDATE(), '09:00', 'Suivi pédiatrique',           'confirme'),
(3, 3, CURDATE(), '09:45', 'Fièvre persistante',          'en_attente'),
(4, 4, CURDATE(), '10:30', 'Consultation dermatologique', 'confirme'),
(5, 1, CURDATE(), '11:00', 'ECG & bilan cardiaque',       'en_attente'),
(1, 2, CURDATE(), '14:00', 'Vaccination enfant',          'annule');

