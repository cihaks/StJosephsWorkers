# == Schema Information
# Schema version: 20110331225232
#
# Table name: users
#
#  id                        :integer(4)      not null, primary key
#  login                     :string(40)
#  name                      :string(100)     default("")
#  email                     :string(100)
#  crypted_password          :string(40)
#  salt                      :string(40)
#  remember_token            :string(40)
#  remember_token_expires_at :datetime
#  created_at                :datetime
#  updated_at                :datetime
#  creator_id                :integer(4)
#  updater_id                :integer(4)
#

require 'digest/sha1'

class User < ActiveRecord::Base
  model_stamper  
  
  # ---------------------------------------
  # The following code has been generated by role_requirement.
  # You may wish to modify it to suit your need
  has_and_belongs_to_many :roles

	validates_datetime :remember_token_expires_at, :allow_blank=>true
  
  # has_role? simply needs to return true or false whether a user has a role or not.  
  # It may be a good idea to have "admin" roles return true always
  def has_role?(role_in_question)
    @_list ||= self.roles.collect(&:name)
    return true if @_list.include?("admin")
    (@_list.include?(role_in_question.to_s) )
  end
  # ---------------------------------------
  
  def page_limit
    10
  end
  
  def sub_page_limit
    3
  end

  def admin_list_limit
		20
	end

	def log_limit
		10
	end
  
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken

  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :name,     :maximum => 100

	

#  validates_presence_of     :email
#  validates_length_of       :email,    :within => 6..100 #r@a.wk
#  validates_uniqueness_of   :email
#  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message, :allow_nil => true

  

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation, :role_ids

  def self.search(search, page, page_limit)
    paginate :per_page=>page_limit, :page=>page,
             :conditions => ["name LIKE ? or login LIKE ?", "%#{search}%", "%#{search}%"],
             :order => 'name'
  end


  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_by_login(login.downcase) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end

  protected
	
end
