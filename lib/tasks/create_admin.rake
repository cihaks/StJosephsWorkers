
namespace :db do
  task :create_admin => :environment do
    
    desc "Clear existing data"
    
    [AgencyType, Agency, BenefitsType, Industry, Company, CrimeType, IncarcerationLength].each(&:delete_all)
    [JobType, Prison, ResourceType, StatusType, Substance, ContactType, Course, Race].each(&:delete_all)
    
    desc "populating agency types"
    AgencyType.create :name => 'Mental Health'
    agency_type = AgencyType.create :name => 'Shelter'
    AgencyType.create :name => 'Substance Abuse'
    
    desc "populating agencies"
    Agency.create :name => 'SW Behavioral'
    Agency.create :name => 'Magellan / People of Color'
    Agency.create :name => 'Community Bridges'
    Agency.create :name => 'Healthcare for the Homeless'

    desc "populating shelters"
    Shelter.create :name => 'Andre House'
    Shelter.create :name => 'CASS'
    Shelter.create :name => 'EVMC'
    Shelter.create :name => 'Friend/Family'
    Shelter.create :name => 'MOS'
    Shelter.create :name => 'Phoenix Resource Mission'
    Shelter.create :name => 'UMOM'
    Shelter.create :name => 'WOF'

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
    
    desc "populating courses"
    Course.create :name => 'Job Readiness Workshop'
    Course.create :name => 'WIRC'
    
    desc "populating crime types"
    CrimeType.create :name => 'Felony'
    CrimeType.create :name => 'Sex Offense'
    CrimeType.create :name => 'Violent'

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
    ResourceType.create :name => 'Bus - Daily Pass', :type_name => 'daily_pass'
    ResourceType.create :name => 'Bus - Monthly Pass', :type_name => 'monthly_pass'
    ResourceType.create :name => 'Clothing', :type_name => 'clothing'
    ResourceType.create :name => 'CVM - Community Voice Mail', :type_name => 'voice_mail'
    ResourceType.create :name => 'Financial Assist: Housing Related'
    ResourceType.create :name => 'Financial Assist: Work Essentials'
    ResourceType.create :name => 'Hygiene', :type_name => 'hygiene'
    ResourceType.create :name => 'Shoes'
    ResourceType.create :name => 'Work Boots'
    
    desc "populating status types"
    StatusType.create :name => 'Follow-Up'
    StatusType.create :name => 'HWP'
    StatusType.create :name => 'Parole'
    StatusType.create :name => 'Previously Incarcerated'
    StatusType.create :name => 'Previous Felon'
    StatusType.create :name => 'Probation'
    StatusType.create :name => 'Success Story'
    StatusType.create :name => 'WIRC'
    
    desc "populating substances"
    Substance.create :name => 'Alcohol'
    Substance.create :name => 'Cocaine'
    Substance.create :name => 'Crack'
    Substance.create :name => 'Heroin'
    Substance.create :name => 'Marijuana'
    Substance.create :name => 'Methamphetamine'
    
  end
end
