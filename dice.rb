=begin
1. Search form parameters:
	- Job title / keywords: class: form-control input-lg id: search-field-keyword
	- Zipcode, City or State: class: form-control  id: search-field-location
	- Find Tech Jobs
2. Pagination of results
	- URL parameters
3. Filters

a. Preform a search query and returns first results

=end


require 'rubygems'
require 'bundler/setup'
require 'mechanize'

def goog_searcher
	a = Mechanize.new

	a.get('http://google.com/') do |page|
	  search_result = page.form('f')
	  search_result.q = 'Hello world'
	  page = a.submit(search_result, search_result.buttons.first)
	  # end.submit
	  # pp page
	  page.links.each do |link|
	    puts link.text
	  end
	end
end
# a.get("http://www.dice.com/") do |page|
# 	#submit the search fields and get result
# 	search_result = page.form_with(:class => 'form-control') do |submit_query|
# 		submit_query.q = "Ruby on Rails"
# 		submit_query.l = "San Francisco, CA"
# 	end.submit

# 	search_result.length.each  do |link|
# 		puts link.text
# 	end

# end