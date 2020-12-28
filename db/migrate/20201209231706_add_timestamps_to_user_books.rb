class AddTimestampsToUserBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :user_books, :created_at, :timestamp,null: false, default: -> { 'NOW()' }
    add_column :user_books, :updated_at, :timestamp, null: false, default: -> { 'NOW()' }
  end
end
