module Registrar
  class Configuration
    attr_writer :registrar_url

    class NotSet < StandardError; end

    def registrar_url
      @registrar_url || exception("registrar_url")
    end

    private

    def exception(key)
      raise NotSet.new(key)
    end
  end
end
