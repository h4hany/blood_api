json.donors do
  json.array! @donors, partial: "api/users/donor", as: :donor
end