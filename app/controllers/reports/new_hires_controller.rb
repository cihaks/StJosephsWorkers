class Reports::NewHiresController < ApplicationController
    layout 'reports'

    def index


      @new_hires=Job.find(:all, :conditions=>['start_date >=? and start_date is not null', Time.local(Time.now.year, 1,1)],:order=>'start_date')

      respond_to do |format|
         format.html   
        format.xml
      end
    end

    def show
      render :index
    end
  end
