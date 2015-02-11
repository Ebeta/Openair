class AddPhotoToProduct < ActiveRecord::Migration
  def change
    add_column :products, :photo_product, :string
  end
end
