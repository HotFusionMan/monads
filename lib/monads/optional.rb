require 'monads/monad'

module Monads
  class Optional
    include Monad

    attr_reader :value

    def initialize(value)
      @value = value
    end

    def and_then(&block)
      block = ensure_monadic_result(&block)

      if value
        block.call(value)
      else
        self
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      super || !value || value.respond_to?(method_name, include_private)
    end

    def self.from_value(value)
      Optional.new(value)
    end
  end
end
