class AddLikesCountToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :likes_count, :integer
  end
end
