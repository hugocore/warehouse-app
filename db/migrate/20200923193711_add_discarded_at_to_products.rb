class AddDiscardedAtToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :discarded_at, :datetime
    add_index :products, :discarded_at
    add_index :products, [:discarded_at, :title]
  end
end
