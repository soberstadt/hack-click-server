class DeepLinkController < ApplicationController
  def show
    app_id = params[:content_path].split('/')[0]
    app = Application.find_by(app_id: app_id)
    content_path = params[:content_path].sub("#{app_id}/",'')

    ignored_params = ['content_path', 'referrer', 'referrer_user_id', 'platform',
                      'device_id', 'controller', 'action']
    stored_params = params.permit!.except(*ignored_params)

    platform = params[:platform]

    device_id = params[:device_id]

    referrer_app = nil
    referrer_app = Application.find_by(app_id: params[:referrer]) if params[:referrer]

    AppStoreReferral.create(application: app, device_id: device_id, path: content_path,
                            params: stored_params.to_h, referred_by_app: referrer_app)
    ActionCable.server.broadcast 'messages',
                                 {
                                   content: 'redirected to app store',
                                   app: { name: app.title },
                                   device_id: device_id
                                 }

    redirect_to app.install_link(platform)
  end
end
