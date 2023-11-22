class SearchDuplicateEmailsService
	attr_reader :clients

	def initialize
		@clients	= File.exist?('clients.json') ? JSON.parse(File.read('clients.json')) : []
	end

	def call
		if	clients.empty?
			puts "Error: clients.json not found in the current directory."
		else
			search_email_duplicates
		end
	end

	private
	def search_email_duplicates
		# Create a hash of emails and their count (default value is 0)
		email_counts = Hash.new(0)

		# Iterate over the clients and count the emails
		clients.each do |client|
				email = client['email']
				email_counts[email] += 1
		end

			# Find the emails that have a count > 1
			duplicate_emails = email_counts.select { |email, count| count > 1 }

			# Print the duplicate emails
			if duplicate_emails.empty?
				puts "No duplicate emails found."
			else
				puts "Duplicate emails:"
				duplicate_emails.each do |email, count|
					puts "#{email}: #{count}"
				end
			end
	end
end
