xml = Builder::XmlMarkup.new(:indent=>0)
total_count=0
options = {
 :caption=>"HWP Intake By Month " + Time.now.year.to_s,
 :yAxisName=>'Number of HWP Intakes',
 :xAxisName=>'Months',
 :showValues=>'0',
 :formatNumberScale=>'0',
 :decimalPrecision=>'0'
}

xml.graph(options) do
  @hwp_months.each do |month, clicon|
      total_count = clicon.length
      xml.set(:name=>month.strftime("%B"), :value=>total_count)
  end
end