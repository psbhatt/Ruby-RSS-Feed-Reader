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

puts "Which RSS: VLR(A), Reuters(B), Other(C):"

option = STDIN.gets.chomp

if option == 'A'
  feed = RSS_Feed.new("https://www.vlr.gg/rss")
elsif option == 'B'
  feed = RSS_Feed.new("https://www.reutersagency.com/feed/?taxonomy=best-sectors&#038;post_type=best")
else
  puts "Enter RSS Url: "
  feed = RSS_Feed.new(STDIN.gets.chomp)
end

feed.getFeed

puts feed.url