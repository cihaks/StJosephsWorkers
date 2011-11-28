class ConvertStatusType < ActiveRecord::Migration
  def self.up
		new_obj = AssignedStatusType.find_by_sql("select * from clients_status_types")
		new_obj.each do |old_status|
			old_status.start_date = Date.today unless Date.today > (old_status.start_date.nil? ? Date.tomorrow : old_status.start_date)
			AssignedStatusType.create :client_id=>old_status.client_id, 
																:status_type_id=>old_status.status_type_id, 
																:start_date=>old_status.start_date, 
																:end_date=>old_status.end_date
		end
		
		drop_table :clients_status_types
  end

  def self.down
		create_table :clients_status_types, :id=>false do |t|
			t.references :client
			t.references :status_type
			t.date :start_date, :end_date
			t.timestamps
			t.userstamps
		end
			
		AssignedStatusType.all.each do |new_status|
			if new_status.end_date.nil?
				new_status.creator_id = 1 if new_status.creator_id.nil?
				new_status.updater_id = 1 if new_status.updater_id.nil?
				new_status.created_at = 1 if new_status.created_at.nil?
				new_status.updated_at = 1 if new_status.updated_at.nil?
				new_status.start_date = Date.today if new_status.start_date.nil?
				sql = "insert into clients_status_types (client_id, status_type_id, start_date, created_at, updated_at, creator_id, updater_id) values (#{new_status.client_id}, #{new_status.status_type_id}, '#{new_status.start_date}', '#{new_status.created_at}', '#{new_status.updated_at}', #{new_status.creator_id}, #{new_status.updater_id});"
				ActiveRecord::Base.establish_connection
				ActiveRecord::Base.connection.execute(sql)
			end
		end
		
		AssignedStatusType.all.each { |x| x.delete }
  end
end
