json.extract! listing, :id, :name, :description, :power, :product_no, :price, :created_at, :updated_at
json.url listing_url(listing, format: :json)
