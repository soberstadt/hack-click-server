class LookupController < ApplicationController
  def index
    app_id = params[:app_id]
    app = Application.find_by!(app_id: app_id)
    device_id = params[:device_id]
    referral = AppStoreReferral.order(created_at: :desc).find_by!(application: app, device_id: device_id)

    content_path = referral.path

    stored_params = referral.params

    referrer_app = referral.referred_by_app

    render json: {
      path: content_path,
      params: stored_params,
      referrer: referrer_app&.app_id,
      referrer_user_id: referral.referrer_user_id
    }
  end
end
