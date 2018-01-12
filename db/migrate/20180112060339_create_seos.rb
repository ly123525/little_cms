class CreateSeos < ActiveRecord::Migration[5.0]
  def change
    create_table :seos do |t|
      t.integer :seoable_id
      t.string :seoable_type
      t.string :seo_title
      t.string :seo_description
      t.string :seo_keywords
      t.timestamps
    end
  end
end
