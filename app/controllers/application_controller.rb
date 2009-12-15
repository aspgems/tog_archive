class ApplicationController < ActionController::Base
  def pagination_options
    @page  = params[:page] || 1
    @order = params[:order] || 'created_at'
    @asc   = params[:asc] || 'desc'
    { :page     => @page,
      :order    => @order + ' ' + @asc,
      :per_page => 10 }
  end
end
