class UsersController < ApplicationController

  get '/register' do
    if signed_in?
      reirect to'/traxes'
    else
      erb :'users/register' 
    end   
  end

  post '/register' do
    if params.values.any? {|value| value == ""}
    redirect to '/register' 
    else
      @user = User.new( username: params[:username], email: params[:email],  password: params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/traxes'
    end    
  end 

  get '/sign_in' do
    if signed_in?
    #@user= User.find(session[:users_id])
    erb :'users/show'
    else
     erb :'users/sign_in'     
    end
  end

  post '/sign_in' do
      @user = User.find_by(:username => params[:username])
     
      if @user && @user= User.find_by(username: params[:username])
          session[:id] = @user.id
          redirect to '/traxes'
      else
          redirect '/sign_in '  
      end      
  end 

  get '/users/sign_out' do
    if signed_in?
      session.destroy
      redirect '/sign_in'
    else 
      redirect to '/'
    end
  end

  patch '/users/:id' do
    @user = User.find(params[:id])
    @user.update(username:params[:name], email:params[:email], password:params[:password_digest])
    redirect '/users/show'
  end

end  
