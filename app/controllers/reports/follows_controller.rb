class Reports::FollowsController < ApplicationController
    layout 'reports'

    def index

  @follows=Contact.find_by_sql("select DATE_FORMAT(a.contact_date, '%M %d, %Y') as contact_date, all_contacts, ifnull(follow_contacts,0) as follow_contacts, ifnull(incarcerated_contacts,0) as incar_contacts
      from
      (select count(*) as all_contacts, contact_date from contacts where contact_type_id in (4,6) and contact_date > '2011-01-16' group by contact_date) a
      left outer join 
      (select count(*) as follow_contacts, contact_date from contacts where contact_type_id in (4,6) and contact_date > '2011-01-16' and client_id in (select client_id from clients_status_types where status_type_id=9) group by contact_date) b
      on a.contact_date=b.contact_date
      left outer join 
      (select count(*) as incarcerated_contacts, contact_date from contacts where contact_type_id in (4,6) and contact_date > '2011-01-16' and client_id in (select client_id from clients_status_types where status_type_id=13) group by contact_date) c
      on a.contact_date=c.contact_date")

      respond_to do |format|
        format.html
        format.xml
      end
    end

    def show
      render :index
    end
  end