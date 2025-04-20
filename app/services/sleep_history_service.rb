class SleepHistoryService
    def clock_in_user(user:current_user, clock_in_time: Time.current)
        @sleep_history = SleepHistory.create!(user: @user, clock_in: Time.now)
    
        render json: {
          message: "Clocked in successfully",
          sleep_history: @sleep_history.as_json(methods: :duration)
        }, status: :ok
    end

    def clock_out_user
    end
end
