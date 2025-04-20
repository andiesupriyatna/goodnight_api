class SleepHistory
  include Mongoid::Document
  include Mongoid::Timestamps

  field :clock_in, type: Time
  field :clock_out, type: Time
  field :sleep_duration, type: Integer  # use minutes before save

  belongs_to :user

  # Validations
  validates :clock_in_time, presence: true
  validates :user, presence: true
  validate :clock_out_time_after_clock_in_time, if: -> { clock_out_time.present? }

  # Scopes
  scope :completed, -> { where(:clock_out_time.ne => nil) }
  scope :past_week, -> { where(:clock_in_time.gte => 1.week.ago) }
  
  # Indexes
  index({ user_id: 1 })
  index({ clock_in_time: 1 })
  index({ sleep_duration: 1 })
  index({ user_id: 1, clock_in_time: 1 })
  
  # Callbacks
  before_save :calculate_sleep_duration, if: -> { clock_out_changed? && clock_out.present? }

  def clock_out!
    update(clock_out: Time.current) unless clock_out.present?
  end
  
  private
  
  def clock_out_after_clock_in
    if clock_out <= clock_in
      errors.add(:clock_out, "must be after the clock in time")
    end
  end
end
