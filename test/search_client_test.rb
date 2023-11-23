
require 'minitest/autorun'
require 'json'
require 'pry'
require './services/search_clients_service'

class SearchClientsTest < Minitest::Test
	attr_reader	:result

	def setup
		search_clients_service = SearchClientsService.new('full_name', 'John Doe')
		@result = search_clients_service.call
	end

	def test_search_clients
		assert_equal 'John Doe', result.first['full_name']
	end

	def test_has_results
  assert_equal true, result.any?
	end
end
