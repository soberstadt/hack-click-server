class Application < ApplicationRecord
  rails_admin do
    list do
      exclude_fields :created_at, :updated_at
    end
  end

  validates :title, :app_id, presence: true

  def install_link(platform)
    if platform == 'android'
      "https://play.google.com/store/apps/details?id=#{play_store_id}"
    else
      "https://itunes.apple.com/us/app/#{app_store_id}"
    end
  end
end
