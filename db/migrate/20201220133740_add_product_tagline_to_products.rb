class AddProductTaglineToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :product_tagline, :string
  end
end
