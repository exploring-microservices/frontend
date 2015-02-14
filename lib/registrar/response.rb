module Registrar
  class Response
    attr_reader :data, :error

    def initialize(data: nil, error: nil)
      @data = data
      @error = error
    end

    def has_error?
      !error.nil?
    end

    def error_message
      error.message if has_error?
    end
  end
end
