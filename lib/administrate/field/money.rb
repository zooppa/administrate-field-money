require 'rails'
require 'administrate/field/text'
require 'administrate/engine'

module Administrate
  module Field
    class Money < Administrate::Field::Text
      class Engine < ::Rails::Engine
        Administrate::Engine.add_javascript 'administrate-field-money/application'
      end

      def to_s
        money.format(symbol: symbol, separator: separator, delimiter: delimiter)
      end

      def money
        @money ||= ::Money.new(data, code)
      end

      def code
        options.fetch(:code, ::Money.default_currency.iso_code)
      end

      def symbol
        options.fetch(:symbol, money.symbol)
      end

      def delimiter
        options.fetch(:delimiter, money.delimiter)
      end

      def separator
        options.fetch(:separator, money.separator)
      end
    end
  end
end
