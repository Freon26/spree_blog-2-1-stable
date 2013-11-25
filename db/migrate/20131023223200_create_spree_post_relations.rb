class CreateSpreePostRelations < ActiveRecord::Migration

  def change
    create_table "spree_post_relations" do |t|
      t.integer  "post_id",    null: false
      t.integer  "related_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    add_index "spree_post_relations", ["post_id"],    name: "index_spree_post_relations_on_post_id"
    add_index "spree_post_relations", ["related_id"], name: "index_spree_post_relations_on_related_id"
  end

end
