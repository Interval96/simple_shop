# Контроллер для товаров
class ProductsController < ApplicationController
  include Paperclip::Storage::Database::ControllerClassMethods

  downloads_files_for :product, :photo

  def index
    # Получили список всех товаров и сохранили его в переменную для доступа из вьюхи
    if params[:cat]
      @category = Category.find(params[:cat])
      @products = @category.products.to_a
    else
      @products = Product.all.to_a
    end
  end

  def show
    # Нашли товар по переданному id и сохранили его в переменную для доступа из вьюхи
    @product = Product.find(params[:id])
  end

end
