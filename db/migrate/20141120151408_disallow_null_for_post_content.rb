class DisallowNullForPostContent < ActiveRecord::Migration
  def change
    change_column :posts, :content_type, :string, null: false
    change_column :posts, :content_id, :integer, null: false
  end
end
