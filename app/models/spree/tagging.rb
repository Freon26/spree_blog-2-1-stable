module Spree
  class Tagging < ActiveRecord::Base
    self.table_name = 'spree_posts_tags'

    belongs_to :tag,  inverse_of: :taggings
    belongs_to :post, inverse_of: :taggings

    validates :post, :tag, presence: true
    validates :post_id, uniqueness: { scope: :tag_id }
  end
end
