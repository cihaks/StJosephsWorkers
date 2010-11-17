xml = Builder::XmlMarkup.new(:indent=>0)
total_count=0
options = {
 :caption=>"WIRC Intake By Month " + Time.now.year.to_s,
 :yAxisName=>'Number of WIRC Intakes',
 :xAxisName=>'Months',
 :showValues=>'0',
 :formatNumberScale=>'0',
 :decimalPrecision=>'0'
}

xml.graph(options) do
  @wirc_months.each do |month, clicon|
      total_count = clicon.length
      xml.set(:name=>month.strftime("%B"), :value=>total_count)
  end
end