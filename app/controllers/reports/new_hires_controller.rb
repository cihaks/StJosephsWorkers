class Reports::NewHiresController < ApplicationController
    layout 'reports'

    def index
			@test_model = TestModel.new
			@test_model.start_date = params[:test_model].nil? ? Date.local(Time.now.year, 1,1).to_s : params[:test_model][:start_date]
#			@test_model.start_date = params[:test_model].nil? ? '1/1/2011' : params[:test_model][:start_date]
			@test_model.end_date = params[:test_model][:end_date] unless params[:test_model].nil? or params[:test_model][:end_date].nil?
      @new_hires=Job.find(:all, :conditions=>['start_date >=? and start_date is not null', Date.strptime(@test_model.start_date,'%m/%d/%Y')],:order=>'start_date')

      respond_to do |format|
         format.html   
        format.xml
      end
    end

    def show
      render :index
    end
  end
