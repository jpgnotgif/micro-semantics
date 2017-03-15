json.extract! product, :id, :name, :image_url, :manufacturer, :model, :term, :created_at, :updated_at
json.url product_url(product, format: :json)
