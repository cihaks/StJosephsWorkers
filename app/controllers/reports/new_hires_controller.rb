class Reports::NewHiresController < ApplicationController
    layout 'reports'

    def index
			@test_model = TestModel.new
			@test_model.start_date = params[:test_model].nil? ? Time.local(Time.now.year, 1,1) : params[:test_model][:start_date]
			@test_model.end_date = params[:test_model][:end_date] unless params[:test_model].nil? or params[:test_model][:end_date].nil?
      @new_hires=Job.find(:all, :conditions=>['start_date >=? and start_date is not null', @test_model.start_date],:order=>'start_date')

      respond_to do |format|
         format.html   
        format.xml
      end
    end

    def show
      render :index
    end
  end
