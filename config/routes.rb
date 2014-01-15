FayeTest::Application.routes.draw do
  root 'chats#chatroom'
  resource :session, only: [:new, :create]
end
