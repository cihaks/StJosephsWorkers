
namespace :db do
  task :create_admin => :environment do
    require 'populator'
    require 'faker'
    require 'digest/sha1'
    
    desc "Clear existing data"
    
    ActiveRecord::Base.connection.execute("DELETE FROM roles_users")
    [Role, User].each(&:delete_all)
    [AgencyType, Agency, BenefitType, Prison, Industry, CrimeType, IncarcerationLength].each(&:delete_all)
    [JobType, Prison, ResourceType, StatusType, Substance, ContactType, Course, Race].each(&:delete_all)
    
    desc "creating roles and users"
    Role.populate 1 do |roleAdmin|
      roleAdmin.name = 'admin'
      
      User.populate 1 do |user|
        user.login = 'cihaks'
        user.name = 'Stephen Cihak'
        user.salt = make_token
        user.crypted_password = password_digest('password',user.salt)
        ActiveRecord::Base.connection.execute("INSERT INTO roles_users (role_id,user_id) VALUES (#{roleAdmin.id}, #{user.id})")
      end
    end
    adminuser = User.find_by_login('cihaks')
    
    Role.populate 1 do |roleOffice|
      roleOffice.name = 'office'
      User.populate 1 do |user|
        fname = Faker::Name.first_name
        lname = Faker::Name.last_name
        user.name = fname + ' ' + lname
        user.login = 'guest'
        user.salt = make_token
        user.crypted_password = password_digest('password',user.salt)
        ActiveRecord::Base.connection.execute("INSERT INTO roles_users (role_id,user_id) VALUES (#{roleOffice.id}, #{user.id})")
      end
      User.populate 4..8 do |user|
        fname = Faker::Name.first_name
        lname = Faker::Name.last_name
        user.name = fname + ' ' + lname
        user.login = Faker::Internet.user_name(fname.downcase+"_"+lname.downcase)
        user.salt = make_token
        user.crypted_password = password_digest('password',user.salt)
        ActiveRecord::Base.connection.execute("INSERT INTO roles_users (role_id,user_id) VALUES (#{roleOffice.id}, #{user.id})")
      end
    end
    
#    User.create(:login=>"crosslr2",:name=>"Rob Crossley",:password=>"crossley")
    
    desc "populating benefit types"
    BenefitType.create :name => 'After Probation Period'
    BenefitType.create :name => 'Immediately'
    BenefitType.create :name => 'None'
    BenefitType.create :name => 'Possible'
    
    desc "populating job types"
    JobType.create :name => 'Full-Time Permanent'
    JobType.create :name => 'Full-Time Temporary'
    JobType.create :name => 'Part-Time Permanent'
    JobType.create :name => 'Part-Time Temporary'
    JobType.create :name => 'Seasonal'
    JobType.create :name => 'Temp to Hire'
    
    desc "populating status types"
    StatusType.create :name => 'Follow-Up'
    StatusType.create :name => 'HWP'
    StatusType.create :name => 'Parole'
    StatusType.create :name => 'Previously Incarcerated'
    StatusType.create :name => 'Previous Felon'
    StatusType.create :name => 'Probation'
    StatusType.create :name => 'Success Story'
    StatusType.create :name => 'WIRC'
    
    desc "populating prisons"
    Prison.create :name => 'County Jail'
    Prison.create :name => 'In-State Penitentary'
    Prison.create :name => 'Out-of-State Penitentary'
    Prison.create :name => 'Federal Penitentary'
    
    desc "populating crime types"
    CrimeType.create :name => 'Felony'
    CrimeType.create :name => 'Sex Offense'
    CrimeType.create :name => 'Violent'
    
    desc "populating incarceration lengths"
    IncarcerationLength.create :name => '< 1 month'
    IncarcerationLength.create :name => '1 - 12 months'
    IncarcerationLength.create :name => '1 - 5 years'
    IncarcerationLength.create :name => '5 - 10 years'
    IncarcerationLength.create :name => '10 - 15 years'
    IncarcerationLength.create :name => '15 - 20 years'
    IncarcerationLength.create :name => '> 20 years'
    
    desc "populating agency types"
    AgencyType.create :name => 'Mental Health'
    AgencyType.create :name => 'Shelter'
    AgencyType.create :name => 'Substance Abuse'
    
    desc "populating agencies"
    Agency.create :name => 'Andre House'
    Agency.create :name => 'CASS'
    Agency.create :name => 'EVMC'
    Agency.create :name => 'Friend/Family'
    Agency.create :name => 'MOS'
    Agency.create :name => 'Phoenix Resource'
    Agency.create :name => 'UMOM'
    Agency.create :name => 'WOF'
    
    desc "populating industries"
    Industry.create :name => 'Administrative'
    Industry.create :name => 'Custodial/Maintenance'
    Industry.create :name => 'Customer Service'
    Industry.create :name => 'Driving'
    Industry.create :name => 'General'
    Industry.create :name => 'Healthcare'
    Industry.create :name => 'Hospitality'
    Industry.create :name => 'Security'
    Industry.create :name => 'Trades'
    Industry.create :name => 'Warehouse'
    
#    desc "populating companies"
#    Company.populate 8..105 do |company|
#      company.name = Populator.words(1..3).titleize
#      company.description = Populator.words(5..10).capitalize
#      company.creator_id = adminuser.id
#      company.updater_id = adminuser.id
#    end
    
    desc "populating resource types"
    ResourceType.create :name => 'Bus - Daily Pass'
    ResourceType.create :name => 'Bus - Monthly Pass'
    ResourceType.create :name => 'Clothing'
    ResourceType.create :name => 'CVM - Community Voice Mail'
    ResourceType.create :name => 'Financial Assist: Housing Related'
    ResourceType.create :name => 'Financial Assist: Work Essentials'
    ResourceType.create :name => 'Hygiene'
    ResourceType.create :name => 'Shoes'
    ResourceType.create :name => 'Work Boots'
    
    desc "populating substances"
    Substance.create :name => 'Alcohol'
    Substance.create :name => 'Cocaine'
    Substance.create :name => 'Crack'
    Substance.create :name => 'Heroin'
    Substance.create :name => 'Marijuana'
    Substance.create :name => 'Methamphetamine'
    
    desc "populating contact types"
    ContactType.create :name => 'Client Contact'
    ContactType.create :name => 'Office Visit Only'
    
    desc "populating courses"
    Course.create :name => 'Job Readiness Workshop'
    Course.create :name => 'WIRC'
    
    desc "populating races"
    Race.create :name => 'African American'
    Race.create :name => 'Asian'
    Race.create :name => 'Caucasian'
    Race.create :name => 'Hispanic'
    Race.create :name => 'Native American'
    Race.create :name => 'Other'
    
  end

  private
  
  def secure_digest(*args)
    Digest::SHA1.hexdigest(args.flatten.join('--'))
  end

  def make_token
    secure_digest(Time.now, (1..10).map{ rand.to_s })
  end

  #This is needed to encrypt the user password
  def password_digest(password, salt)
    digest = REST_AUTH_SITE_KEY
    REST_AUTH_DIGEST_STRETCHES.times do
      digest = secure_digest(digest, salt, password, REST_AUTH_SITE_KEY)
    end
    digest
  end
  
  def float_rand(top_num, end_num=5)
    width = end_num-top_num
    (rand*width)+top_num
  end

end