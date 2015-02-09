require "lotus/view"

module Frontend
  module Template
    class ApplicationLayout
      include Lotus::Layout

      def title
        "Frontend"
      end
    end
  end
end
