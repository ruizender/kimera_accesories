class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :name, presence: {message: "Debe ingresar nombre de la categoria"}
  def to_s
    name
  end
end
