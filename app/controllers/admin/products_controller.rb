# Контроллер для товаров в админке
class Admin::ProductsController < AdminController

  def index
    # Получили список всех товаров и сохранили его в переменную для доступа из вьюхи
    @products = Product.all
  end

  def show
    # Нашли товар по переданному id и сохранили его в переменную для доступа из вьюхи
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    # Создали товар
    @product = Product.create(create_params)
    # Если создание успешно - перешли на страницу товара в админке, иначе вернули обратно
    if @product.valid?
      redirect_to admin_product_path(@product)
    else
      render :new
    end
  end

  def edit
    # Нашли товар по переданному id и сохранили его в переменную для доступа из вьюхи
    @product = Product.find(params[:id])
  end

  def update
    # Нашли товар по переданному
    @product = Product.find(params[:id])
    # Обновили товар
    @product.update(create_params)
    # Если обновление успешно - перешли на страницу товара в админке, иначе вернули обратно
    if @product.valid?
      redirect_to admin_product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    # Удалили товар
    Product.find(params[:id]).destroy
    # Переадресовали админа на страницу списка товаров
    redirect_to admin_products_path
  end

  private

  def create_params
    params.require(:product).permit(:name, :description, :quantity, :photo, :price, category_ids: [])
  end

end
