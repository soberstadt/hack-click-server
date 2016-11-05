class DeepLinkController < ApplicationController
  def show
    app_id = params[:content_path].split('/')[0]
    app = Application.find_by(app_id: app_id)
    content_path = params[:content_path].sub("#{app_id}/",'')

    stored_params = params.except(:content_path, :referrer, :referrer_user_id, :platform)

    platform = params[:platform]

    referrer_app = nil
    referrer_app = Application.find_by(app_id: params[:referrer]) if params[:referrer]

    AppStoreReferral.create(application: app, referred_by_app: referrer_app, params: stored_params.to_h, path: content_path)

    redirect_to app.install_link(platform)
  end
end
