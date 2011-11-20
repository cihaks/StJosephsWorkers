class Reports::DemographicsController < ApplicationController
    layout 'reports'

    def index
    
    @demo=Client.find_by_sql(["select 'African' as race1, count(*) as count_race from clients where race_id=7
    and created_at > '2011-01-16' and created_at>=?",Time.local(Time.now.year,1,1)])      
    @demo=@demo+Client.find_by_sql(["select 'Asian' as race1, count(*) as count_race from clients where race_id=8
    and created_at > '2011-01-16' and created_at>=?",Time.local(Time.now.year,1,1)])
    @demo=@demo+Client.find_by_sql(["select 'Caucasian' as race1, count(*) as count_race from clients where race_id=9
    and created_at > '2011-01-16' and created_at>=?",Time.local(Time.now.year,1,1)])
    @demo=@demo+Client.find_by_sql(["select 'Hispanic' as race1, count(*) as count_race from clients where race_id=10
    and created_at > '2011-01-16' and created_at>=?",Time.local(Time.now.year,1,1)])
    @demo=@demo+Client.find_by_sql(["select 'Native American' as race1, count(*) as count_race from clients where race_id=11
    and created_at > '2011-01-16' and created_at>=?",Time.local(Time.now.year,1,1)])    
    @demo=@demo+Client.find_by_sql(["select 'Other' as race1, count(*) as count_race from clients where race_id=12
    and created_at > '2011-01-16' and created_at>=?",Time.local(Time.now.year,1,1)])    

    @gender=Client.find_by_sql(["select 'Male' as gender1, count(*) as count_gender from clients where gender='Male'
    and created_at > '2011-01-16' and created_at>=?",Time.local(Time.now.year,1,1)])
    @gender=@gender+Client.find_by_sql(["select 'Female' as gender1, count(*) as count_gender from clients where gender='Female'
    and created_at > '2011-01-16' and created_at>=?",Time.local(Time.now.year,1,1)])

    @education=Client.find_by_sql(["select 'No High School' as education1, count(*) as count_education from clients where education_id=1 and created_at > '2011-01-16' and created_at>=?",Time.local(Time.now.year,1,1)])
    @education=@education+Client.find_by_sql(["select 'High School' as education1, count(*) as count_education from clients where education_id=2 and created_at > '2011-01-16' and created_at>=?",Time.local(Time.now.year,1,1)])
    @education=@education+Client.find_by_sql(["select 'Trade School' as education1, count(*) as count_education from clients where education_id=3 and created_at > '2011-01-16' and created_at>=?",Time.local(Time.now.year,1,1)])
    @education=@education+Client.find_by_sql(["select 'Some College' as education1, count(*) as count_education from clients where education_id=4 and created_at > '2011-01-16' and created_at>=?",Time.local(Time.now.year,1,1)])
    @education=@education+Client.find_by_sql(["select 'College' as education1, count(*) as count_education from clients where education_id=5 and created_at > '2011-01-16' and created_at>=?",Time.local(Time.now.year,1,1)])
    @education=@education+Client.find_by_sql(["select 'Masters Degree' as education1, count(*) as count_education from clients where education_id=6 and created_at > '2011-01-16' and created_at>=?",Time.local(Time.now.year,1,1)])
    @education=@education+Client.find_by_sql(["select 'PhD' as education1, count(*) as count_education from clients where education_id=7 and created_at > '2011-01-16' and created_at>=?",Time.local(Time.now.year,1,1)])

    @birth=Client.find_by_sql(["select 'Less than 20' as birth1, count(*) as count_birth from clients where birth_date > date_sub(curdate(),interval 20 year)
    and created_at > '2011-01-16' and created_at>=?",Time.local(Time.now.year,1,1)])
    @birth=@birth+Client.find_by_sql(["select 'Between 20 and 30' as birth1, count(*) as count_birth from clients where birth_date >= date_sub(curdate(),interval 30 year) and birth_date < date_sub(curdate(),interval 20 year)
    and created_at > '2011-01-16' and created_at>=?",Time.local(Time.now.year,1,1)])
    @birth=@birth+Client.find_by_sql(["select 'Between 30 and 40' as birth1, count(*) as count_birth from clients where birth_date >= date_sub(curdate(),interval 40 year) and birth_date < date_sub(curdate(),interval 30 year)
    and created_at > '2011-01-16' and created_at>=?",Time.local(Time.now.year,1,1)])
    @birth=@birth+Client.find_by_sql(["select 'Between 40 and 50' as birth1, count(*) as count_birth from clients where birth_date >= date_sub(curdate(),interval 50 year) and birth_date < date_sub(curdate(),interval 40 year)
    and created_at > '2011-01-16' and created_at>=?",Time.local(Time.now.year,1,1)])
    @birth=@birth+Client.find_by_sql(["select 'Greater than 50' as birth1, count(*) as count_birth from clients where birth_date < date_sub(curdate(),interval 50 year) 
    and created_at > '2011-01-16' and created_at>=?",Time.local(Time.now.year,1,1)])

      @demoa=Client.find_by_sql(["select 'African' as race1, count(*) as count_race from clients where race_id=7"])
      @demoa=@demoa+Client.find_by_sql(["select 'Asian' as race1, count(*) as count_race from clients where race_id=8"])
      @demoa=@demoa+Client.find_by_sql(["select 'Caucasian' as race1, count(*) as count_race from clients where race_id=9"])
      @demoa=@demoa+Client.find_by_sql(["select 'Hispanic' as race1, count(*) as count_race from clients where race_id=10"])
      @demoa=@demoa+Client.find_by_sql(["select 'Native American' as race1, count(*) as count_race from clients where race_id=11"])
      @demoa=@demoa+Client.find_by_sql(["select 'Other' as race1, count(*) as count_race from clients where race_id=12"])

      @gendera=Client.find_by_sql(["select 'Male' as gender1, count(*) as count_gender from clients where gender='Male'"])
      @gendera=@gendera+Client.find_by_sql(["select 'Female' as gender1, count(*) as count_gender from clients where gender='Female'"])


      @educationa=Client.find_by_sql(["select 'No High School' as education1, count(*) as count_education from clients where education_id=1"])
      @educationa=@educationa+Client.find_by_sql(["select 'High School' as education1, count(*) as count_education from clients where education_id=2"])
      @educationa=@educationa+Client.find_by_sql(["select 'Trade School' as education1, count(*) as count_education from clients where education_id=3"])
      @educationa=@educationa+Client.find_by_sql(["select 'Some College' as education1, count(*) as count_education from clients where education_id=4"])
      @educationa=@educationa+Client.find_by_sql(["select 'College' as education1, count(*) as count_education from clients where education_id=5"])
      @educationa=@educationa+Client.find_by_sql(["select 'Masters Degree' as education1, count(*) as count_education from clients where education_id=6"])
      @educationa=@educationa+Client.find_by_sql(["select 'PhD' as education1, count(*) as count_education from clients where education_id=7"])

      @birtha=Client.find_by_sql(["select 'Less than 20' as birth1, count(*) as count_birth from clients where birth_date > date_sub(curdate(),interval 20 year)"])
      @birtha=@birtha+Client.find_by_sql(["select 'Between 20 and 30' as birth1, count(*) as count_birth from clients where birth_date >= date_sub(curdate(),interval 30 year) and birth_date < date_sub(curdate(),interval 20 year)"])
      @birtha=@birtha+Client.find_by_sql(["select 'Between 30 and 40' as birth1, count(*) as count_birth from clients where birth_date >= date_sub(curdate(),interval 40 year) and birth_date < date_sub(curdate(),interval 30 year)"])
      @birtha=@birtha+Client.find_by_sql(["select 'Between 40 and 50' as birth1, count(*) as count_birth from clients where birth_date >= date_sub(curdate(),interval 50 year) and birth_date < date_sub(curdate(),interval 40 year)"])
      @birtha=@birtha+Client.find_by_sql(["select 'Greater than 50' as birth1, count(*) as count_birth from clients where birth_date < date_sub(curdate(),interval 50 year)"])

      
    end

    def show
      render :index
    end
  end
