#!/usr/bin/env ruby
require	'json' # for parsing JSON - standard library
require './services/search_duplicate_emails_service' # for searching clients.json - custom class

search_duplicate_emails_service = SearchDuplicateEmailsService.new
search_duplicate_emails_service.call
