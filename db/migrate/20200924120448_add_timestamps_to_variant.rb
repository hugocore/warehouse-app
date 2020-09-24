class AddTimestampsToVariant < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def up
    add_column :variants, :created_at, :datetime
    add_column :variants, :updated_at, :datetime

    # avoid table rewrite
    change_column_default :variants, :created_at, Time.zone.now
    change_column_default :variants, :updated_at, Time.zone.now

    # backfill variants
    Variant.unscoped.in_batches do |batch|
      batch.update_all created_at: Time.zone.now
      batch.update_all updated_at: Time.zone.now
      sleep(0.01) # throttle
    end
  end

  def down
    remove_column :variants, :created_at
    remove_column :variants, :updated_at
  end
end
