class SleepHistoryController < ApplicationController
  #URL /api/sleep_history/clock_in POST
  def clock_in
    result = sleep_history_service.clock_in_user(user:current_user, clock_in_time: Time.current)
    json_response(result, :created)
  end
end
