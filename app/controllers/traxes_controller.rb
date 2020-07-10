class TraxesController < ApplicationController

  # GET: /traxes
  get "/traxes" do
    erb :"/traxes/index.html"
  end

  # GET: /traxes/new
  get "/traxes/new" do
    erb :"/traxes/new.html"
  end

  # POST: /traxes
  post "/traxes" do
    redirect "/traxes"
  end

  # GET: /traxes/5
  get "/traxes/:id" do
    erb :"/traxes/show.html"
  end

  # GET: /traxes/5/edit
  get "/traxes/:id/edit" do
    erb :"/traxes/edit.html"
  end

  # PATCH: /traxes/5
  patch "/traxes/:id" do
    redirect "/traxes/:id"
  end

  # DELETE: /traxes/5/delete
  delete "/traxes/:id/delete" do
    redirect "/traxes"
  end
end
