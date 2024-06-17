# frozen_string_literal: true

module MagazineLuizaRewards
  module Api
    class Categories < Base
      def categories
        response = request(:get, '/api/v1/categories')
        response.map { |category| Category.new(category) }
      end
    end
  end
end
