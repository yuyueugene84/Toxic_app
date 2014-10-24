class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :type_name
      t.string :type_cname
      t.text :description

      t.timestamps
    end
  end
end
