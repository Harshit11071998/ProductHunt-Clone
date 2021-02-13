class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_url
      t.text :product_description

      t.timestamps
    end
  end
end
