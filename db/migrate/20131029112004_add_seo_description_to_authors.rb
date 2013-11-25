class AddSeoDescriptionToAuthors < ActiveRecord::Migration
  def change
    add_column :spree_authors, :seo_description, :text
  end
end
