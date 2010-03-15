#!/usr/bin/ruby

require 'rubygems'
require 'rubygems/command'
require 'rubygems/commands/query_command'
require 'rubygems/local_remote_options'
require 'rubygems/spec_fetcher'
require 'rubygems/version_option'
require 'rubygems/text'
require 'net/http'
	

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

gems_version =  Gem::RubyGemsVersion
g = GemList.new("list")
vhash = g.execute()
username =''
api =''
f = File.new("osvt.conf")
begin
    while (line = f.readline)
        line.chomp
      
		if line =~ /(username)=(.+?)*/ 
			username = $2 
		end
		
		if line =~ /(api_key)=(.+?)*/ 
			api = $2 
		end
    end
rescue EOFError
    f.close
end

num  = (1 + rand(1024))
str = username<<"_"
sig_id = str<<num.to_s()

for v,k in vhash

Net::HTTP.get_response(URI.parse('http://127.0.0.1:3000/components?signature_id='<<sig_id<<'&api_key='<<api<<'&name='<<username<<'&comp_name='<<v.to_s()<<'&version='<<k.to_s()))

end

Net::HTTP.get_response(URI.parse('http://127.0.0.1:3000/components?signature_id='<<sig_id<<'&api_key='<<api<<'&name='<<username<<'&comp_name='<<"ruby_gems"<<'&version='<<gems_version.to_s()))

