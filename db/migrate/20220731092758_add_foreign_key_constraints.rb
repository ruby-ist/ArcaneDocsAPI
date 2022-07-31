class AddForeignKeyConstraints < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :posts, :users
    add_foreign_key :images, :posts
    add_foreign_key :likes, :users
    add_foreign_key :likes, :posts
    add_foreign_key :shares, :posts
    add_foreign_key :shares, :users, column: :from_id
    add_foreign_key :shares, :users, column: :to_id
  end
end
