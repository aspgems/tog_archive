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
    if @archive.save
      flash[:ok] = t('archives.messages.created')
      redirect_to member_archives_url
    end
  end

end
