class Member::ArchivesController < Member::BaseController

  def index
    @archives = current_user.archives.paginate(pagination_options)
  end

  def new
    @archive = current_user.archives.new
  end

  def edit
    @archive = current_user.archives.find(params[:id])
  end

  def create
    @archive = current_user.archives.build(params[:archive])
    respond_to do |format|
      if @archive.save
        format.html do 
          flash[:ok] = t('member.archives.messages.created')
          redirect_to member_archives_url
        end
      else
        format.html do
          flash[:error] = t('member.archives.messages.error_on_create')
          render :action => 'new'
        end
      end
    end
  end

  def update
    @archive = current_user.archives.find(params[:id])
    respond_to do |format|
      if @archive.update_attributes(params[:archive])
        format.html do 
          flash[:ok] = t('member.archives.messages.updated')
          redirect_to member_archives_url
        end
      else
        format.html do
          flash[:error] = t('member.archives.messages.error_on_update')
          render :action => 'edit'
        end
      end
    end
  end

  def destroy
    @archive = current_user.archives.find(params[:id])
    respond_to do |format|
      if @archive.destroy
        format.html do
          flash[:ok] = t('member.archives.messages.deleted')
          redirect_to member_archives_url
        end
      else
        format.html do
          flash[:error] = t('member.archives.messages.error_on_delete')
          redirect_to member_archives_url
        end
      end
    end
  end

end
