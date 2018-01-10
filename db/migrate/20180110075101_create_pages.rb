class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :name
      t.text :content
      t.string :slug
      t.string :image
      t.integer :scope
      t.timestamps
    end
    add_index :pages, :slug
    add_index :pages, :scope
  end
end
