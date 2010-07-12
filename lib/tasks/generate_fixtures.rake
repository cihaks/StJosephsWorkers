
namespace :db do
  desc 'Create YAML test fixtures from data in an existing database.  
  Defaults to development database. Set RAILS_ENV to override.'

  task :extract_fixtures => :environment do
    sql = "SELECT * FROM %s"
    ActiveRecord::Base.establish_connection
		limit = ENV['LIMIT_ROWS'] ? ENV['LIMIT_ROWS'].to_i : 0
		sql_suffix = limit > 0 ? " limit #{limit}" : ""
		sql = sql + sql_suffix
    skip_tables = ENV['SKIP_FIXTURES'] ? ENV['SKIP_FIXTURES'].split(/,/)+["schema_info", "sessions"] : ["schema_info", "sessions"]
    tables = ENV['FIXTURES'] ? ENV['FIXTURES'].split(/,/) - skip_tables : ActiveRecord::Base.connection.tables - skip_tables
		skip_columns = ["created_at", "updated_at", "creator_id", "updater_id"]
    tables.each do |table_name|
      i = "000"
      File.open("#{RAILS_ROOT}/test/fixtures/#{table_name}.yml", 'w') do |file|
        data = ActiveRecord::Base.connection.select_all(sql % table_name)
        file.write data.inject({}) { |hash, record|
					skip_columns.each do |col|
						record.delete(col)
					end
          hash["#{table_name.singularize}_id_#{record['id']}"] = record
          hash
        }.to_yaml
      end
			puts "'#{table_name}' complete"
    end
  end
end
