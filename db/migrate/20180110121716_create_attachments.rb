class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.string :file
      t.integer :user_id
      t.string :target_type
      t.integer :target_id
      t.string :second_target_type
      t.integer :second_target_id
      t.string :third_target_type
      t.integer :third_target_id

      t.timestamps null: false
    end
    add_index :attachments,:user_id
  end
end
