class SleepHistoryController < ApplicationController
  before_action :find_user

  def index
    sleep_history_service = SleepHistoryService.new
    response_json, status = sleep_history_service.get_list_history(@user)
    render json: response_json,status: status
  end
  
  #URL /sleep_history/clock_in POST
  def clock_in
    sleep_history_service = SleepHistoryService.new
    response_json, status = sleep_history_service.clock_in_user(user:@user, clock_in_time: Time.current)
    render json: response_json,status: status
  end

  #URL /sleep_history/clock_out POST
  def clock_out
    sleep_history_service = SleepHistoryService.new
    response_json, status = sleep_history_service.clock_out_user(@user)
    render json: response_json,status: status
  #  json_response(result, :created)
  end


  private
  def find_user
    @user = User.find(params[:user_id])
  end
end
