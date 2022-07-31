class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :session_id
      t.string :profile_url

      t.timestamps
    end

    create_table :posts do |t|
      t.string :title
      t.belongs_to :user

      t.timestamps
    end

    create_table :images do |t|
      t.string :image_url
      t.belongs_to :post

      t.timestamps
    end

    create_table :likes do |t|
      t.belongs_to :post
      t.belongs_to :user

      t.timestamps
    end

    create_table :shares do |t|
      t.references :from
      t.references :to
      t.belongs_to :post

      t.timestamps
    end
  end
end
