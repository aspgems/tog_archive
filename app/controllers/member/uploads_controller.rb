class Member::UploadsController < Member::BaseController

  before_filter :find_archive

  def index
    @uploads = @archive.uploads.paginate(pagination_options)
  end

  def new
    @upload = @archive.uploads.new
  end

  def edit
    @upload = @archive.uploads.find(params[:id])
  end

  def create
    @upload = @archive.uploads.build(params[:upload])
    respond_to do |format|
      if @upload.save
        format.html do
          flash[:ok] = t('member.uploads.messages.created')
          redirect_to member_archive_uploads_url(@archive)
        end
      else
        format.html do
          flash[:error] = t('member.uploads.messages.error_on_create')
          render :action => 'new'
        end
      end
    end
  end

  def update
    @upload = @archive.uploads.find(params[:id])
    respond_to do |format|
      if @upload.update_attributes(params[:upload])
        format.html do
          flash[:ok] = t('member.uploads.messages.updated')
          redirect_to member_archive_uploads_url(@archive)
        end
      else
        format.html do
          flash[:error] = t('member.uploads.messages.error_on_update')
          render :action => 'edit'
        end
      end
    end
  end

  def destroy
    @upload = @archive.uploads.find(params[:id])
    respond_to do |format|
      if @upload.destroy
        format.html do
          flash[:ok] = t('member.uploads.messages.deleted')
          redirect_to member_archive_uploads_url(@archive)
        end
      else
        format.html do
          flash[:error] = t('member.uploads.messages.error_on_delete')
          redirect_to member_archive_uploads_url(@archive)
        end
      end
    end
  end

  private
    def find_archive
      @archive = Archive.find(params[:archive_id])
    end

end
