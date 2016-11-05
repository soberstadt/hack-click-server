class CreateAppStoreReferrals < ActiveRecord::Migration[5.0]
  def change
    create_table :app_store_referrals do |t|
      t.string :path
      t.string :params
      t.string :referrer_user_id
      t.string :device_id
      t.belongs_to :referred_by_app
      t.belongs_to :application

      t.timestamps
    end
  end
end
