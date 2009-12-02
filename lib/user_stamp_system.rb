module UserStampSystem
  protected
  
  def updatedby  
    if nil != @current_user && self.respond_to?(:updated_by) 
      self[ :updated_by] = current_user.id
    end
  end

  def createdby  
    if nil != @current_user && self.respond_to?(:created_by) 
      self[ :created_by] = current_user.id
    end
    updatedby
  end
   
end