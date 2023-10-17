class AddTitleToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :who, :string
    add_column :posts, :music, :string
  end
end
