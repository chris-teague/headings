json.array!(@staffs) do |staff|
  json.extract! staff, :id, :project_id, :first_name, :last_name, :email, :phone, :role
  json.url staff_url(staff, format: :json)
end
