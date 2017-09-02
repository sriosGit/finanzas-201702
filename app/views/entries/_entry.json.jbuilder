json.extract! entry, :id, :member_id, :amount, :entry_type, :created_at, :updated_at
json.url entry_url(entry, format: :json)
