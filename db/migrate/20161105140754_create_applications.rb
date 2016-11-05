class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.string :title
      t.string :app_id
      t.string :app_store_id
      t.string :play_store_id

      t.timestamps
    end
  end
end
