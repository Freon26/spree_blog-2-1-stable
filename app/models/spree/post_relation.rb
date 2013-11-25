module Spree
  class PostRelation < ActiveRecord::Base

    belongs_to :post
    belongs_to :related, class_name: 'Spree::Post'

    validates :post, :related, presence: true
    validates :related_id, uniqueness: { scope: :post_id }
  end
end

