class CreateSpreePosts < ActiveRecord::Migration
  def change
    create_table "spree_posts" do |t|
      t.string   "title",                              null: false
      t.string   "permalink",                          null: false
      t.string   "seo_title"
      t.text     "seo_description"
      t.text     "abstract"
      t.text     "body",                               null: false
      t.integer  "category_id",                        null: false
      t.integer  "author_id",                          null: false
      t.boolean  "sticky",            default: false,  null: false
      t.boolean  "visible",           default: false,  null: false
      t.datetime "published_at",                       null: false
      t.datetime "created_at",                         null: false
      t.datetime "updated_at",                         null: false
    end
    add_index "spree_posts", ["author_id"],   name: "index_spree_posts_on_author_id"
    add_index "spree_posts", ["category_id"], name: "index_spree_posts_on_category_id"
  end
end
