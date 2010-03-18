# == Schema Information
# Schema version: 20090924043100
#
# Table name: assigned_resources
#
#  id               :integer(4)      not null, primary key
#  client_id        :integer(4)
#  resource_type_id :integer(4)
#  amount           :integer(4)
#  number           :integer(4)
#  verified         :boolean(1)
#  resource_date    :date
#  created_at       :datetime
#  updated_at       :datetime
#

class AssignedResource < ActiveRecord::Base
  # belongs_to :resource_type
  belongs_to :client
  # has_one :daily_pass, :dependent => :destroy
  # has_one :monthly_pass, :dependent => :destroy
  # has_one :voice_mail, :dependent => :destroy
  has_and_belongs_to_many :companies
  has_and_belongs_to_many :industries

	acts_as_domain_based_association do |config|
		config.domain_type :resource_type
		config.associations :daily_pass, :monthly_pass, :voice_mail
	end

  
  # def my_daily_pass=(daily_pass_attributes)
  #   if self.daily_pass.nil?
  #     daily_pass_attributes.each do |attributes|
  #       self.build_daily_pass(attributes)
  #     end unless daily_pass_attributes.nil?
  #   else
  #     attributes = daily_pass_attributes[self.daily_pass.id.to_s] unless daily_pass_attributes.nil?
  #     if attributes
  #       self.daily_pass.attributes = attributes
  #     else
  #       self.daily_pass.delete
  #     end
  #   end
  # end
  # 
  # def save_daily_pass
  #   self.daily_pass.save
  # end
  #   
  # def after_save
  #   # if verified is false, set client.resource_eligible to false ?
  #   save_daily_pass
  # end
  
  # def after_create
  #   # create new has_one relationship based on type
  # end
  # 
  # def after_update
  #   # delete has_one relationships other than current based on type
  #   # create or update current has_one relationship based on type
  # end
  
end
