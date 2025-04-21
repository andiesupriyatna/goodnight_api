class FollowerUser
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :follower, class_name: 'User', inverse_of: :follows_as_follower
  belongs_to :followed, class_name: 'User', inverse_of: :follows_as_followed
end
