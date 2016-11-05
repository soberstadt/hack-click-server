class MessagesController < ApplicationController
  def index
  end

  def show
    # ActionCable.server.broadcast 'messages', data
    ActionCable.server.broadcast 'messages',
                                 {
                                   content: params[:id],
                                   app: { name: "JF" }
                                 }

    render plain: 'OK'
  end
end
