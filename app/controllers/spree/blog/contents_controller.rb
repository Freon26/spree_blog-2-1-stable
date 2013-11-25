module Spree
  module Blog
    class ContentsController < BaseController
      include Spree::Core::ControllerHelpers::Order
      layout 'spree/layouts/spree_blog'

      before_filter :load_blog_data

      def index
        @order = current_order
        @title = "Indice dei contenuti"
        @posts_searcher = build_posts_searcher params
        @posts = @posts_searcher.retrieve_posts
      end

      def show
        if @object = Spree::Post.where(permalink: params[:slug]).visible.first
          @title = @object.title
          render 'post'
        elsif @object = Spree::Author.where(permalink: params[:slug]).first
          @title = @object.full_name
          render 'author'
        elsif @object = Spree::Category.where(permalink: params[:slug]).first
          @title = @object.name
          render 'category'
        elsif @object = Spree::Tag.where(permalink: params[:slug]).first
          @title = @object.name
          render 'tag'
        else
          render_404
        end
      end

      def search
      end

      protected
      def load_blog_data
        @categories = Spree::Category.order(:name)
        @tags = Spree::Tag.with_posts.sorted_alphabetically
        @authors = Spree::Author.order([:last_name, :first_name])
      end
    end
  end
end
