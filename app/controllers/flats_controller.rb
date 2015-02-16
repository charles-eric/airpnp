class FlatsController < ApplicationController
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end

  def flats_params
     params.require(:flat).permit(:title, :body, :picture)
     # A MODIF
end
