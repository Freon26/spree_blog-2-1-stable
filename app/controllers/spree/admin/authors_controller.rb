module Spree
  module Admin
    class AuthorsController < ResourceController
      protected
      def find_resource
        Author.find_by_permalink!(params[:id])
      end
    end
  end
end

