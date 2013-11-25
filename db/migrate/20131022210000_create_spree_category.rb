class CreateSpreeCategory < ActiveRecord::Migration

  def change
    create_table "spree_categories" do |t|
      t.string   "name",        null: false
      t.string   "permalink",   null: false
      t.text     "description"

      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end
    add_index "spree_categories", ["permalink"], name: "index_spree_categories_on_permalink"
  end

end
