# 💼 Gestion des offres d'emploi
<p align="center">
  <img src="Images/logo.jpg" alt="Logo de l'application" width="600">
</p>

## 📘 1. Contexte :  
Ce projet est une application web de gestion des offres d’emploi, permettant aux entreprises de publier des offres, aux candidats de postuler, et aux administrateurs de visualiser les statistiques de candidatures.  
Il vise à faciliter le processus de recrutement à travers une plateforme simple, interactive et efficace.

## ❗ 2. Problématique :  
La gestion traditionnelle des offres d’emploi (emails, formulaires papiers, etc.) engendre un manque d’organisation, de centralisation et de suivi.  
Ce projet répond au besoin de digitaliser le recrutement, d’automatiser les candidatures, et de proposer une interface de suivi en temps réel des statistiques de recrutement.

## 🎯 3. Objectifs :
- Permettre aux entreprises de publier, modifier et supprimer des offres.  
- Permettre aux utilisateurs de consulter les offres et de postuler en ligne avec CV (via AJAX).  
- Offrir un espace candidat pour consulter l’historique des candidatures.  
- Générer des statistiques visuelles sur les candidatures avec Chart.js.  
- Proposer une architecture propre et modulaire respectant les bonnes pratiques (MVC, REST...).

## 🧰 4. Technologies utilisées :

### 🖥️ Frontend :
- **HTML5 / CSS3** – Structure et mise en forme des pages.
- **JavaScript / AJAX** – Interaction dynamique et communication avec le backend.
- **Chart.js** – Visualisation graphique des statistiques de candidatures.
- **Bootstrap** – Pour une interface responsive et moderne.

### ⚙️ Backend :
- **Java** – Langage principal pour la logique métier.
- **Hibernate (ORM)** – Pour la gestion de la persistance des données et les interactions avec la base de données de manière orientée objet.
- **JPA (Java Persistence API)** – Interface standard pour travailler avec Hibernate.
- **JDBC (optionnel)** – Utilisé en complément si nécessaire pour des requêtes spécifiques.

### 🗃️ Base de données :
- **MySQL** – Stockage des données (offres, utilisateurs, candidatures, entreprises...).

  ```sql
CREATE TABLE User (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100),
    email VARCHAR(150),
    motDePasse VARCHAR(100)
);

CREATE TABLE Candidat (
    id INT PRIMARY KEY,
    telephone VARCHAR(20),
    FOREIGN KEY (id) REFERENCES User(id)
);

CREATE TABLE Admin (
    id INT PRIMARY KEY,
    matricule VARCHAR(100),
    FOREIGN KEY (id) REFERENCES User(id)
);

CREATE TABLE Entreprise (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100),
    secteur VARCHAR(100)
);

CREATE TABLE Offre (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(150),
    description TEXT,
    salaire DOUBLE,
    typeContrat VARCHAR(50),
    entreprise_id INT,
    FOREIGN KEY (entreprise_id) REFERENCES Entreprise(id)
);

CREATE TABLE Candidature (
    id INT PRIMARY KEY AUTO_INCREMENT,
    offre_id INT,
    user_id INT,
    date DATETIME,
    cvPath VARCHAR(255),
    FOREIGN KEY (offre_id) REFERENCES Offre(id),
    FOREIGN KEY (user_id) REFERENCES User(id)
);
```

## 🧩 5. Diagramme de classes (UML) :

![image](https://github.com/RAFIKAITICHOU/Gestion_des_offres_d_emploi/blob/main/Images/class%20dig.png)

## 🗺️ 6.  Modèle conceptuel de la base généré :

![image](https://github.com/RAFIKAITICHOU/Gestion_des_offres_d_emploi/blob/main/Images/db.png)


## 🧪 7. Exécution des tests (console/logs) :

![image](https://github.com/RAFIKAITICHOU/Gestion_des_offres_d_emploi/blob/main/Images/Capture1.png)
![image](https://github.com/RAFIKAITICHOU/Gestion_des_offres_d_emploi/blob/main/Images/Capture2.png)
