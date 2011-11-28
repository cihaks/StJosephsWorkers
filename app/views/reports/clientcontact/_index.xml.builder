xml = Builder::XmlMarkup.new(:indent=>0)
total_count=0
options = {
 :caption=>"Client Contacts By Month " + Time.now.year.to_s,
 :yAxisName=>'Number of Clients Contacted',
 :xAxisName=>'Months',
 :showValues=>'0',
 :rotateNames=>'1',
 :formatNumberScale=>'0',
 :decimalPrecision=>'0'
}
months = []
all_contacts = []
contacts_by_type = {}
ContactType.all.each do |contact_type|
	contacts_by_type["#{contact_type.id}"] = []
end

@clientcontact_months.each do |month, contacts_by_month|
  months << month
	all_contacts << contacts_by_month.size
	ContactType.all.each do |contact_type|
		contacts_by_type["#{contact_type.id}"] << contacts_by_month.find_all{|c| c.contact_type_id == contact_type.id}.size
	end
end


xml.graph(options) do
	xml.categories do
	  months.each do |month|
	      xml.category(:name=>month.strftime("%B %Y")) do end
	  end
	end
	xml.dataset(:seriesname=>'All Contacts', :color=>"000000") do
		all_contacts.each do |total_contact|
			xml.set(:value=>total_contact) do end
		end
	end
	ContactType.all.each do |contact_type|
		xml.dataset(:seriesname=>"#{contact_type.name.titleize}", :color=>"#{cycle('0000FF','00FF00','FF0000','0099CC','99CC00','CC0099','CCFFFF','FFCCFF','FFFFCC','CCCCFF','CCFFCC','FFCC66','3300CC','66FFCC','CC0033')}") do
			contacts_by_type["#{contact_type.id}"].each {|amt| xml.set(:value=>amt) do end }
		end
	end
end
