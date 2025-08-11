class AddImageSrcToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :image_src, :string
  end
end
