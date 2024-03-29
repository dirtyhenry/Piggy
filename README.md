# Piggy

Piggy is an open-source playground iOS application to manage tiny debts between friends.


## What do we mean by playground application?

Piggy is the application we use to experiment new stuff. Bootstragram is a
mobile agency and we use it to evaluate new iOS features, new libraries, new
architecture design paradigms, etc.

It all started in 2009. Piggy was the app our founder developed to learn how
to code an iPhone application. Since then, it's been used by our team to start
being proficient in Swift, evaluate the VIPER architecture design, Google's
Firebase backend, etc. You can read more about those experiments on our website
at bootstragram.com.

Nonetheless, we do care a lot about people using Piggy and it is stable enough
to be used with confidence.

## What is Piggy?

### How to use it?

- Les événements ({events}) vous permettent de gérer vos comptes lorsque vous partez en week-end ou en vacances avec vos amis. Sélectionnez les participants et renseignez les notes pour chacun de vos achats communs. En fin d'événement, soldez vos comptes : Piggy vous indiquera qui doit combien à qui 
- Pour le quotidien et les amis que vous fréquentez régulièrement, utilisez le {one-to-one}, qui vous permet de gérer vos comptes avec vos amis les plus proches. Pour une sortie entre amis, au bar ou au restaurant, Piggy vous indiquera qui devra offrir la prochaine tournée !

### Features

- Création/suppression de notes, de contacts et d'événements
- Les contacts peuvent être importés depuis le carnet d'adresses
- Bascule de l'état comptes d'un événement sur le one-to-one
- Consultation de l'historique des dépenses (date, description, montant et participants d'une dépense)

### Technical Requirements

- Fonctionne avec la version 4.1 et ultérieures d'iOS (iPhone/iPod Touch et iPad)
- Disponible en version française et anglaise

## Development

### Requirements

* ruby 2.2.5p319 (2016-04-26 revision 54774) [x86_64-darwin16]
* Bundler version 1.13.6

### Instructions

    bundle install
    bundle exec pod install
    rake open

## Legacy version Release Notes

### 1.1 (2011/02/12)

* new graphic design;
* support of notes/contacts/events **deletions** (note: only contacts without notes attached can be deleted)
