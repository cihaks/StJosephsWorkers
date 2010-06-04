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
