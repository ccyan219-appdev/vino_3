class WinesController < ApplicationController
  def index
    @q = Wine.ransack(params[:q])
    @wines = @q.result(:distinct => true).includes(:listings, :locations, :histories, :users).page(params[:page]).per(10)

    render("wines/index.html.erb")
  end

  def show
    @listing = Listing.new
    @wine = Wine.find(params[:id])

    render("wines/show.html.erb")
  end

  def new
    @wine = Wine.new

    render("wines/new.html.erb")
  end

  def create
    @wine = Wine.new

    @wine.image = params[:image]
    @wine.name = params[:name]
    @wine.category = params[:category]
    @wine.variety = params[:variety]
    @wine.sweetness = params[:sweetness]
    @wine.body = params[:body]

    save_status = @wine.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/wines/new", "/create_wine"
        redirect_to("/wines")
      else
        redirect_back(:fallback_location => "/", :notice => "Wine created successfully.")
      end
    else
      render("wines/new.html.erb")
    end
  end

  def edit
    @wine = Wine.find(params[:id])

    render("wines/edit.html.erb")
  end

  def update
    @wine = Wine.find(params[:id])

    @wine.image = params[:image]
    @wine.name = params[:name]
    @wine.category = params[:category]
    @wine.variety = params[:variety]
    @wine.sweetness = params[:sweetness]
    @wine.body = params[:body]

    save_status = @wine.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/wines/#{@wine.id}/edit", "/update_wine"
        redirect_to("/wines/#{@wine.id}", :notice => "Wine updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Wine updated successfully.")
      end
    else
      render("wines/edit.html.erb")
    end
  end

  def destroy
    @wine = Wine.find(params[:id])

    @wine.destroy

    if URI(request.referer).path == "/wines/#{@wine.id}"
      redirect_to("/", :notice => "Wine deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Wine deleted.")
    end
  end
end
