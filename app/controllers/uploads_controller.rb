class UploadsController < ApplicationController
  
  before_filter :find_archive

  def index
    @uploads = @archive.uploads.paginate(pagination_options)
  end

  def show
    @upload = @archive.uploads.find(params[:id])
  end

  def tags
    Tag.find(params[:tag])
    # TODO: show per user or archive tagged items?
  end

  private
    def find_archive
      @archive = Archive.find(params[:archive_id])
    end

end
