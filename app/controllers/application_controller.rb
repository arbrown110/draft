require './config/environment'

class ApplicationController < Sinatra::Base
  
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new{ File.join(root, "../views/") }
  
  configure do
    enable :sessions
    set :session_secret, 'lovetrack'
  end

  get "/" do
    erb :welcome 
  end

  helpers do

    def render_navbar
      if signed_in?
        erb :sign_in_navbar
      else  
        erb :welcome
      end   
    end

    def signed_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end

end
