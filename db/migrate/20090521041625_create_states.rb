class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.column :code, :string, :limit => 2
      t.string :description, :country
      t.timestamps
      t.userstamps
    end
    
    #populate table
    State.create :code => 'AL', :description => 'Alabama', :country => 'US'
    State.create :code => 'AK', :description => 'Alaska', :country => 'US'
    State.create :code => 'AZ', :description => 'Arizona', :country => 'US'
    State.create :code => 'AR', :description => 'Arkansas', :country => 'US'
    State.create :code => 'CA', :description => 'California', :country => 'US'
    State.create :code => 'CO', :description => 'Colorado', :country => 'US'
    State.create :code => 'CT', :description => 'Connecticut', :country => 'US'
    State.create :code => 'DE', :description => 'Delaware', :country => 'US'
    State.create :code => 'FL', :description => 'Florida', :country => 'US'
    State.create :code => 'GA', :description => 'Georgia', :country => 'US'
    State.create :code => 'HI', :description => 'Hawaii', :country => 'US'
    State.create :code => 'ID', :description => 'Idaho', :country => 'US'
    State.create :code => 'IL', :description => 'Illinois', :country => 'US'
    State.create :code => 'IN', :description => 'Indiana', :country => 'US'
    State.create :code => 'IA', :description => 'Iowa', :country => 'US'
    State.create :code => 'KS', :description => 'Kansas', :country => 'US'
    State.create :code => 'KY', :description => 'Kentucky', :country => 'US'
    State.create :code => 'LA', :description => 'Louisiana', :country => 'US'
    State.create :code => 'ME', :description => 'Maine', :country => 'US'
    State.create :code => 'MD', :description => 'Maryland', :country => 'US'
    State.create :code => 'MA', :description => 'Massachusetts', :country => 'US'
    State.create :code => 'MI', :description => 'Michigan', :country => 'US'
    State.create :code => 'MN', :description => 'Minnesota', :country => 'US'
    State.create :code => 'MS', :description => 'Mississippi', :country => 'US'
    State.create :code => 'MO', :description => 'Missouri', :country => 'US'
    State.create :code => 'MT', :description => 'Montana', :country => 'US'
    State.create :code => 'NE', :description => 'Nebraska', :country => 'US'
    State.create :code => 'NV', :description => 'Nevada', :country => 'US'
    State.create :code => 'NH', :description => 'New Hampshire', :country => 'US'
    State.create :code => 'NJ', :description => 'New Jersey', :country => 'US'
    State.create :code => 'NM', :description => 'New Mexico', :country => 'US'
    State.create :code => 'NY', :description => 'New York', :country => 'US'
    State.create :code => 'NC', :description => 'North Carolina', :country => 'US'
    State.create :code => 'ND', :description => 'North Dakota', :country => 'US'
    State.create :code => 'OH', :description => 'Ohio', :country => 'US'
    State.create :code => 'OK', :description => 'Oklahoma', :country => 'US'
    State.create :code => 'OR', :description => 'Oregon', :country => 'US'
    State.create :code => 'PA', :description => 'Pennsylvania', :country => 'US'
    State.create :code => 'RI', :description => 'Rhode Island', :country => 'US'
    State.create :code => 'SC', :description => 'South Carolina', :country => 'US'
    State.create :code => 'SD', :description => 'South Dakota', :country => 'US'
    State.create :code => 'TN', :description => 'Tennessee', :country => 'US'
    State.create :code => 'TX', :description => 'Texas', :country => 'US'
    State.create :code => 'UT', :description => 'Utah', :country => 'US'
    State.create :code => 'VT', :description => 'Vermont', :country => 'US'
    State.create :code => 'VA', :description => 'Virginia', :country => 'US'
    State.create :code => 'WA', :description => 'Washington', :country => 'US'
    State.create :code => 'WV', :description => 'West Virginia', :country => 'US'
    State.create :code => 'WI', :description => 'Wisconsin', :country => 'US'
    State.create :code => 'WY', :description => 'Wyoming', :country => 'US'

    
  end

  def self.down
    drop_table :states
  end
end
