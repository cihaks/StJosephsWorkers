
namespace :db do
  task :create_clients => :environment do
    require 'populator'
    require 'faker'
    require 'digest/sha1'
    
    desc "Clear existing data"
    ActiveRecord::Base.connection.execute("DELETE FROM roles_users")
    [Role, User, Picture].each(&:delete_all)
    [StatusType, Industry, Company].each(&:delete_all)
    [ResourceType, AssignedResource, AssignedAgency, Agency].each(&:delete_all)
    [RegisteredClass, Course, CrimeSentence, CrimeType, Prison].each(&:delete_all)
    [UsedSubstance, Substance].each(&:delete_all)
    [JobType, JobRate, JobApplication, JobInterview, Job].each(&:delete_all)
    [Phone, Address, ContactType, Contact, Client, Race].each(&:delete_all)
    
    desc "clear existing photos"
    photo_dirs = Dir[RAILS_ROOT + '/public/system/photos/*']
    FileUtils.rm_r(photo_dirs, :verbose=>true, :force=>true)
    
    photos = Dir[RAILS_ROOT + '/test/fixtures/samplephotos/*']
    
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
    
    desc "populating races"
    Race.populate 10 do |race|
      race.name = Populator.words(1).titleize
      race.description = Populator.sentences(1)
      race.creator_id = adminuser.id
      race.updater_id = adminuser.id
    end
    
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
    
    desc "populating contact types"
    ["Office Visit","Resource Request","Resource Return"].each do |type_name|
      ContactType.populate 1 do |contact_type|
        contact_type.name = type_name
        contact_type.creator_id = adminuser.id
        contact_type.updater_id = adminuser.id
      end
    end 
    ContactType.populate 5..9 do |contact_type|
      contact_type.name = Populator.words(1).titleize
      contact_type.creator_id = adminuser.id
      contact_type.updater_id = adminuser.id
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
    
    desc "populating industries and companies"
    Industry.populate 6..12 do |industry|
      industry.name = Populator.words(1..3).titleize
      industry.description = Populator.words(5..10).capitalize
      industry.creator_id = adminuser.id
      industry.updater_id = adminuser.id
    end
    
    Company.populate 8..105 do |company|
      company.name = Populator.words(1..3).titleize
      company.description = Populator.words(5..10).capitalize
      company.creator_id = adminuser.id
      company.updater_id = adminuser.id
    end
    
    desc "populating courses"
    Course.populate 1 do |course|
      course.name = "Job Readiness"
      course.creator_id = adminuser.id
      course.updater_id = adminuser.id
    end
    
    desc "populating resource types"
    ResourceType.populate 8..15 do |resource_type|
      resource_type.name = Populator.words(1..2).titleize
      resource_type.description = Populator.words(4..10).capitalize
      resource_type.creator_id = adminuser.id
      resource_type.updater_id = adminuser.id
    end
    
    desc "populating substances"
    Substance.populate 25..50 do |substance|
      substance.name = Populator.words(1..3).titleize
      substance.creator_id = adminuser.id
      substance.updater_id = adminuser.id
    end
    
    desc "populating clients"
    Client.populate 20..30 do |client|
      race = Race.all.rand
      client.race_id = race.id
      client.first_name = Faker::Name.first_name
      client.middle_name = ['','','','','',Faker::Name.first_name]
      client.last_name = Faker::Name.last_name
      client.gender = ['M','F']
      client.caution = [true,false]
      client.resource_eligible = [true,false]
      client.veteran = [true,false]
      client.success_story = [true,false]
      client.birth_date = Date.new(1950,1,1)..Date.new(1990,12,31)
      mydate = 2.years.ago..Time.now
      client.created_at = mydate
      client.updated_at = mydate
      client.creator_id = User.all.rand.id
      client.updater_id = User.all.rand.id
      Contact.populate 1..15 do |contact|
        type = ContactType.all.rand
        contact.client_id = client.id
        contact.contact_type_id = type.id
        contact.contact_date = 2.years.ago..Time.now
        contact.contact_negative = [true,false]
        contact.note = Populator.sentences(2);
        contact.alert = true if [true,false,false,false,false,false].rand
        contact.created_at = mydate
        contact.updated_at = mydate
        contact.creator_id = User.all.rand.id
        contact.updater_id = User.all.rand.id
      end
      Address.populate 1..4 do |address|
        address.client_id = client.id
        address.address1 = Faker::Address.street_address
        address.address2 = ['','','','','',Faker::Address.secondary_address]
        address.city = Faker::Address.city
        state = State.all.rand
        address.state_id = state.id
        address.zip_code = Faker::Address.zip_code[0,5]
        address.start_date = 5.years.ago..Time.now
        if [true,false].rand
          address.end_date = 3.years.ago..Time.now
        end 
        address.creator_id = User.all.rand.id
        address.updater_id = User.all.rand.id
      end
      AssignedAgency.populate 1..5 do |assigned_agency|
        assigned_agency.client_id = client.id
        agency = Agency.all.rand
        assigned_agency.agency_id = agency.id
        assigned_agency.start_date = 5.years.ago..Time.now
        if [true,true,true,false,false].rand
          assigned_agency.end_date = 3.years.ago..Time.now
        end
        assigned_agency.created_at = mydate
        assigned_agency.updated_at = mydate
        assigned_agency.creator_id = User.all.rand.id
        assigned_agency.updater_id = User.all.rand.id
      end
      AssignedResource.populate 1..5 do |assigned_resource|
        assigned_resource.client_id = client.id
        resource_type = ResourceType.all.rand
        assigned_resource.resource_type_id = resource_type.id
        assigned_resource.amount = 100..9999
        assigned_resource.verified = [true,false]
        assigned_resource.number = 1..12
        assigned_resource.resource_date = 3.years.ago..Time.now
        assigned_resource.creator_id = User.all.rand.id
        assigned_resource.updater_id = User.all.rand.id
      end
      CrimeSentence.populate 1..3 do |crime_sentence|
        crime_type = CrimeType.all.rand
        prison = Prison.all.rand
        crime_sentence.client_id = client.id
        crime_sentence.prison_id = prison.id
        crime_sentence.crime_type_id = crime_type.id
        crime_sentence.start_date = 6.years.ago..Time.now
        if [false,false,false,true].rand
          crime_sentence.end_date = 3.years.ago..Time.now
        end
        crime_sentence.felony = [true,false,false,false,false]
        crime_sentence.violent = [true,false,false,false]
        crime_sentence.sex_offender = [false,false,false,false,true]
        crime_sentence.creator_id = User.all.rand.id
        crime_sentence.updater_id = User.all.rand.id
      end
      JobApplication.populate 1..3 do |job_app|
        job_app.client_id = client.id
        job_app.company_id = Company.all.rand.id
        job_app.industry_id = Industry.all.rand.id
        job_app.application_date = 6.months.ago..Time.now
        job_app.creator_id = User.all.rand.id
        job_app.updater_id = User.all.rand.id
      end
      JobInterview.populate 1..2 do |interview|
        interview.client_id = client.id
        interview.company_id = Company.all.rand.id
        interview.industry_id = Industry.all.rand.id
        interview.interview_date = 2.months.ago..Time.now
        interview.creator_id = User.all.rand.id
        interview.updater_id = User.all.rand.id
      end
      Job.populate 0..5 do |job|
        job.client_id = client.id
        job.job_type_id = JobType.all.rand.id
        job.company_id = Company.all.rand.id
        job.industry_id = Industry.all.rand.id
        job.start_date = 12.months.ago..Time.now
        if [false,false,false,true].rand
          job.end_date = 2.months.ago..Time.now
        end
        job.pay_scale_low = 10000..40000
        job.pay_scale_high = 40001..80000
        JobRate.populate 1..3 do |job_rate|
          job_rate.job_id = job.id
          job_rate.hourly_rate = float_rand(12)
          end_range = Time.now
          end_range = job.end_date unless job.end_date.nil?
          job_rate.hourly_rate_date = job.start_date..end_range
          job_rate.creator_id = User.all.rand.id
          job_rate.updater_id = User.all.rand.id
        end
        if [true,false].rand
          job.current = true
        end
        if [false,true,false].rand
          job.medical = true
          job.dental = true
        end
        if [false,true,true].rand
          job.retirement_401k = true
        end
        if [false,true].rand
          job.pto = true
        end
        if [false,true].rand
          job.full_time = true
        end
        if [false,true].rand
          job.temp_to_hire = true
        end
        job.creator_id = User.all.rand.id
        job.updater_id = User.all.rand.id
      end
      Phone.populate 2..5 do |phone|
        phone.client_id = client.id
        phone.phone_number = Faker::PhoneNumber.phone_number
        if [false,true,true,true,true].rand
          phone.primary = true
        end
        phone.creator_id = User.all.rand.id
        phone.updater_id = User.all.rand.id
      end
      RegisteredClass.populate 2..5 do |registered_class|
        course = Course.all.rand
        registered_class.client_id = client.id
        registered_class.course_id = course.id
        registered_class.class_date = 2.years.ago..Time.now
        if [false,false,false,true].rand
          registered_class.waive_date = 2.years.ago..Time.now
        else
          registered_class.completed = true
        end
        registered_class.creator_id = User.all.rand.id
        registered_class.updater_id = User.all.rand.id
      end
      UsedSubstance.populate 0..5 do |used_substance|
        substance = Substance.all.rand
        used_substance.client_id = client.id
        used_substance.substance_id = substance.id
        used_substance.entry_date = 6.years.ago..2.years.ago
        if [true,false].rand
          used_substance.sober_date = 2.years.ago..Time.now
        end
        used_substance.creator_id = User.all.rand.id
        used_substance.updater_id = User.all.rand.id
      end
      Picture.populate 1 do |picture|
        photo_index = client.id - 1
        until photo_index < photos.length do
          photo_index -= photos.length
        end
        picture.client_id = client.id
        picture.photo_file_size = File.size(photos[photo_index])
        picture.photo_file_name = File.basename(photos[photo_index])
        picture.photo_content_type = "image/gif"
        picture.creator_id = User.all.rand.id
        picture.updater_id = User.all.rand.id
        photo_dir = RAILS_ROOT + '/public/system/photos/' + picture.id.to_s + "/original/"
        FileUtils.mkdir_p photo_dir
        FileUtils.cp photos[photo_index], photo_dir+picture.photo_file_name
      end
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