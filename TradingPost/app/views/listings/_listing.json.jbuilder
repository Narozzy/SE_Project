json.extract! listing, :id, :isbn, :product_type, :created_at, :updated_at
json.url listing_url(listing, format: :json)
