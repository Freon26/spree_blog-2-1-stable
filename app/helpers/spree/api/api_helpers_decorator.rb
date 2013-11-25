module Spree
  module Api
    ApiHelpers.module_eval do
      def author_attributes
        [:id, :first_name, :last_name, :full_name, :permalink]
      end

      def category_attributes
        [:id, :name, :permalink, :description]
      end

      def post_attributes
        [:id, :title, :permalink, :seo_title, :seo_description, :abstract, :body, :visible, :sticky, :created_at, :updated_at, :published_at]
      end

      def tag_attributes
        [:id, :name, :permalink, :description, :trending]
      end
    end
  end
end
