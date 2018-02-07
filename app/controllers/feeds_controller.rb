require 'rss'
require 'open-uri'
class FeedsController < ApplicationController
	  
	def index
	  rss_results = []
	  @news = RSS::Parser.parse(open('https://www.realwire.com/rss/?id=646&row=&view=Synopsis').read, false).items[0..30]
	  
	  @news.each do |result|
	    result = { title: result.title, date: result.pubDate, link: result.link, description: result.description }
	    rss_results.push(result)
	  end
	    return rss_results
	end


end