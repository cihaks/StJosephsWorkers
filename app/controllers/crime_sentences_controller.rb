class CrimeSentencesController < ApplicationController
  layout 'infamy_content'
  
  before_filter :get_client, :set_section
  
  # active_scaffold :crime_sentence do |config|
  #   config.label = 'Client Sentence'
  #   config.columns[:felony].form_ui = :checkbox
  #   config.columns[:violent].form_ui = :checkbox
  #   config.columns[:sex_offender].form_ui = :checkbox
  #   config.columns[:client].form_ui = :select
  #   config.columns[:crime_type].form_ui = :select
  #   config.columns[:prison].form_ui = :select
  #   config.list.columns = [:client, :crime_type, :felony, :prison, :violent, :sex_offender, :start_date, :end_date]
  #   config.create.columns = [:client, :crime_type, :felony, :prison, :violent, :sex_offender, :start_date, :end_date]
  #   config.update.columns = [:client, :crime_type, :felony, :prison, :violent, :sex_offender, :start_date, :end_date]
  # end

  # GET /crime_sentences
  # GET /crime_sentences.xml
  def index
    @crime_sentences = @client.crime_sentences.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @crime_sentences }
    end
  end

  # GET /crime_sentences/1
  # GET /crime_sentences/1.xml
  def show
    @crime_sentence = @client.crime_sentences.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @crime_sentence }
    end
  end

  # GET /crime_sentences/new
  # GET /crime_sentences/new.xml
  def new
    @crime_sentence = @client.crime_sentences.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @crime_sentence }
    end
  end

  # GET /crime_sentences/1/edit
  def edit
    @crime_sentence = @client.crime_sentences.find(params[:id])
  end

  # POST /crime_sentences
  # POST /crime_sentences.xml
  def create
    @crime_sentence = @client.crime_sentences.build(params[:crime_sentence])

    respond_to do |format|
      if @crime_sentence.save
        flash[:notice] = 'CrimeSentence was successfully created.'
        format.html { redirect_to(client_crime_sentences_url(@client)) }
        format.xml  { render :xml => @crime_sentence, :status => :created, :location => @crime_sentence }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @crime_sentence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /crime_sentences/1
  # PUT /crime_sentences/1.xml
  def update
    @crime_sentence = @client.crime_sentences.find(params[:id])

    respond_to do |format|
      if @crime_sentence.update_attributes(params[:crime_sentence])
        flash[:notice] = 'CrimeSentence was successfully updated.'
        format.html { redirect_to(client_crime_sentences_path(@client)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @crime_sentence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /crime_sentences/1
  # DELETE /crime_sentences/1.xml
  def destroy
    @crime_sentence = @client.crime_sentences.find(params[:id])
    @crime_sentence.destroy

    respond_to do |format|
      format.html { redirect_to(client_crime_sentences_path(@client)) }
      format.xml  { head :ok }
    end
  end
  
  def set_section
    session[:infamy_section] = controller_name
  end
end
