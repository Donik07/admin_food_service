class OrdersController < ApplicationController
  before_action :build_order, only: %i[new create create_auto]

  def new
    render :new
  end

  def create
    @order.attributes = order_params

    redirect_to root_path if @order.save
  end

  def index
    @order = Order.all
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to root_path
  end

  protected
  def build_order
    @order = Order.new
  end

  def order_params
    params.require(:order).permit(:title, :dishes, :amount, :customer_name, :customer_phone, :customer_comment,
                                  :order_stage_id, :account_id, :point_id)
  end
end
