class SearchClientsService
	attr_reader :search_key, :search_value, :clients

	def initialize(search_key, search_value)
		@search_key = search_key
		@search_value = search_value
		@clients = File.exist?('clients.json') ? JSON.parse(File.read('clients.json')) : []
	end

	def call
		if	clients.empty?
			puts "Error: clients.json not found in the current directory."
		else
			search_clients
		end
	end

	private
	def search_clients
		# Read the contents of the JSON file
		json_data = File.read('clients.json')

		# Parse the JSON data
		clients = JSON.parse(json_data)

		# Search for the key-value pair in the array of clients
		matching_clients = clients.select { |client| client[search_key] == search_value }

		# Print the matching clients
		if matching_clients.empty?
			puts "No clients found with #{search_key}: #{search_value}"
		else
			puts "Matching clients:"
			matching_clients.each do |client|
					puts client
			end
		end
	end
end
