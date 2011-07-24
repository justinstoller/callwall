#!/usr/bin/env ruby

require 'open-uri'

root_domain = 'http://api.votesmart.org/'

resource = 'Candidates'

method = 'getByZip'

format = 'JSON'

key = 'd4efef39d0e0f9c9cb14ec5df6ebfc71'

params = {key: key, format: format}

def parse_params(params)
  @parsed = []
  params.each do |key, value|
    @parsed << "#{key.to_s}=#{value.to_s}"
  end
  @parsed.join("&")
end


query = root_domain + resource + '.' + method + '?' + parse_params(params)

result = open(query)


