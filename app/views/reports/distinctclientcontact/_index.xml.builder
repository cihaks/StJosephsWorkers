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
  @disclientcontact_months.each do |month, clicon|
#      total_count = total_count + clicon.length
      total_count = clicon.length
      xml.set(:name=>month, :value=>total_count)
  end
end
