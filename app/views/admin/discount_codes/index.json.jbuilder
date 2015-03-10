json.array!(@discount_codes) do |discount_code|
  json.extract! discount_code, :id, :code, :discount_percentage, :slug, :valid_until
  json.url discount_code_url(discount_code, format: :json)
end
