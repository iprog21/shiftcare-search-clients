 #!/usr/bin/env ruby
require	'json' # for parsing JSON - standard library
require './services/search_clients_service' # for searching clients.json - custom class

if ARGV.length != 0
	search_clients_service = SearchClientsService.new(ARGV[0], ARGV[1])
	search_clients_service.call
else
		puts "No arguments provided. Usage: ruby search.rb <arg1> <arg2>"
		puts "sample: ruby search.rb full_name 'John Doe'"
		exit
end
