xml = Builder::XmlMarkup.new(:indent=>0)
options = {
 :caption=>"Jobs Chart",
 :subcaption=>'Total Number of Currect Active Jobs: '+@jobs[:all_current].to_s,
 :yAxisName=>'Number of Jobs',
 :xAxisName=>'',
 :showValues=>'1',
 :formatNumberScale=>'0',
 :decimalPrecision=>'0',
 :numberSuffix=>' jobs'
}
xml.graph(options) do
  
  xml.categories do
    xml.category(:name=>'&lt; 3 months')
    xml.category(:name=>'3 -6 months')
    xml.category(:name=>'&gt; 6 months')
    xml.category(:name=>'All')
  end
  
  xml.dataset(:seriesName=>'New Jobs',:color=>''+get_fc_color) do
    xml.set(:value=>@jobs[:new_3])
    xml.set(:value=>@jobs[:new_6])
    xml.set(:value=>@jobs[:new_else])
    xml.set(:value=>@jobs[:all_current])
  end
  
  xml.dataset(:seriesName=>'Jobs Retained',:color=>''+get_fc_color) do
    xml.set(:value=>@jobs[:retained_3])
    xml.set(:value=>@jobs[:retained_6])
    xml.set(:value=>@jobs[:retained_else])
  end
  
  xml.dataset(:seriesName=>'Jobs Lost') do
    xml.set(:value=>@jobs[:lost_3])
    xml.set(:value=>@jobs[:lost_6])
    xml.set(:value=>@jobs[:lost_else])
    xml.set(:value=>@jobs[:all_lost])
  end
end