module Spree
  module Admin
    class TagsController < ResourceController
      protected
      def find_resource
        Tag.find_by_permalink!(params[:id])
      end
    end
  end
end
