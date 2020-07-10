class TraxesController < ApplicationController

      #create
  get '/traxes/new' do
    if signed_in?
        @traxes = Traxes.all
        erb :'traxes/index'
    else
        erb :'users/sign_in'
    end
  end
    
  post '/traxes' do
    if params.values.any? {|value| value == ""}
      erb :'traxes/new'
    else
      user = User.find(session[:user_id])
      @traxes = Traxes.create(
        name: params[:name], date: params[:date], 
        score: params[:score], location: params[:location], 
        number: params[:number], interest: params[:interest]
      )
      redirect to "/traxes/#{@traxes.id}"
    end
  end

    #review
  get '/traxes/:id' do
     if signed_in?
      @traxes = Traxes.find(params[:users_id]) 
      erb :'/traxes/show'
    else
        erb :'users/sign_in' 
    end

  end

    
    #edit
  get '/traxes/:id/edit' do
    if logged_in?
      @traxes = Traxes.find(params[:id])
      if @traxes.user_id == session[:user_id]
        erb :'/traxes/edit'
      else
      erb :'traxes'
      end
    else
      erb :'users/sign_in'
    end
  end
        
  end

  patch '/trax/:id' do
    if params.value.any? {|value|value == ""}
      redirect to "/traxes/#{@traxes.id}/edit" 
    else   
      @traxes = Traxes.find(params[:id])
      @traxes = Traxes.update(
          name: params[:name], date: params[:date], 
          score: params[:score], location: params[:location], 
          number: params[:number], interest: params[:interest]
      )
      @traxes.save
      redirect to "/traxes/#{@traxes.id}"
    end 
  end
    #delete
  delete '/traxes/:id/delete' do
    @traxes = Traxes.find(params [:id])  
    if session[:user_id]
       @traxes = Traxes.find(params[:id])
      if @traxes.user_id == session[:user_id]
        @traxes.delete
        redirect to '/traxes'
      else
        redirect to '/traxes'
      end
    else
      redirect to '/sign_in'
    end
  end

end