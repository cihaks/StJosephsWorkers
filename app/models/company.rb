# == Schema Information
# Schema version: 20090924043100
#
# Table name: companies
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  description        :string(255)
#  industry_id        :integer(4)
#  allow_felony       :boolean(1)
#  allow_sex_offender :boolean(1)
#  created_at         :datetime
#  updated_at         :datetime
#

# == Schema Information
# Schema version: 20090716055901
#
# Table name: companies
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  description        :string(255)
#  industry_id        :integer(4)
#  allow_felony       :boolean(1)
#  allow_sex_offender :boolean(1)
#  created_at         :datetime
#  updated_at         :datetime
#

class Company < ActiveRecord::Base
  has_many :job_interviews
  has_many :job_applications
  has_many :jobs
  has_and_belongs_to_many :assigned_resources
  
  def to_label
    name
  end
end
