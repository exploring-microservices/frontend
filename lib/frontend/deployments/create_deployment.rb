require "frontend/deployments/deployment"
require "registrar/deployments/create"

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
        Deployment.new(deployment)
      end

      def deployment
        Registrar::Deployments::Create[data]
      end
    end
  end
end
