class Page < ApplicationRecord
validates :name, :image, :presence=>true
validates :content, presence: true, :if=>'check_scope'
validates :scope, presence: true, :if=>'check_content'
mount_uploader :image, PageUploader
def  self.page_templates
  Template.where(:content_type => 3)
end

def page_template_file_name
  Template.find_by(:id=>self.scope).try(:file_name)
end

private
def check_scope
  self.scope.blank?
end

def check_content
  self.content.blank?
end
end
