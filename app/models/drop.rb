class Drop
  include Mongoid::Document
  # attr_accessible :drop_file, :drop_file_cache
  # mount_uploader :drop_file, DropUploader
  mount_uploader :drop, DropUploader, mount_on: :drop_filename
  embedded_in :dropzone
end
