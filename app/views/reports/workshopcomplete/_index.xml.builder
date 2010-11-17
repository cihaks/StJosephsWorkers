xml = Builder::XmlMarkup.new(:indent=>0)
total_count=0
options = {
 :caption=>"Workshops Complete " + Time.now.year.to_s,
 :yAxisName=>'Number of Workshops Complete',
 :xAxisName=>'Months',
 :showValues=>'0',
 :formatNumberScale=>'0',
 :decimalPrecision=>'0'
}

xml.graph(options) do
  @workshopcomplete_months.each do |month, xx|
      total_count = xx.length
      xml.set(:name=>month.strftime("%B"), :value=>total_count)
  end
end
