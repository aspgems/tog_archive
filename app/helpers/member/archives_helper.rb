module Member::ArchivesHelper
  def privacy_select_options
    [[ t('.public'), Archive::PUBLIC ],
     [ t('.friends'), Archive::FRIENDS ],
     [ t('.private'), Archive::PRIVATE ]]
  end
end
