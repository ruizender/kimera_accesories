# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
user = User.create!(
    email: 'prueba@gmail.com', 
    name: "Prueba",
    lastname: "user",
    address: "Prueba dirección",
    rut: "55.555.555-5",
    phone: "999999999",
    admin: true, 
    password: '123123',
    password_confirmation: '123123')

category = Category.create!(
    name: "Categoria de prueba"
)

9.times do |i|
    Product.create!(
        name: 'Producto #{i}',
        sku: 'SKUAEM#{i}',
        price: i * 1000,
        description: 'Esta es la descripción del producto #{i}',
        photo: "image_seed.webp",
        stock: 1,
        category_id: category.id
    )
end