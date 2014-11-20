class MakePostContentPolymorphic < ActiveRecord::Migration
  def change
    add_column :posts, :content_type, :string
    add_column :posts, :content_id, :integer
  end
end
