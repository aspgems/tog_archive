class ArchivesController < ApplicationController

  def index
    @archives = Archive.readable_by(current_user).
      paginate(pagination_options)
    respond_to do |format|
      format.html
      format.xml { render :xml => @archives }
    end
  end

end
