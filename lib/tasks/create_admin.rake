
namespace :db do
  task :create_admin => :environment do
    require 'populator'
    require 'faker'
    require 'digest/sha1'
    
    desc "Clear existing data"
    
    ActiveRecord::Base.connection.execute("DELETE FROM roles_users")
    [Role, User].each(&:delete_all)
    [AgencyType, Agency, Industry, CrimeType].each(&:delete_all)
    [JobType, Prison, ResourceType, StatusType, Substance].each(&:delete_all)
    
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
    desc "populating job types"
      JobType.populate 8..20 do |job_type|
      job_type.name = Populator.words(1..2).titleize
      job_type.creator_id = adminuser.id
      job_type.updater_id = adminuser.id
    end
    
    desc "populating status types"
    StatusType.populate 10..20 do |status_type|
      status_type.name = Populator.words(1..2).titleize
      status_type.description = Populator.sentences(1)[0..255].capitalize
      status_type.creator_id = adminuser.id
      status_type.updater_id = adminuser.id
    end
    
    desc "populating prisons"
    Prison.populate 5 do |prison|
      prison.name = Populator.words(1..2).titleize
      prison.creator_id = adminuser.id
      prison.updater_id = adminuser.id
    end
    
    desc "populating crime types"
    CrimeType.populate 7..15 do |crime_type|
      crime_type.name = Populator.words(1..3).titleize
      crime_type.description = Populator.words(3..5).capitalize
      crime_type.creator_id = adminuser.id
      crime_type.updater_id = adminuser.id
    end
    
    desc "populating agency types"
    AgencyType.populate 4 do |agency_type|
      agency_type.name = Populator.words(1).titleize
      agency_type.creator_id = adminuser.id
      agency_type.updater_id = adminuser.id
    end
    
    desc "populating agencies"
    Agency.populate 15 do |agency|
      agency.agency_type_id = AgencyType.all.rand.id
      agency.name = Populator.words(1).titleize
      agency.creator_id = adminuser.id
      agency.updater_id = adminuser.id
    end
    
    desc "populating industries"
    Industry.populate 6..12 do |industry|
      industry.name = Populator.words(1..3).titleize
      industry.description = Populator.words(5..10).capitalize
      industry.creator_id = adminuser.id
      industry.updater_id = adminuser.id
    end
    
#    desc "populating companies"
#    Company.populate 8..105 do |company|
#      company.name = Populator.words(1..3).titleize
#      company.description = Populator.words(5..10).capitalize
#      company.creator_id = adminuser.id
#      company.updater_id = adminuser.id
#    end
    
#    desc "populating courses"
#    Course.populate 1 do |course|
#      course.name = "Job Readiness"
#      course.creator_id = adminuser.id
#      course.updater_id = adminuser.id
#    end
    
    desc "populating resource types"
    ResourceType.populate 1 do |resource_type|
      resource_type.name = "Bus Ticket"
      resource_type.description = "Bus Ticket"
      resource_type.creator_id = adminuser.id
      resource_type.updater_id = adminuser.id
    end
    ResourceType.populate 1 do |resource_type|
      resource_type.name = "Clothes"
      resource_type.description = "Clothes"
      resource_type.creator_id = adminuser.id
      resource_type.updater_id = adminuser.id
    end
    
    desc "populating substances"
    Substance.populate 25..50 do |substance|
      substance.name = Populator.words(1..3).titleize
      substance.creator_id = adminuser.id
      substance.updater_id = adminuser.id
    end
    
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