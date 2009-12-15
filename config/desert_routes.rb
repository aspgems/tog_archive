# Add your custom routes here.  If in config/routes.rb you would 
# add <tt>map.resources</tt>, here you would add just <tt>resources</tt>

resources :archives, :only => [:index, :show] do |archive|
  archive.resources :uploads, :collection => { :tags => :get }
end

namespace(:member) do |member|
  member.resources :archives do |archive|
    archive.resources :uploads
  end
end
