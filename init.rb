require_plugin 'tog_core'

require 'i18n' unless defined?(I18n)
Dir[File.dirname(__FILE__) + '/locale/**/*.yml'].each do |file|
  I18n.load_path << file
end

Tog::Interface.sections(:site).add 'archives', '/archives' 
Tog::Interface.sections(:member).add 'archives', '/member/archives' 

Tog::Search.sources << 'Upload'
