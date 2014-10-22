class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer :product_id
      t.string :ingredient_name
      t.string :ingredient_cname
      t.string :cas_number

      t.timestamps
    end
  end
end
