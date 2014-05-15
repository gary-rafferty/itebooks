require "itebooks/version"
require "httparty"
require "uri"

module Itebooks
  class Book
    include HTTParty

    base_uri 'http://it-ebooks-api.info/v1/'

    def initialize attrs
      attrs.each do |name, val|
        if name == 'ID'
          lower_camel_cased = 'id'
        elsif name == 'ISBN'
          lower_camel_cased = 'isbn'
        else
          lower_camel_cased = name.gsub(/(.)([A-Z])/,'\1_\2').downcase
        end
        instance_variable_set "@#{lower_camel_cased}", val

        define_singleton_method lower_camel_cased.to_sym do
          instance_variable_get "@#{lower_camel_cased}"
        end
      end
    end

    class << self
      def search(query)
        encoded_query = URI.encode(query)
        if(response = get('/search/'+encoded_query))
          response['Books'].map { |b| self.new b }
        else
          # bork
        end
      end

      def find(id)
        if(response = get('/book/'+id.to_s))
          attrs = response.parsed_response

          attrs.delete 'Error'
          attrs.delete 'Time'

          self.new attrs
        else
          # bork
        end
      end
    end
  end
end
