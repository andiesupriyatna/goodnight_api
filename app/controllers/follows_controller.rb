class FollowsController < ApplicationController
    before_action :find_user
  
    def follow
      follow_service = FollowService.new
      response_json, status = follow_service.follow_user(user: @user, followed_id: params[:followed_id])
      render json: response_json, status: status
    end
  
    def unfollow
        follow_service = FollowService.new
        response_json, status = follow_service.unfollow_user(user: @user, followed_id: params[:followed_id])
        render json: response_json, status: status
    end
  
    def following
        follow_service = FollowService.new
        response_json, status = follow_service.following_list(@user)
        render json: response_json, status: status
    end
  
    private
  
    def find_user
      @user = User.find(params[:user_id])
    end
  end
  