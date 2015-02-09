require "virtus"
require "vanguard"
require "frontend/deployments/source"
require "frontend/deployments/destination"

module Frontend
  module Deployments
    class Deployment
      include Virtus.model

      attribute :id, Integer
      attribute :name, String
      attribute :source, Source
      attribute :destination, Destination

      def valid?
        validator.call(self).valid? && source.valid? && destination.valid?
      end

      private

      def validator
        @validator ||= Vanguard::Validator.build do
          validates_presence_of :name, :source, :destination
          validates_primitive_of :name, primitive: String
        end
      end
    end
  end
end
