# Контроллер для заказа
class OrdersController < ApplicationController

  def create
    # Нашли корзину текущего пользователя и сохранили ее в переменную
    @cart = current_user.cart
    # Если корзина есть и она не пуста
    if @cart.present? && @cart.cart_items.any?
      order_items = @cart.cart_items.map { |ci| {  product_id: ci.product.id, quantity: ci.quantity } }
      # Создали заказ из содержимого корзины
      Order.create(
        user: current_user,
        status: :created, 
        order_items_attributes: order_items
      )
      # Очистили корзину
      @cart.cart_items.destroy_all
      # Вернули на главную c сообщением что заказ создан
      redirect_to products_path, flash: { notice: 'Заказ оформлен' }
    else
      # Иначе просто вернули на главную
      redirect_to products_path
    end
  end

end
