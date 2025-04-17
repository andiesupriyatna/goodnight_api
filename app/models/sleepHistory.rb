class SleepHistory
  include Mongoid::Document
  include Mongoid::Timestamps

  field :clock_in, type: Time
  field :clock_out, type: Time
  field :sleep_duration, type: Integer  # use minutes before save

 
end
