class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.integer :article_category_id
      t.string :title
      t.string :subtitle
      t.string :author
      t.string :image
      t.integer :position, :default=>0
      t.text :content
      t.boolean :is_hot, :default=> false
      t.string :slug

      t.integer :scope_index
      t.integer :scope_show

      t.timestamps
    end
    add_index :articles, :slug
    add_index :articles, :article_category_id
    add_index :articles, :position
    add_index :articles, :is_hot
    add_index :articles, :scope_index
    add_index :articles, :scope_show
  end
end
