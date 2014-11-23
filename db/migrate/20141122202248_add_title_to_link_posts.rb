class AddTitleToLinkPosts < ActiveRecord::Migration
  def change
    add_column :link_posts, :title, :string, null: false
  end
end
