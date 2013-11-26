class DropsController < ApplicationController


  # POST /drops
  # POST /drops.json
  def create
    @dropzone = Dropzone.find(drop_params[:dropzone])

    # @dropzone.drops = [ Drop.new(drop_params[:drop_filename]) ]
    # @dropzone.drops.new(drop_filename: "Violator!")
    @drop = @dropzone.drops.new drop: drop_params[:drop]

    respond_to do |format|
      if @drop.save
        format.html { redirect_to @dropzone, notice: 'Drop was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dropzone }
        DropboxWorker.perform_async(current_user._id.to_s, @dropzone._id.to_s, @drop._id.to_s)
      else
        format.html { render action: 'new' }
        format.json { render json: @dropzone.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def drop_params
      params.require(:drop).permit(:attachment, :drop, :drops, :attachments, :dropzone, :_id, :_id_cache, :drop_filename, :drop_cache, :filename, :drop_file)
    end
end
