# lesupercoin
Symfony project CRUD

!!! ne pas oublier de d'effectuer la commande "composer require symfony/runtime" afin de générer les dossier var et vendor !!!

Utilisateurs : 
  - email: user@user.fr mdp: test
  - email: admin@admin.fr mdp: test

l'utilisateur ayant le rôle "user" peut voir l'ensemble des annonces et le detail de chacune ainsi qu'à sa page de profil; 
néanmoins il ne peut pas accéder à la gestion des annonces ou des utilisateurs (add / update / remove) -> se référer à security.yml "config/packages/security.yml

L'utilisateur ayant le rôle "Admin" possède l'accès à toutes les pages disponibles 
il peut également ajouter modifier supprimer des annonces et modifier et supprimer des utilisateurs

La base de donnée se situe dans le dossier Bdd
