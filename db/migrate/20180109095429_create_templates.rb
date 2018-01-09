class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name
      t.string :file_name
      t.integer :content_type, :default=>0
      t.string :file_path
      t.text  :content
      t.timestamps null: false
    end
    add_index :templates, :content_type
  end
end
