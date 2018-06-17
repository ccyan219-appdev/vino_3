class HistoriesController < ApplicationController
  before_action :current_user_must_be_history_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_history_user
    history = History.find(params[:id])

    unless current_user == history.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @histories = History.page(params[:page]).per(10)

    render("histories/index.html.erb")
  end

  def show
    @history = History.find(params[:id])

    render("histories/show.html.erb")
  end

  def new
    @history = History.new

    render("histories/new.html.erb")
  end

  def create
    @history = History.new

    @history.user_id = params[:user_id]
    @history.listing_id = params[:listing_id]
    @history.comments = params[:comments]
    @history.rating = params[:rating]
    @history.favorite = params[:favorite]

    save_status = @history.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/histories/new", "/create_history"
        redirect_to("/histories")
      else
        redirect_back(:fallback_location => "/", :notice => "History created successfully.")
      end
    else
      render("histories/new.html.erb")
    end
  end

  def edit
    @history = History.find(params[:id])

    render("histories/edit.html.erb")
  end

  def update
    @history = History.find(params[:id])
    @history.listing_id = params[:listing_id]
    @history.comments = params[:comments]
    @history.rating = params[:rating]
    @history.favorite = params[:favorite]

    save_status = @history.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/histories/#{@history.id}/edit", "/update_history"
        redirect_to("/histories/#{@history.id}", :notice => "History updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "History updated successfully.")
      end
    else
      render("histories/edit.html.erb")
    end
  end

  def destroy
    @history = History.find(params[:id])

    @history.destroy

    if URI(request.referer).path == "/histories/#{@history.id}"
      redirect_to("/", :notice => "History deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "History deleted.")
    end
  end
end
