module Spree
  module Api
    class TagsController < Spree::Api::BaseController
      respond_to :json
      def index
        @tags = Tag.ransack(params[:q]).result.page(params[:page]).per(params[:per_page])
      end

      def show
        @tag = Tag.find(params[:id])
      end
    end
  end
end
