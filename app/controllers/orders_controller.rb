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
      UserMailer.new_order(@order).deliver
      redirect_to orders_path
    else
      render :new
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to dashboard_path
  end

  def edit
  end

  def destroy

  end

  def index
  end

  def dashboard
  end

  def show
    # @order = Order.find(params[:id])
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
   params.require(:order).permit(:date_begin, :date_end, :booked, :accepted)
  end

  # def send_owner_validation_email
  #   user = User.find(@flat.user_id)
  #   UserMailer.owner_validation(user).deliver
  #   raise
  # end
end