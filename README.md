Devise Support for Honeywords
=============================

This plugin adds support for using Honeywords in the
[Devise](http://github.com/plataformatec/devise)
authentication framework. Honeywords were proposed in 2013 as a
method for detecting when password database breaches have
occurred by storing multiple passwords for each user - one
correct one, and a number of honeypot passwords.

An attacker who obtains a database full of hashed passwords and
cracks it will probabilistically have to choose a password for
each user. Each time a 'honeyword' is used it represents evidence
that the password database has been stolen and broken into.

More information about Honeywords can be found
[here](http://people.csail.mit.edu/rivest/honeywords/)

### Status

Honeyword authentication is supported but actually checking when
invalid authentication occurs is not yet supported. That's coming
up next.

**This means you should not use this in production systems.
Adding Honeywords with no notification system just makes it
easier for online attackers to work**.

### Usage

The plugin assumes that you are using Devise with ActiveRecord.
It may work with other ORMs, but has not been tested.

To setup a user model to use Devise + Honeywords:

    rails g devise user
    rails g devise_honeywordable:install user

This will configue the honeywords table in the database and
replace `:database_authenticatable` with
`:honeyword_authenticatable` as the authentication strategy.
