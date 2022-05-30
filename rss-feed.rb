require 'rss'

require 'open-uri'


class RSS_Feed

  attr_reader :url

  def initialize(url)
    @url = url
  end

  def parseFeed
    RSS::Parser.parse(URI.open(@url))
  end

  def getFeed
    feed = parseFeed
    extractPrint(feed)
  end

  def extractPrint(rss_feed)
    rss_feed.items.each do |item|
      puts "\n................................."
      puts "Title: #{item.title}"
      puts "Date: #{item.pubDate}"
      puts "Description: #{item.description}"
      puts "Link: #{item.link}"
    end
  end


end

puts "Enter RSS URL: "

feed = RSS_Feed.new(STDIN.gets.chomp)

feed.getFeed

puts feed.url