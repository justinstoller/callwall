#!/usr/bin/env ruby

require 'open-uri'
require 'nokogiri'

@hrefs = []
@file = File.new '/home/justin/Code for America/callwall/lib/newzipattempt.rb', 'w+'
@zippage = false
@doc = false
@anchors = false

load '/home/justin/Code for America/callwall/lib/ca_zips.rb'
CA_ZIPS.each do |zip|
  @zippage = open("http://opengovernment.org/search?addr=#{zip}&commit=Find")
  if @zippage
    @doc = Nokogiri::HTML(@zippage)
    @anchors = @doc.css('div#content ul li.person > a')
    if @anchors
      @anchors.each do |anchor|
        @hrefs << [zip, anchor['href']]
      end
    else
      puts 'no anchors found on this page!!!!'
    end
  else
    puts "no page found for #{zip}!!"
  end
  puts "retrieved #{zip}"
end
puts 'saving file'
@file.puts @hrefs.to_s
@file.close

