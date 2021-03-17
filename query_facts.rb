require 'puppet/util/puppetdb'
require 'puppetdb/connection'
def query_facts(query, facts)
  facts = facts.map { |fact| fact.match(/\./) ? fact.split('.') : fact }
  facts_for_query = facts.map { |fact| fact.is_a?(Array) ? fact.first : fact }

  #uri = URI(Puppet::Util::Puppetdb.config.server_urls.first)
  uri = URI('http://localhost:8080')
  puppetdb = PuppetDB::Connection.new(uri.host, uri.port, uri.scheme == 'https')
  parser = PuppetDB::Parser.new
  query = parser.facts_query query, facts_for_query if query.is_a? String
  parser.facts_hash(puppetdb.query(:facts, query, :extract => [:certname, :name, :value]), facts)
end
Puppet.initialize_settings
foo = query_facts("File['/var/lib/kubelet/config.json']", ['fqdn'])
pp foo

