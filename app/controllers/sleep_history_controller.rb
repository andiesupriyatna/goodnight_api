class SleepHistoryController < ApplicationController
  #URL /sleep_history/clock_in POST
  def clock_in
    result = sleep_history_service.clock_in_user(user:current_user, clock_in_time: Time.current)
    json_response(result, :created)
  end

  #URL /sleep_history/clock_out POST
  def clock_out
    result = sleep_history_service.clock_out_user(user:current_user)
    json_response(result, :created)
  end
end
