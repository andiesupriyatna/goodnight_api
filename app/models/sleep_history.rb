class SleepHistory
  include Mongoid::Document
  include Mongoid::Timestamps

  field :clock_in, type: Time
  field :clock_out, type: Time
  field :sleep_duration, type: Integer  # use minutes before save

  belongs_to :user

  validates :clock_in, presence: true
  validates :user, presence: true

  index({ user_id: 1, clock_out: 1 })

  def clock_out!
    update(clock_out: Time.current) unless clock_out.present?
  end
  
  private
  
  def clock_out_after_clock_in
    if clock_out <= clock_in
      errors.add(:clock_out, "must be after the clock in time")
    end
  end

  def calculate_sleep_duration
    return "N/A" unless clock_in && clock_out

    seconds = (clock_out - clock_in).to_i
    years = seconds / 31_536_000
    seconds %= 31_536_000
    months = seconds / 2_629_746
    seconds %= 2_629_746
    weeks = seconds / 604_800
    seconds %= 604_800
    days = seconds / 86_400
    seconds %= 86_400
    hours = seconds / 3_600
    seconds %= 3_600
    minutes = seconds / 60
    seconds %= 60

    time_string = []
    time_string << "#{years} years" if years > 0
    time_string << "#{months} months" if months > 0
    time_string << "#{weeks} weeks" if weeks > 0
    time_string << "#{days} days" if days > 0
    time_string << "#{hours} hours" if hours > 0
    time_string << "#{minutes} minutes" if minutes > 0
    time_string << "#{seconds} seconds" if seconds > 0

    time_string.join(" ")
  end
end
