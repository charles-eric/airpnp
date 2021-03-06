class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  before_filter :require_permission, only: [:edit, :destroy]

  def new
    @flat = Flat.new
    @flat.orders.build
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user_id = current_user.id

    respond_to do |format|
      if @flat.save
        format.html { redirect_to @flat, notice: 'Flat was successfully created.' }
        format.json { render :show, status: :created, location: @flat }
      else
        format.html { render :new }
        format.json { render json: @flat.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @flat.update(flat_params)
        format.html { redirect_to @flat, notice: 'Flat was successfully updated.' }
        format.json { render :show, status: :ok, location: @flat }
      else
        format.html { render :edit }
        format.json { render json: @flat.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def destroy
    @flat.delete
    redirect_to flats_path
  end

  def index
    if params[:city] && params[:capacity]
      @flats = Flat.search(params[:city], params[:capacity]).order('created_at DESC')
    else
      # TODO:
      # Flat.joins(:order).where(:orders => {:booked => false})
      @flats = Flat.all
      @markers = Gmaps4rails.build_markers(@flats) do |flat, marker|
        marker.lat flat.latitude
        marker.lng flat.longitude
      end
    end
  end

  def show
    set_flat
    @flat_coordinates = { lat: @flat.latitude, lng: @flat.longitude }
  end

  def require_permission
    if current_user != Flat.find(params[:id]).user
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:description, :price, :capacity, :address, :city, :country, :picture)
  end
end
