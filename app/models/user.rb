class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  has_many :sleep_history, dependent: :destroy

end
