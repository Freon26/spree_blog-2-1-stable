module Spree
  module Admin
    class CategoriesController < ResourceController
      def index
        respond_with @collection
      end

      protected
      def find_resource
        Category.find_by_permalink!(params[:id])
      end
    end
  end
end
