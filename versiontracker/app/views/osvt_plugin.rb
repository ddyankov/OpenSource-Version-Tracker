#!/usr/bin/ruby

require 'rubygems'
require 'rubygems/command'
require 'rubygems/commands/query_command'
require 'rubygems/local_remote_options'
require 'rubygems/spec_fetcher'
require 'rubygems/version_option'
require 'rubygems/text'
require 'rest_client'
require 'net/http'

#API KEY IS GENERATED FROM THE WEBSITE
api_key = "XdtFeisPEM26w9SDrAM9"

#INCLUDE TRALING SLASH
rest_url = "http://127.0.0.1:3000/"

class GemList < Gem::Command
  
  include Gem::Text
  include Gem::LocalRemoteOptions
  include Gem::VersionOption
  
  def initialize(name = 'query',
    summary = 'Query gem information in local or remote repositories')
    super name, summary,
         :name => //, :domain => :local, :details => false, :versions => true,
         :installed => false, :version => Gem::Requirement.default
    
    
    add_option('-n', '--name-matches REGEXP',
               'Name of gem(s) to query on matches the',
               'provided REGEXP') do |value, options|
      options[:name] = /#{value}/i
    end
    
  end
  
  
  def execute
    exit_code = 0
    
    name = options[:name]
    
    dep = Gem::Dependency.new name, Gem::Requirement.default
    specs = Gem.source_index.search dep
    vhash = {}
    spec_tuples = specs.map do |spec|
      [[spec.name, spec.version, spec.original_platform, spec], :local]
      vhash[spec.name] = spec.version
    end
    return vhash
    
    
  end
  
end

gems_version = Gem::RubyGemsVersion
g = GemList.new("list")
vhash = g.execute()

for v,k in vhash
  
  Net::HTTP.get_response(URI.parse(rest_url<<'components?api_key='<<api_key<<'&comp_name='<<v.to_s()<<'&version='<<k.to_s()))
 
#print v,"\t",k,"\n"
end
 
#print "ruby_gems","\t",gems_version,"\n"
Net::HTTP.get_response(URI.parse(rest_url<<'components?api_key='<<api_key<<'&comp_name='<<"ruby_gems"<<'&version='<<gems_version.to_s()))
 