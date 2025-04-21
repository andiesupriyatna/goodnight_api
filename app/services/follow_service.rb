class FollowService
    def follow_user(user:, followed_id:)
      user_to_follow = User.find(followed_id)
  
      if user == user_to_follow
        return { error: "You can't follow yourself" }, :unprocessable_entity
      end
  
      existing_follow = FollowerUser.where(follower: user, followed: user_to_follow).first
      if existing_follow
        return { error: "Already following this user" }, :unprocessable_entity
      end
  
      follow = FollowerUser.new(follower: user, followed: user_to_follow)
  
      if follow.save
        return { message: "Followed successfully", follow: follow }, :ok
      else
        return { error: follow.errors.full_messages }, :unprocessable_entity
      end
    end

    def unfollow_user()
        
    end
end
