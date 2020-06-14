json.blood_types do
  json.array! @blood_types, partial: "api/blood_types/blood_type", as: :blood_type
end
