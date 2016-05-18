# Класс модели товара
class Product < ActiveRecord::Base
  # Добавить прикрепленный файл (картинку) к модели с указанием картинки по умолчинию
  has_attached_file :photo, storage: :database, default_url: 'product_photo_missing.png'
  # Проверяет что прикрепленный файл точно картинка
  validates_attachment :photo, content_type: { content_type: %w(image/jpg image/jpeg image/png image/gif) }

  # Проверяет что при создании товара указано имя, описание итд
  validates :name, :description, :quantity, :price, presence: true
  validates :quantity, numericality: { only_integer: true }
  validates :price, numericality: true

  has_and_belongs_to_many :categories
end
