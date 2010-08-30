# == Schema Information
# Schema version: 20100604003228
#
# Table name: pictures
#
#  id                 :integer(4)      not null, primary key
#  client_id          :integer(4)
#  picture            :binary
#  created_at         :datetime
#  updated_at         :datetime
#  creator_id         :integer(4)
#  updater_id         :integer(4)
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer(4)
#

class Picture < ActiveRecord::Base
  belongs_to :client
  has_attached_file :photo
#  ,
#    :styles => {
#      :thumb=> "100x100#",
#      :small  => "150x150>",
#      :medium => "300x300>",
#      :large =>   "400x400>" }
end
