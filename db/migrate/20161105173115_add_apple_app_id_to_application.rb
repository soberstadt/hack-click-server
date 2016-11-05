class AddAppleAppIdToApplication < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :apple_app_id, :string
  end
end
