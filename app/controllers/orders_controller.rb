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

    respond_to do |format|
      if @order.save
        format.html { redirect_to @flat, notice: 'order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
        @order.booked = true
        @order.save
        send_owner_validation_email
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
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
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
   params.require(:order).permit(:date_begin, :date_end, :booked)
  end

  def send_owner_validation_email
    user = User.find(@flat.user_id)
    Usermailer.owner_validation(user).deliver
    raise
  end
end