class AddDiscardedAtToVariants < ActiveRecord::Migration[6.0]
  def change
    add_column :variants, :discarded_at, :datetime
    add_index :variants, :discarded_at
    add_index :variants, [:discarded_at, :sku]
  end
end
