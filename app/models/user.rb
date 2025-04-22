class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  has_many :sleep_history, class_name: 'SleepHistory', dependent: :destroy
  has_many :following, class_name: 'FollowerUser'
  has_many :followers, class_name: 'FollowerUser'
  has_many :followed_users, class_name: 'User', inverse_of: :followers, foreign_key: :followed_id, class_name: 'Follow'
  
end
