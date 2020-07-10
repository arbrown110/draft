class TraxesController < ApplicationController

      #create
  get '/traxes' do
    if signed_in?
      @traxes = Trax.all
      erb :'/traxes/index'
    else
      redirect to '/sign_in'
    end
  end
   
  get '/traxes/new' do
    if signed_in?
      erb :'traxes/new'
    else
      redirect to '/sign_in'
    end   
  end

  post '/traxes' do
    #if params.values.any? {|value| value == ""}
     # erb :'traxes/new'
    if signed_in?  
    #else
      @user = User.find(session[:user_id])
      @traxes = Trax.create(
        name: params[:name], date: params[:date], 
        score: params[:score], location: params[:location], 
        number: params[:number], interest: params[:interest]
      )
      @traxes.user_id = current_user.id
      @traxes.save
      redirect to "/traxes/show"
    else  
      redirect '/sign_in'
    end
  end

    #review
  get '/traxes/:id' do
     if signed_in?
      @traxes = Trax.find_by_id(params[:users_id]) 
      erb :'/traxes/show'
    else
        erb :'users/sign_in' 
    end

  end

    
    #edit
  get '/traxes/:id/edit' do
    if signed_in?
      @traxes = Traxes.find(params[:id])
      if @traxes.user_id == current_user.id
        erb :'/traxes/edit'
      else
      redirect '/sign_in'
      end
    else
      redirect '/'
    end
  end
        
  

  patch '/traxes/:id' do
    #if params.value.any? {|value|value == ""}
     # redirect to "/traxes/#{@traxes.id}/edit" 
    #else   
      @traxes = Traxes.find(params[:id])
      @traxes = Traxes.update(
        name: params[:name], date: params[:date], 
        score: params[:score], location: params[:location], 
        number: params[:number], interest: params[:interest]
      )
      @traxes.save
      redirect to "/traxes/#{@traxes.id}"
    #end 
  end
    #delete
 delete '/traxes/:id/delete' do
    #@traxes = Traxes.find(params [:id])  
    #if session[:user_id]
    if signed_in?
      @traxes = Traxes.find(params[:id])
      if @traxes.user_id == current_user.id
        @traxes.destroy
        #redirect to '/traxes'
      #else
        #redirect to '/traxes'
      end
        erb :'users/show'
    else
      redirect to '/'
    end
  end

end