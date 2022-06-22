# frozen_string_literal: true

require 'application_system_test_case'

class ShoppingCartsTest < ApplicationSystemTestCase
  setup do
    @shopping_cart = shopping_carts(:one)
  end

  test 'visiting the index' do
    visit shopping_carts_url
    assert_selector 'h1', text: 'Shopping Carts'
  end

  test 'creating a Shopping cart' do
    visit shopping_carts_url
    click_on 'New Shopping Cart'

    fill_in 'Order', with: @shopping_cart.order_id
    fill_in 'Product', with: @shopping_cart.product_id
    fill_in 'Quantity', with: @shopping_cart.quantity
    click_on 'Create Shopping cart'

    assert_text 'Shopping cart was successfully created'
    click_on 'Back'
  end

  test 'updating a Shopping cart' do
    visit shopping_carts_url
    click_on 'Edit', match: :first

    fill_in 'Order', with: @shopping_cart.order_id
    fill_in 'Product', with: @shopping_cart.product_id
    fill_in 'Quantity', with: @shopping_cart.quantity
    click_on 'Update Shopping cart'

    assert_text 'Shopping cart was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Shopping cart' do
    visit shopping_carts_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Shopping cart was successfully destroyed'
  end
end
