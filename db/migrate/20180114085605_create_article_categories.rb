class CreateArticleCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :article_categories do |t|
      t.string :name
      t.string :image
      t.integer :articles_count, :default=>0
      t.text :description
      t.string :slug
      t.integer :position, :default=>0
      t.integer :scope_index
      t.integer :scope_show


      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.timestamps
    end
    add_index :article_categories, :slug
    add_index :article_categories, :parent_id
    add_index :article_categories, :position
    add_index :article_categories, :scope_index
    add_index :article_categories, :scope_show
  end
end
