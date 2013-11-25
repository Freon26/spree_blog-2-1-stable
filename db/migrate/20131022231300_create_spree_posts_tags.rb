class CreateSpreePostsTags < ActiveRecord::Migration
  def change
    create_table "spree_posts_tags" do |t|
      t.integer  :post_id,        null: false
      t.integer  :tag_id,         null: false
    end

    add_index "spree_posts_tags", ["post_id"], :name => "index_spree_posts_tags_on_post_id"
    add_index "spree_posts_tags", ["tag_id"],  :name => "index_spree_posts_tags_on_tag_id"
  end
end
