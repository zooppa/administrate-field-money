require 'administrate/field/text'
require 'administrate/engine'

module Administrate
  module Field
    class Money < Administrate::Field::Text
      class Engine < ::Rails::Engine
        Administrate::Engine.add_javascript 'administrate-field-money/application'
      end

      def to_s
        money.format
      end

      def money
        @money ||= ::Money.new(data, code)
      end

      def code
        options.fetch(:code, 'USD')
      end
    end
  end
end
