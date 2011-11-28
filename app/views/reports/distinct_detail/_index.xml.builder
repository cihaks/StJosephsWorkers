xml = Builder::XmlMarkup.new(:indent=>0)
total_count=0
options = {
 :caption=>"Distinct Client Contacts By Month " + Time.now.year.to_s,
 :yAxisName=>'Number of Distinct Clients Contacted',
 :xAxisName=>'Months',
 :showValues=>'0',
 :formatNumberScale=>'0',
 :decimalPrecision=>'0'
}

xml.graph(options) do
	@disclientdetail.group_by{ |r| r.contact_date.beginning_of_month }.sort.each do |contact_month, clients|
		xml.set(:name=>contact_month.strftime("%b %Y"), :value=>clients.size)
	end
end
