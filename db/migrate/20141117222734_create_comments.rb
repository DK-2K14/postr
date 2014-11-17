class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content, presence: true
      t.references :user
      t.references :post, index: true
      t.timestamps
    end
  end
end
