
namespace :db do
  task :create_users => :environment do
    require 'populator'
    require 'faker'
    require 'digest/sha1'
    
    desc "Clear existing data"
    ActiveRecord::Base.connection.execute("DELETE FROM roles_users")
    [Role, User].each(&:delete_all)
    
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
      User.populate 1 do |user|
        user.login = 'crosslr2'
        user.name = 'Rob Crossley'
        user.salt = make_token
        user.crypted_password = password_digest('password',user.salt)
        ActiveRecord::Base.connection.execute("INSERT INTO roles_users (role_id,user_id) VALUES (#{roleAdmin.id}, #{user.id})")
      end      
      User.populate 1 do |user|
        user.login = 'amy'
        user.name = 'Amy Caffarello'
        user.salt = make_token
        user.crypted_password = password_digest('password',user.salt)
        ActiveRecord::Base.connection.execute("INSERT INTO roles_users (role_id,user_id) VALUES (#{roleAdmin.id}, #{user.id})")
      end
      User.populate 1 do |user|
        user.login = 'nina'
        user.name = 'Nina Lindsey'
        user.salt = make_token
        user.crypted_password = password_digest('password',user.salt)
        ActiveRecord::Base.connection.execute("INSERT INTO roles_users (role_id,user_id) VALUES (#{roleAdmin.id}, #{user.id})")
      end
    end
    adminuser = User.find_by_login('cihaks')
    
    Role.populate 1 do |roleOffice|
      roleOffice.name = 'office'
      User.populate 1 do |user|
        user.name = 'Joe Employee'
        user.login = 'guest'
        user.salt = make_token
        user.crypted_password = password_digest('password',user.salt)
        ActiveRecord::Base.connection.execute("INSERT INTO roles_users (role_id,user_id) VALUES (#{roleOffice.id}, #{user.id})")
      end
      # User.populate 4..8 do |user|
      #   fname = Faker::Name.first_name
      #   lname = Faker::Name.last_name
      #   user.name = fname + ' ' + lname
      #   user.login = Faker::Internet.user_name(fname.downcase+"_"+lname.downcase)
      #   user.salt = make_token
      #   user.crypted_password = password_digest('password',user.salt)
      #   ActiveRecord::Base.connection.execute("INSERT INTO roles_users (role_id,user_id) VALUES (#{roleOffice.id}, #{user.id})")
      # end
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