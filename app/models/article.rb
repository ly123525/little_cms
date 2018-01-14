class Article < ApplicationRecord
  belongs_to :article_category
  mount_uploader :image,PageUploader
  validates :title, :content, :presence => true
  has_one :seo, as: :seoable, :dependent => :destroy
  accepts_nested_attributes_for :seo, :allow_destroy => true, :reject_if => :all_blank
  def self.show_templates
    Template.where(:content_type => 5)
  end



  def article_show_template_file_name
    Template.find_by(:id=> self.scope_show).try(:file_name)
  end

end
