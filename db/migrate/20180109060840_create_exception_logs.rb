class CreateExceptionLogs < ActiveRecord::Migration
  def change
    create_table :exception_logs do |t|
      t.string :error_class
      t.text :message
      t.text :backtrace,:limit => 4294967295
      t.text :data
      t.text :request,:limit => 4294967295
      t.text :session,:limit => 4294967295

      t.timestamps null: false
    end
  end
end
