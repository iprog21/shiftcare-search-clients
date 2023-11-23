require 'minitest/autorun'
require 'json'
require 'pry'
require './services/search_duplicate_emails_service'

class SearchDuplicateEmailsServiceTest < Minitest::Test
	attr_reader :result
	def setup
  search_duplicate_emails_service = SearchDuplicateEmailsService.new
		@result = search_duplicate_emails_service.call
 end

 def test_search_duplicate_emails_service
  assert result.any?
	end

	def test_results_is_greater_than_one
		assert result.first[1] > 1
	end
end
