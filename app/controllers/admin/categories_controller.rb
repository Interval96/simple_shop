# Контроллер для категорий в админке
class Admin::CategoriesController < AdminController

  def index
    # Получили список всех категорий и сохранили его в переменную для доступа из вьюхи
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    # Создали категорию
    @category = Category.create(create_params)
    # Если создание успешно - перешли на страницу категории в админке, иначе вернули обратно
    if @category.valid?
      redirect_to admin_categories_path, flash: { notice: "Категория успешно создана!" }
    else
      render :new
    end
  end

  def edit
    # Нашли товар по переданному id и сохранили его в переменную для доступа из вьюхи
    @category = Category.find(params[:id])
  end

  def update
    # Нашли категорию по переданному id
    @category = Category.find(params[:id])
    # Обновили категорию
    @category.update(create_params)
    # Если обновление успешно - перешли на страницу категории в админке, иначе вернули обратно
    if @category.valid?
      redirect_to admin_categories_path, flash: { notice: "Категория успешно изменена!" }
    else
      render :edit
    end
  end

  def destroy
    # Удалили категорию
    Category.find(params[:id]).destroy
    # Переадресовали админа на страницу списка категорий
    redirect_to admin_categories_path
  end

  private

  def create_params
    params.require(:category).permit(:title)
  end

end
