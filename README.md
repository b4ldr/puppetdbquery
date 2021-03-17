This is almost an exact copy of https://github.com/dalen/puppet-puppetdbquery/tree/master/lib/puppetdb

I have just moved it out of the puppet structures to make it a bit easier
to test things locally without puppet getting in the way

To run use the following command

```
sudo RUBYLIB='.' ruby query_facts.rb
