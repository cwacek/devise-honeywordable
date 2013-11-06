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



























































































