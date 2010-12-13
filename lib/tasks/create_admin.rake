
namespace :db do
  task :create_admin => :environment do
    
    desc "Clear existing data"
    
    [AddressType, AgencyType, Agency, BenefitsType, Industry, Company, Conviction, CrimeType, IncarcerationLength].each(&:delete_all)
    [JobType, Prison, ResourceType, StatusType, Substance, ContactType, Course, Race].each(&:delete_all)
    
		AddressType.create :name => "Primary Residence"
		AddressType.create :name => "Work"
		AddressType.create :name => "Mailing"
		AddressType.create :name => "Other"
		
    desc "populating agency types"
    agy_mental = AgencyType.create :name => 'Mental Health'
    agy_shelter = AgencyType.create :name => 'Shelter'
    agy_substance = AgencyType.create :name => 'Substance Abuse'
    
    desc "populating agencies"
    Agency.create :name => 'SW Behavioral', :agency_type => agy_mental
    Agency.create :name => 'Magellan / People of Color', :agency_type => agy_shelter
    Agency.create :name => 'Community Bridges', :agency_type => agy_mental
    Agency.create :name => 'Healthcare for the Homeless', :agency_type => agy_mental

    desc "populating benefit types"
    BenefitsType.create :name => 'After Probation Period'
    BenefitsType.create :name => 'Immediately'
    BenefitsType.create :name => 'None'
    BenefitsType.create :name => 'Possible'
    
    desc "populating companies"
    Company.create :name => 'Vangent', :description => 'Vangent'
		Company.create :name => 'Pro-em', :description => 'Pro-em'
		Company.create :name => 'All-Staff', :description => 'All-Staff'
		Company.create :name => 'Aramark', :description => 'Aramark'
		Company.create :name => 'Holsum', :description => 'Holsum'
		Company.create :name => 'Dunkin Donuts', :description => 'Dunkin Donuts'
		
    desc "populating contact types"
    ContactType.create :name => 'Client Contact'
    ContactType.create :name => 'Office Visit Only', :default_selection => false
		ContactType.create :name => 'Intake'
		
		desc "populating convictions"
		Conviction.create :name => 'Murder/Attempted Murder'
		Conviction.create :name => 'Robbery/Armed Robbery'
		Conviction.create :name => 'Theft/Burglary'
		Conviction.create :name => 'DUI'
		Conviction.create :name => 'Possession/Sales'
		Conviction.create :name => 'Domestic Violence'
		Conviction.create :name => 'Assault'
		Conviction.create :name => 'Sex Offense'
		Conviction.create :name => 'Forgery'
    
    desc "populating courses"
    Course.create :name => 'Job Readiness Workshop'
    Course.create :name => 'WIRC'
    
    desc "populating crime types"
    CrimeType.create :name => 'Felony'
    CrimeType.create :name => 'Sex Offense'
    CrimeType.create :name => 'Violent'
		CrimeType.create :name => 'Misdemeanor'

		desc "populating education"
		Education.create :name => 'No High School/GED', :list_order => 1
		Education.create :name => 'High School/GED', :list_order => 2
		Education.create :name => 'Trade School', :list_order => 3
		Education.create :name => 'Some College', :list_order => 4
		Education.create :name => 'College', :list_order => 5
		Education.create :name => 'Master\'s Degree', :list_order => 6
		Education.create :name => 'PhD', :list_order => 7
    
    desc "populating incarceration lengths"
    IncarcerationLength.create :name => '< 1 month', :list_order => 1
    IncarcerationLength.create :name => '1 - 12 months', :list_order => 2
    IncarcerationLength.create :name => '1 - 5 years', :list_order => 3
    IncarcerationLength.create :name => '5 - 10 years', :list_order => 4
    IncarcerationLength.create :name => '10 - 15 years', :list_order => 5
    IncarcerationLength.create :name => '15 - 20 years', :list_order => 6
    IncarcerationLength.create :name => '> 20 years', :list_order => 7
    
    desc "populating industries"
    Industry.create :name => 'Administrative', :description => 'Administrative'			
    Industry.create :name => 'Custodial/Maintenance', :description => 'Custodial/Maintenance'
    Industry.create :name => 'Customer Service', :description => 'Customer Service'
    Industry.create :name => 'Driving', :description => 'Driving'
    Industry.create :name => 'General', :description => 'General'
    Industry.create :name => 'Healthcare', :description => 'Healthcare'
    Industry.create :name => 'Hospital', :description => 'Hospitality'
    Industry.create :name => 'Security', :description => 'Security'
    Industry.create :name => 'Trades', :description => 'Trades'
    Industry.create :name => 'Warehouse', :description => 'Warehouse'				
    
    desc "populating job types"
    JobType.create :name => 'Full-Time Permanent'
    JobType.create :name => 'Full-Time Temporary'
    JobType.create :name => 'Part-Time Permanent'
    JobType.create :name => 'Part-Time Temporary'
    JobType.create :name => 'Seasonal'
    JobType.create :name => 'Temp to Hire'
    
    desc "populating prisons"
    Prison.create :name => 'County Jail'
    Prison.create :name => 'In-State Penitentiary'
    Prison.create :name => 'Out-of-State Penitentiary'
    Prison.create :name => 'Federal Penitentiary'
    
    desc "populating races"
    Race.create :name => 'African American'
    Race.create :name => 'Asian'
    Race.create :name => 'Caucasian'
    Race.create :name => 'Hispanic'
    Race.create :name => 'Native American'
    Race.create :name => 'Other'
    
    desc "populating resource types"
    dailypass = ResourceType.create :name => 'Bus - Daily Pass', :type_name => 'daily_pass'
    monthlypass = ResourceType.create :name => 'Bus - Monthly Pass', :type_name => 'monthly_pass'
    clothing = ResourceType.create :name => 'Clothing', :type_name => 'clothing'
    ResourceType.create :name => 'CVM - Community Voice Mail', :type_name => 'voice_mail'
    housing = ResourceType.create :name => 'Financial Assist: Housing Related'
    work = ResourceType.create :name => 'Financial Assist: Work Essentials'
    ResourceType.create :name => 'Hygiene', :type_name => 'hygiene'
    shoes = ResourceType.create :name => 'Shoes'
    boots = ResourceType.create :name => 'Work Boots'
		
    desc "populating shelters"
    Shelter.create :name => 'Andre House'
    Shelter.create :name => 'CASS'
    Shelter.create :name => 'EVMC'
    Shelter.create :name => 'Friend/Family'
    Shelter.create :name => 'MOS'
    Shelter.create :name => 'Phoenix Resource Mission'
    Shelter.create :name => 'UMOM'
    Shelter.create :name => 'WOF'
		
    desc "populating status types"
		StatusType.create :name => 'Follow-Up' #dup
		StatusType.create :name => 'HWP' #dup
		StatusType.create :name => 'Parole' #dup
		StatusType.create :name => 'Previous Felon' #dup
		StatusType.create :name => 'Previously Incarcerated' #dup
		StatusType.create :name => 'Probation' #dup
		StatusType.create :name => 'Success Story' #dup
		StatusType.create :name => 'WIRC' #dup
		StatusType.create :name => 'Caution' #new
		StatusType.create :name => 'Chronic Homelessness' #new
		StatusType.create :name => 'Resource Eligible' #new
		res_clothing = StatusType.create :name => 'Restrict Clothing',:category=>'Resource' #new
		res_financial = StatusType.create :name => 'Restrict Financial',:category=>'Resource' #new
		res_trans = StatusType.create :name => 'Restrict Transportation',:category=>'Resource' #new
		StatusType.create :name => 'Veteran' #new
		
		desc "update resource types"
		dailypass.status_type = res_trans
		dailypass.save
		monthlypass.status_type = res_trans
		monthlypass.save
		clothing.status_type = res_clothing
		clothing.save
		housing.status_type = res_financial
		housing.save
		work.status_type = res_financial
		work.save
		shoes.status_type = res_clothing
		shoes.save
		
		
    desc "populating substances"
    Substance.create :name => 'Alcohol'
    Substance.create :name => 'Cocaine'
    Substance.create :name => 'Crack'
    Substance.create :name => 'Heroin'
    Substance.create :name => 'Marijuana'
    Substance.create :name => 'Methamphetamine'

		desc "populating work histories"
		WorkHistory.create :name => 'Stable/Consistent'
		WorkHistory.create :name => 'Gaps'
		WorkHistory.create :name => 'Never Employed'
    
  end
end
