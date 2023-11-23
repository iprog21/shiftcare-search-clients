#!/usr/bin/env ruby

require 'webrick'
require 'json'
require 'pry'
require 'uri'
require './services/search_clients_service'
require './services/search_duplicate_emails_service'

class ShiftcareApi < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    case request.path
    when '/api/search'
      handle_api(request, response)
				when '/api/find_duplicates'
					handle_find_duplicates(response)
    else
      handle_default(response)
    end
  end

  def handle_api(request, response)
    params = request.query_string.split('&').map { |param| param.split('=') }.to_h
    search_key = URI.decode_www_form_component(params['key'])
    search_value = URI.decode_www_form_component(params['value'])

				search_clients_service = SearchClientsService.new(search_key, search_value)
				search_result = search_clients_service.call

				data = { result: search_result }

    response.body = JSON.generate(data)
    response.content_type = 'application/json'
  end

		def handle_find_duplicates(response)
			search_duplicate_emails_service = SearchDuplicateEmailsService.new
			search_result = search_duplicate_emails_service.call

			data = { result: search_result }

			response.body = JSON.generate(data)
			response.content_type = 'application/json'
		end

  def handle_default(response)
    response.body = 'Not Found'
    response.status = 404
  end
end

def start_server(port)
	server = WEBrick::HTTPServer.new(Port: port)
	server.mount('/', ShiftcareApi)
	trap('INT') { server.shutdown }
	server.start
end

# Read the port number from the environment variable or use a default value (4567)
port = ENV['PORT'] || 4567

start_server(port.to_i)

# ruby -S rackup config.ru -p 4567