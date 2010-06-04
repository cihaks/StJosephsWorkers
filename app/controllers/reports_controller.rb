class ReportsController < ApplicationController
  
  before_filter :set_reports
  
  require_role :admin
  
  def index
  end
  
  def jobs
    @jobs = Hash.new
    js = Job.find(:all,:conditions=>["start_date is not null and start_date >= ?",3.months.ago])
    @jobs[:new_3]=js.size
    js = Job.find(:all,:conditions=>["start_date is not null and start_date >= ? and start_date < ?",6.months.ago,3.months.ago])
    @jobs[:new_6]=js.size
    js = Job.find(:all,:conditions=>["start_date is not null and start_date < ?",6.months.ago])
    @jobs[:new_else]=js.size
    js = Job.find(:all,:conditions=>["end_date is null and start_date >= ?",3.months.ago] )
    @jobs[:retained_3]=js.size
    js = Job.find(:all,:conditions=>["end_date is null and start_date >= ? and start_date < ?",6.months.ago,3.months.ago] )
    @jobs[:retained_6]=js.size
    js = Job.find(:all,:conditions=>["end_date is null and start_date < ?",6.months.ago] )
    @jobs[:retained_else]=js.size
    js = Job.find(:all,:conditions=>["end_date is not null and start_date >= ?",3.months.ago] )
    @jobs[:lost_3]=js.size
    js = Job.find(:all,:conditions=>["end_date is not null and start_date >= ? and start_date < ?",6.months.ago,3.months.ago] )
    @jobs[:lost_6]=js.size
    js = Job.find(:all,:conditions=>["end_date is not null and start_date < ?",6.months.ago] )
    @jobs[:lost_else]=js.size
    js = Job.find(:all,:conditions=>"end_date is null")
    @jobs[:all_current]=js.size
    js = Job.find(:all,:conditions=>"end_date is not null")
    @jobs[:all_lost]=js.size
  end
  
  def set_reports
    @reports_flag = true
  end
end
