class Reports::MissingController < ApplicationController
      layout 'reports'
      
      def index

#          @missingclientsyear=Contact.find(:all,:select => 'DISTINCT client_id',:conditions=>["created_at>=? and created_at >? and contact_type_id IN (?)",((Date.today)-365),'2011-01-16','4,6'])

#         @missingclientstwomonths=Contact.find(:all,:select => 'DISTINCT client_id',:conditions=>["created_at>=? and created_at >? and contact_type_id IN (?)",((Date.today)-60),'2011-01-16','4,6'])

#        @missyear=Array.new
     
#          @misstwo=Array.new
          
#          @missyear=@missingclientsyear
#          @misstwo=@missingclientstwomonths          
           
#          @missingclients=Array.new
#          @missing=Array.new
           
#          @missingclients = @missyear-@misstwo
  
  
#          @outstring="missing clients array: "+@missingclients.length.to_s
#          @outstringa="missing years array: "+@missyear.length.to_s
#          @outstringb="missing two array: "+@misstwo.length.to_s



          @missingclients=Contact.find_by_sql("select distinct client_id from contacts where contact_type_id in (4,6) and contact_date <> '2011-01-16' and contact_date > date_sub(curdate(),interval 365 day) and client_id not in
          (select distinct client_id from contacts where contact_type_id in (4,6) and contact_date <> '2011-01-16' and contact_date >= date_sub(curdate(),interval 30 day))")
         
          @missing=@missingclients.sort_by { |n| [n.client.name]}

          @missingclients6=Contact.find_by_sql("select distinct client_id from contacts where contact_type_id in (4,6) and contact_date <> '2011-01-16' and contact_date > date_sub(curdate(),interval 365 day) and client_id not in
          (select distinct client_id from contacts where contact_type_id in (4,6) and contact_date <> '2011-01-16' and contact_date >= date_sub(curdate(),interval 60 day))")
         
          @missing6=@missingclients6.sort_by { |m| [m.client.name]}

        respond_to do |format|
          format.html
          format.xml
        end
      end

      def show
        render :index
      end
    end
    

    
    