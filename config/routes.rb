Rails.application.routes.draw do
  # Routes for the Listing resource:
  # CREATE
  get "/listings/new", :controller => "listings", :action => "new"
  post "/create_listing", :controller => "listings", :action => "create"

  # READ
  get "/listings", :controller => "listings", :action => "index"
  get "/listings/:id", :controller => "listings", :action => "show"

  # UPDATE
  get "/listings/:id/edit", :controller => "listings", :action => "edit"
  post "/update_listing/:id", :controller => "listings", :action => "update"

  # DELETE
  get "/delete_listing/:id", :controller => "listings", :action => "destroy"
  #------------------------------

  # Routes for the Wine resource:
  # CREATE
  get "/wines/new", :controller => "wines", :action => "new"
  post "/create_wine", :controller => "wines", :action => "create"

  # READ
  get "/wines", :controller => "wines", :action => "index"
  get "/wines/:id", :controller => "wines", :action => "show"

  # UPDATE
  get "/wines/:id/edit", :controller => "wines", :action => "edit"
  post "/update_wine/:id", :controller => "wines", :action => "update"

  # DELETE
  get "/delete_wine/:id", :controller => "wines", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end