module AssignedResourcesHelper
  def fields_for_daily_pass(&block)
    prefix = "my" #@assigned_resource.daily_pass.nil? ? "new" : "update"
    object = @assigned_resource.new_record? ? @assigned_resource.build_daily_pass : @assigned_resource.daily_pass.nil? ? @assigned_resource.build_daily_pass : @assigned_resource.daily_pass
    fields_for("assigned_resource[#{prefix}_daily_pass][]", object, &block)
  end
end
