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


## Development

### Requirements

* ruby 2.2.5p319 (2016-04-26 revision 54774) [x86_64-darwin16]
* Bundler version 1.13.6

### Instructions

    bundle install
    bundle exec pod install
    rake open

### New module

    generamba gen CreateExpense swifty_viper
