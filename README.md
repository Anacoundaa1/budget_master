# Budget Master

Budget Master est une application de gestion des dépenses conçue pour vous aider à suivre et gérer efficacement vos finances personnelles. Avec Budget Master, vous pouvez facilement récupérer et ajouter des dépenses, ainsi que calculer le total des dépenses pour le mois en cours.

### Vous Trouverez dans le repository la collection postman permettant d'utiliser l'api sans le frontend

## Comment installer et lancer l'application

Ouvrez un terminal et tapez les lignes de commande suivantes :

```
cd backend
dart pub get
dart run
```

Ouvrez un deuxième terminal et tapez les lignes de commande suivantes :

```
cd frontend
dart pub get
flutter run
```

## Fonctionnalités

### Récupérer les dépenses

- Budget Master vous permet de récupérer toutes vos dépenses enregistrées.
- Vous pouvez consulter les détails de chaque dépense, y compris son titre, son montant et sa date.

### Ajouter des dépenses

- Vous avez la possibilité d'ajouter de nouvelles dépenses à tout moment.
- Il vous suffit de saisir les détails de la dépense, tels que le titre, le montant et la date, et Budget Master s'occupera du reste.

### Calculer le total des dépenses pour le mois en cours

- Budget Master calcule automatiquement le total des dépenses pour le mois en cours.
- Vous pouvez consulter ce total pour avoir une image précise de vos dépenses mensuelles.

## Comment utiliser Budget Master

1. **Récupérer les dépenses**

   - Accédez à la section "Suivi des dépenses" pour voir la liste de toutes vos dépenses enregistrées.

2. **Ajouter une nouvelle dépense**

   - Rendez-vous dans la section "Ajouter des dépenses".
   - Remplissez le formulaire en saisissant le titre, le montant et la date de la nouvelle dépense, puis cliquez sur le bouton "Ajouter".

3. **Calculer le total des dépenses pour le mois en cours**
   - Visitez la section "Accueil" pour voir le total des dépenses pour le mois en cours.

## Technologies utilisées

- Flutter pour le développement d'applications mobiles
- Dart comme langage de programmation
- API REST pour la communication avec le serveur backend
- Serveur backend (non inclus dans cette application de démonstration)

Veuillez noter que la fonctionnalité d'ajout de dépenses fonctionne avec Postman mais n'est actuellement pas disponible sur la partie frontend.

La fonctionnalité de login ne fonctionne pas dans le frontend, ainsi que la création d'user.

La création de user ne fonctionne pas dans l'app, ni côté back et front.

Toute la partie Authent est donc defectueuse, les dépenses et les totaux sont donc globaux.
