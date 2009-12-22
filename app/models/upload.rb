class Upload < ActiveRecord::Base
  belongs_to :user
  belongs_to :archive

  acts_as_taggable
  acts_as_voteable
  acts_as_commentable

  has_attached_file :upload

  validates_attachment_presence :upload

  delegate :can_be_read_by?, :to => :archive

  unless Tog::Plugins.settings(:tog_archive, 'search.skip_indices')
    define_index do
      indexes title
      indexes description
      indexes upload_file_name
      has archive(:privacy), :as => :privacy
    end

    def self.site_search(query, options={})
      self.search query, :with => { :privacy => Archive::PUBLIC }
    end
  end

end
