class DropboxWorker
  include Sidekiq::Worker

  def perform(current_user_id, dropzone_id, drop_id)

  	require 'open-uri'

  	puts current_user_id
  	puts dropzone_id
  	puts drop_id


  	@user = User.find(current_user_id)

    client = Dropbox::API::Client.new :token => @user.dropbox_token, :secret => @user.dropbox_secret

    @dropzone = Dropzone.find(dropzone_id)
    @drop = @dropzone.drops.find(drop_id)

  	# puts client.account

    puts Dir.pwd

  	client.upload @drop.drop_filename, File.open(File.expand_path(Dir.pwd + "/public" + @drop.drop_url ), 'r').read
  end
end
