class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :brand_id
      t.string :product_name
      t.string :product_cname

      t.timestamps
    end
  end
end
