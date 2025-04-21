class FollowsController < ApplicationController
    before_action :find_user
  
    def follow
      follow_service = FollowService.new
      response_json, status = follow_service.follow_user(user: @user, followed_id: params[:followed_id])
      render json: response_json, status: status
    end
  
    def unfollow
     
    end
  
    def following
      
    end
  
    private
  
    def find_user
      @user = User.find(params[:user_id])
    end
  end
  