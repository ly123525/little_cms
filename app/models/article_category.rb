class ArticleCategory < ApplicationRecord
  has_many :articles, :dependent => :destroy
  acts_as_nested_set
  mount_uploader :image, PageUploader
  validates :name, :presence => true
  has_one :seo, as: :seoable, :dependent => :destroy
  accepts_nested_attributes_for :seo, :allow_destroy => true, :reject_if => :all_blank

  def self.index_templates
    Template.where(:content_type=>4)
  end

  def self.show_templates
    Template.where(:content_type=>5)
  end

  def category_template_file_name
    Template.find_by(:id=> self.scope_index).try(:file_name)
  end

  def article_template_file_name
    Template.find_by(:id=> self.scope_show).try(:file_name)
  end
end
