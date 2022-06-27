class Product < ApplicationRecord
  has_many :shopping_carts, dependent: :destroy
  has_many :orders, through: :shopping_carts, dependent: :destroy
  validates :name, presence: {message: "Debe ingresar nombre del producto"}
  validates :sku, presence: {message: "Debe ingresar SKU del producto"}
  validates :description, presence: {message: "Debe ingresar descripción del producto"}
  validates :stock, presence: {message: "Debe ingresar stock del producto"}
  validates :price, presence: {message: "Debe ingresar precio del producto"}
  validates :pictures, presence: {message: "Debe ingresar imagen del producto"}
  validates :category, presence: {message: "Debe seleccionar categoria del producto"}
  belongs_to :category, optional: {message: "Debe seleccionar categoria del producto"}
  ratyrate_rateable "price"
  has_many_attached :pictures

  def to_s
    name
  end



end
