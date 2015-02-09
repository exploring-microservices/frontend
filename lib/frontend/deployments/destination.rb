require "virtus"
require "vanguard"

module Frontend
  module Deployments
    class Destination
      include Virtus.model

      attribute :id, Integer
      attribute :type, String
      attribute :url, String
      attribute :branch, String

      def valid?
        validator.call(self).valid?
      end

      private

      def validator
        @validator ||= Vanguard::Validator.build do
          validates_presence_of :type, :url, :branch
          validates_primitive_of :type, :url, :branch, primitive: String
        end
      end
    end
  end
end
