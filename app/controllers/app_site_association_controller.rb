class AppSiteAssociationController < ApplicationController
  def index
    apps = Application.where.not(apple_app_id: nil).select(:apple_app_id, :app_id)

    render json: {
      applinks: {
        apps: [],
        details: apps.map(&method(:app_details))
      }
    }
  end

  private

  def app_details(app)
    { appID: app.apple_app_id, paths: ["/deeplink/#{app.app_id}/*"] }
  end
end
