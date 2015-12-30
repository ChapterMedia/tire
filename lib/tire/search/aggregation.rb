module Tire
  module Search


    # http://www.elasticsearch.org/guide/reference/api/search/filter.html
    # http://www.elasticsearch.org/guide/reference/query-dsl/
    #

    # Dumber but simpler
    class Aggregation

      def initialize(name, *options)
        value = if options.size < 2
          options.first || {}
        else
          options
        end
        @hash = { name => value }
      end

      def to_json(options={})
        to_hash.to_json
      end

      def to_hash
        @hash
      end
    end

    # Smarter but more configuration knowledge required
    # class Aggregation

    #   def initialize(name, type, body, &block)
    #     @name    = name
    #     @value = {type => body}
    #     block.arity < 1 ? self.instance_eval(&block) : block.call(self) if block_given?
    #   end

    #   def aggregate(name, type, body={}, &block)
    #     @value['aggregations'] ||= {}
    #     @value['aggregations'].update Aggregation.new(name, type, body, &block).to_hash
    #   end

    #   def to_hash
    #     {@name => @value}
    #   end
    # end
  end
end
