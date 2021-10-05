json.extract! product, :id, :name, :sku, :descriptions, :photo, :stok, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)
