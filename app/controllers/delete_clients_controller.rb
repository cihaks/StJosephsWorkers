class DeleteClientsController < SecurityController
	layout 'references2'
	
  def index
    @clients = Client.search(params[:query],params[:page],current_user.page_limit, current_user.has_role?(:admin))
		
    respond_to do |format|
      format.html 
      format.js { render :layout=>false }
      format.xml  { render :xml => @clients }
    end
  end

	def restore
		client = Client.find(params[:id])
    client.deleted = false
		client.save

    respond_to do |format|
      format.html do
        render :update do |page|
					page.hide "#{client.id}", "#{client.id}_line"
        end
      end
      format.xml  { head :ok }
			format.js do
        render :update do |page|
					page.hide "#{client.id}", "#{client.id}_line"
        end
      end
    end
	end

  def admin_destroy
    client = Client.find(params[:id])
    client.destroy

    respond_to do |format|
      format.html do
        render :update do |page|
					page.hide "#{client.id}", "#{client.id}_line"
        end
      end
      format.xml  { head :ok }
			format.js do
        render :update do |page|
					page.hide "#{client.id}", "#{client.id}_line"
        end
      end
    end
  end

end
