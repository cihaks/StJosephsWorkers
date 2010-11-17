xml = Builder::XmlMarkup.new(:indent=>0)
total_count=0
options = {
 :caption=>"Incarcerations By Month " + Time.now.year.to_s,
 :yAxisName=>'Number of Incarcerated',
 :xAxisName=>'Months',
 :showValues=>'0',
 :formatNumberScale=>'0',
 :decimalPrecision=>'0'
}

xml.graph(options) do
  @incarcerations_months.each do |month, incars|
      total_count = total_count + incars.length
      xml.set(:name=>month.strftime("%B"), :value=>total_count)
  end
end


