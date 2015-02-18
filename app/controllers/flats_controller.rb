class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]


  def new
    @flat = Flat.new
    @flat.orders.build
  end

  def create
    @flat = Flat.new(flat_params)

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
    @flat.destroy
    respond_to do |format|
      format.html { redirect_to flats_url, notice: 'Flat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy

  end

  def index

    if params[:search]
      @flats = Flat.search(params[:search]).order("created_at DESC")
    else

      Flat.joins(:order).where(:orders => {:booked => false})
      @flats = Flat.all

    end
  end

  def show
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:description, :price, :capacity, :address, :city, :country, :picture)
  end
end
