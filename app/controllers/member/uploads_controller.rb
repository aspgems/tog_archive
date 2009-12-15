class Member::UploadsController < Member::BaseController

  before_filter :find_archive

  def new
    @upload = @archive.uploads.new
  end

  def create
    @upload = @archive.uploads.build(params[:upload])
    if @upload.save
      respond_to do |format|
        format.html do
          flash[:ok] = t('uploads.messages.created')
          redirect_to member_archive_uploads_url(@archive)
        end
      end
    end
  end

  def edit
    @upload = @archive.uploads.find(params[:id])
  end

  def destroy
    @upload = @archive.uploads.find(params[:id])
    if @upload.destroy
      respond_to do |format|
        format.html do
          flash[:ok] = t('uploads.messages.deleted')
          redirect_to member_archive_uploads_url(@archive)
        end
      end
    end
  end

  def index
    @uploads = @archive.uploads.paginate(pagination_options)
  end

  private
    def find_archive
      @archive = Archive.find(params[:archive_id])
    end

end
