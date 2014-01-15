class ChatsController < ApplicationController
  def chatroom
    redirect_to new_session_path unless session[:username]
  end
end
