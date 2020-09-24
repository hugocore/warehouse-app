class CreateVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :variants do |t|
      t.string :sku
      t.integer :quantity
      t.references :product, null: false, foreign_key: true
    end
  end
end
