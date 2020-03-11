class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :name, :string
    add_column :users, :biography, :string
    add_column :users, :user_image_id, :string
    add_column :users, :is_official, :boolean
    add_column :users, :deleted_at, :datetime
  end
end
