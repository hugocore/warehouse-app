class AddTimestampsToProduct < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def up
    add_column :products, :created_at, :datetime
    add_column :products, :updated_at, :datetime

    # avoid table rewrite
    change_column_default :products, :created_at, Time.zone.now
    change_column_default :products, :updated_at, Time.zone.now

    # backfill products
    Product.unscoped.in_batches do |batch|
      batch.update_all created_at: Time.zone.now
      batch.update_all updated_at: Time.zone.now
      sleep(0.01) # throttle
    end
  end

  def down
    remove_column :products, :created_at
    remove_column :products, :updated_at
  end
end
