require "frontend/deployments/deployment"
require "registrar/deployment/create"

module Frontend
  module Deployments
    class CreateDeployment
      def self.[](data)
        new(data).execute
      end

      def initialize(data)
        @data = data
        @klass = klass
      end

      def execute
        create_deployment
      end

      private

      attr_reader :data, :klass

      def create_deployment
        Deployment.new(parsed_response)
      end

      def parsed_response
        Registrar::Deployment::Create[data].parsed_response
      end
    end
  end
end
