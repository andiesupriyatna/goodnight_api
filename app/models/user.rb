class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  has_many :sleep_history, dependent: :destroy
  has_many :following, class_name: 'Core::FollowerUser'
  has_many :followers, class_name: 'Core::FollowerUser'

end
