class UpdateClientObserver < ActiveRecord::Observer
  
  observe :address,:picture,:phone,:contact,:assigned_resource,:registered_class,:used_substance,:crime_sentence,:assigned_agency,:job,:app_interview
  
  def before_save(record)
    if record.new_record?
      @action = "added a new "+record.class.name.underscore.humanize.downcase
    else
      @action = "updated "+record.class.name.underscore.humanize.downcase
    end
  end
  
  def before_destroy(record)
    @action = "deleted "+record.class.name.underscore.humanize.downcase
  end
  
  def after_save(record)
    if !record.client.nil?
      record.client.updated_at = Time.now
      record.client.save
      generate_log(record)
    end
  end
  
  def after_destroy(record)
    if !record.client.nil?
      generate_log(record)
    end
  end
  
  def generate_log(record)
    ActivityLog.create :action=>@action, :model_name=>record.class.name, :client_id => record.client_id, :model_id => record.id
  end
end
