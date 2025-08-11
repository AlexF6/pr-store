class AddImgSrcToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :imgSrc, :string
  end
end
