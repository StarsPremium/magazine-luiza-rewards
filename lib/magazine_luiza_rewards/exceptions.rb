# frozen_string_literal: true

module MagazineLuizaRewards
  module Exceptions
    APIExceptionError = Class.new(StandardError)
    BadRequestError = Class.new(APIExceptionError)
    UnauthorizedError = Class.new(APIExceptionError)
    NotFoundError = Class.new(APIExceptionError)
    RequestTimeoutError = Class.new(APIExceptionError)
    UnprocessableEntityError = Class.new(APIExceptionError)

    def error_class(status_code)
      {
        400 => BadRequestError,
        401 => UnauthorizedError,
        404 => NotFoundError,
        408 => RequestTimeoutError,
        422 => UnprocessableEntityError
      }.fetch(status_code, APIExceptionError)
    end
  end
end
