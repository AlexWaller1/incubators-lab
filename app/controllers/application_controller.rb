require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    #allows users to start a session in the database when logged in
    set :session_secret, "whatever"
    #makes user's data unreadable if anyone manages to get into the database
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  not_found do
    redirect '/'
  end
  #redirects to home page if bad url is inputed

  get "/" do
    erb :welcome
  end
  #brings us to home page

  def current_user
    User.find_by(id: session[:user_id])
  end
  #find user by the current session ID

  def logged_in?
    !!current_user
  end
  #method will be enacted if current_user method evaluates to true

end
