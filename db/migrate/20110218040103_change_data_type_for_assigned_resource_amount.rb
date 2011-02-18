class ChangeDataTypeForAssignedResourceAmount < ActiveRecord::Migration
  def self.up
		change_table :assigned_resources do |t|
			t.change :amount, :float
		end
  end

  def self.down
		# do not convert back - this may cause a loss of data 
  end
end
