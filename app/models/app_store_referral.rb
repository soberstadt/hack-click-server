class AppStoreReferral < ApplicationRecord
  belongs_to :referred_by_app, class_name: 'Application'
  belongs_to :application

  def params
    JSON.parse self[:params].gsub('=>', ':')
  end
end
