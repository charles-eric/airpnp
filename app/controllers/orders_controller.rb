class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @flat = Flat.find(params[:flat_id])
    @order = @flat.orders.build
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @order = @flat.orders.build(order_params)
    @order.user = current_user
    @order.booked = true
    if @order.save
      redirect_to orders_path
      # send_owner_validation_email
    else
      render :new
    end
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
    # @order = Order.find(params[:id])
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
   params.require(:order).permit(:date_begin, :date_end, :booked)
  end

  # def send_owner_validation_email
  #   user = User.find(@flat.user_id)
  #   UserMailer.owner_validation(user).deliver
  #   raise
  # end
end