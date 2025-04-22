class FollowerUser
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :follower, class_name: 'User', inverse_of: :follows_as_follower
  belongs_to :followed, class_name: 'User', inverse_of: :follows_as_followed

  index({ follower_id: 1, followed_id: 1 }, { unique: true })
  index({ follower_id: 1 })
  index({ followed_id: 1 })
end
