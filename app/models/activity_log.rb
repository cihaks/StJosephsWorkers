# == Schema Information
# Schema version: 20100912050644
#
# Table name: activity_logs
#
#  id         :integer(4)      not null, primary key
#  client_id  :integer(4)
#  model_id   :integer(4)
#  action     :string(255)
#  model_name :string(255)
#  created_at :datetime
#  updated_at :datetime
#  creator_id :integer(4)
#  updater_id :integer(4)
#

class ActivityLog < ActiveRecord::Base
  
  def activity
    words = User.find(creator_id).name unless creator_id.nil?
    words = "Unknown User" if creator_id.nil?
    words = words+" "+action
    words = words+" on "+created_at.strftime("%m/%d/%y") unless created_at.nil?
    words
  end
  
  def self.search(search_id, list_limit)
    ActivityLog.find(:all,
                     :limit=>list_limit, 
                     :conditions=>["client_id = ?",search_id], 
                     :group=>"action, model_name, date(created_at)", 
                     :order=>"created_at desc")
             
  end
end
