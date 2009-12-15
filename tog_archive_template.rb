plugin 'tog_archive', :git => "git://github.com/aspgems/tog_archive.git"

route "map.routes_from_plugin 'tog_archive'"

generate "update_tog_migration"

rake "db:migrate"
