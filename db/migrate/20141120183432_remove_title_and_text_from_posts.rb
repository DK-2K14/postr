class RemoveTitleAndTextFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :title, :string
    remove_column :posts, :text, :text
  end
end
