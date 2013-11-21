json.array!(@dropzones) do |dropzone|
  json.extract! dropzone, :name
  json.url dropzone_url(dropzone, format: :json)
end
