categories = []
@status_types.each do |status_type|
	instance_variable_set "@#{status_type.name.delete(' ').underscore}", []
end
@results_by_month.sort.each do |month, statuses|
	categories << month
	@status_types.each do |status_type|
		eval("@#{status_type.name.delete(' ').underscore} << #{statuses.find_all{|s| s.status_type_id == status_type.id}.collect(&:client).uniq.size}")
	end
end

colors = ['0000FF','00FF00','FF0000','0099CC','99CC00','CC0099','CCFFFF','FFCCFF','FFFFCC','CCCCFF','CCFFCC','FFCC66','3300CC','66FFCC','CC0033']

xml = Builder::XmlMarkup.new(:indent=>0)
total_count=0
options = {
 :caption=>"Unique Clients By Month and Status",
 :yAxisName=>'Number of Clients',
 :xAxisName=>'Date',
 :showValues=>'0',
 :rotateNames=>'1',
 :formatNumberScale=>'0',
 :decimalPrecision=>'0'
}

xml.graph(options) do
	xml.categories do
	  categories.each do |cat|
	      xml.category(:name=>cat.strftime("%B %Y")) do end
	  end
	end
	@status_types.each do |status_type|
		xml.dataset(:seriesname=>"#{status_type.name.titleize}", :color=>"#{cycle('0000FF','00FF00','FF0000','0099CC','99CC00','CC0099','CCFFFF','FFCCFF','FFFFCC','CCCCFF','CCFFCC','FFCC66','3300CC','66FFCC','CC0033')}") do
			eval("@#{status_type.name.delete(' ').underscore}.each {|amt| xml.set(:value=>amt) do end }")
		end
	end
end
