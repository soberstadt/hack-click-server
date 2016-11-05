class MessagesController < ApplicationController
  def index
  end

  def show
    # ActionCable.server.broadcast 'messages', data
    app = Application.find_by(app_id: params[:app_id])
    render(plain: 'App not found') and return unless app
    ActionCable.server.broadcast 'messages',
                                 {
                                   content: params[:content],
                                   app: { name: app.title },
                                   device_id: params[:device_id]
                                 }

    render plain: 'OK'
  end
end
