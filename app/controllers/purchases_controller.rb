class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @purchase_shipping_address = PurchaseShippingAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_params)
    if @purchase_shipping_address.valid?
      @purchase_shipping_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :prefecture_id, :city, :address, :phone_number,
                                                      :building_name).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
