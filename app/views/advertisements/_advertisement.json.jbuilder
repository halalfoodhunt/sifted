json.extract! advertisement, :id, :name, :commencement_date, :expiry_date, :publish, :created_at, :updated_at
json.url advertisement_url(advertisement, format: :json)