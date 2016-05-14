class Attachment < ActiveRecord::Base
  belongs_to :attachmentable, polymorphic: true  
  #belongs_to :answer
  mount_uploader :file, FileUploader
end
