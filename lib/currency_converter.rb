require "rubygems"
require 'net/http'
require "json"

module CurrencyConverter

		def self.checkcurrency(from, to)
			uri = URI('http://rate-exchange.appspot.com/currency')
			params = { :from => from, :to => to }
			uri.query = URI.encode_www_form(params)

			res = Net::HTTP.get_response(uri)
			string = res.body if res.is_a?(Net::HTTPSuccess)

			parsed = JSON.parse(string) # returns a hash

			return parsed["rate"]
		end

end # End Module