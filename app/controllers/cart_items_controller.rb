# Контроллер для товаров в корзине
class CartItemsController < ApplicationController
 
  def create
    # Добавили товар в корзину
    @item = CartItem.create(create_params)
    @item.update(quantity: 1) unless @item.quantity.present?
    # Переадресовали пользователя на страницу корзины
    redirect_to cart_path
  end
 
  def destroy
    # Удалили товар из корзины
    CartItem.find(params[:id]).destroy
    # Переадресовали пользователя на страницу корзины
    redirect_to cart_path
  end
 
  private
 
  def create_params
    params.require(:cart_item).permit(:cart_id, :product_id, :quantity)
  end
 
end