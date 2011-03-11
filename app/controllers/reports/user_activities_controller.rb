class Reports::UserActivitiesController < ApplicationController
    layout 'reports'
    
    def show
      @user_obj = User.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @user_obj }
      end
    end

end

