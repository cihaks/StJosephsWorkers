categories = []
all_contacts = []
@status_types.each do |status_type|
	instance_variable_set "@#{status_type.name.delete(' ').underscore}_contacts", []
end
@follows.each do |record|
	categories << record.contact_date
	all_contacts << record.all_contacts
	@status_types.each do |status_type|
		eval("@#{status_type.name.delete(' ').underscore}_contacts << record.#{status_type.name.delete(' ').underscore}_contacts")
	end
end

colors = ['0000FF','00FF00','FF0000','0099CC','99CC00','CC0099','CCFFFF','FFCCFF','FFFFCC','CCCCFF','CCFFCC','000000','660066','006666','666600']

xml = Builder::XmlMarkup.new(:indent=>0)
total_count=0
options = {
 :caption=>"Client Contacts By Date and Status",
 :yAxisName=>'Number of Contacts',
 :xAxisName=>'Date',
 :showValues=>'0',
 :rotateNames=>'1',
 :formatNumberScale=>'0',
 :decimalPrecision=>'0'
}

xml.graph(options) do
	xml.categories do
	  categories.each do |cat|
	      xml.category(:name=>cat) do end
	  end
	end
	xml.dataset(:seriesname=>'All Contacts', :color=>"000000") do
		all_contacts.each do |total_contact|
			xml.set(:value=>total_contact) do end
		end
	end
	@status_types.each do |status_type|
		xml.dataset(:seriesname=>"#{status_type.name.titleize}", :color=>"#{cycle('0000FF','00FF00','FF0000','0099CC','99CC00','CC0099','CCFFFF','FFCCFF','FFFFCC','CCCCFF','CCFFCC','FFCC66','3300CC','66FFCC','CC0033')}") do
			eval("@#{status_type.name.delete(' ').underscore}_contacts.each {|amt| xml.set(:value=>amt) do end }")
		end
	end
end
