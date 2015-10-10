json.array!(@budget_items) do |budget_item|
  json.extract! budget_item, :id, :date, :project_id, :development_metres, :rehab_metres
  json.url budget_item_url(budget_item, format: :json)
end
