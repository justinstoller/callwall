#!/usr/bin/env/ ruby

require 'rubygems'
require 'thor'
require 'nokogiri'

class Og < Thor

  desc '', 'scrape the opengovt site for members contact info'
  def scrape_zips
    load '/home/justin/Code for America/callwall/lib/ca_zips.rb'
    current_zips = CA_ZIP
    current_zips.each do |zip|
      zip_page = open("http://opengovernment.org/search?utf8=✓&addr=#{zip}&commit=Find"
      zip_model = ZipCode.new(:number => zip)
      parse_zip_page(zip_page, zip_model)
    end
  end

  private

  def parse_zip_page(zip_page, zip_model)
    doc = Nokogiri::HTML(zip_page)
    links = doc.css('div#content ul li.person > a')
    urls_for_zip = links.map(&:href)
    get_zip_contacts(urls_for_zip)
  end

  def get_zip_contacts(urls_for_zip)
