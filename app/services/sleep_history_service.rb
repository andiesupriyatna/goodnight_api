class SleepHistoryService
    def clock_in_user(user:current_user, clock_in_time: Time.current)
        sleep_history = SleepHistory.create!(user: user, clock_in: Time.now)
    
        render json: {
          message: "Clocked in successfully",
          sleep_history: sleep_history.as_json(methods: :duration)
        }, status: :ok
    end

    def clock_out_user(user)
        sleep_history = user.sleep_histories.where(clock_out: nil).last
    
        if sleep_history
          sleep_history.update(clock_out: Time.now)
          render json: {
            message: "Clocked out successfully",
            sleep_history: sleep_history.as_json(methods: :duration)
          }, status: :ok
        else
          render json: { error: "No active clock-in found" }, status: :unprocessable_entity
        end
    end
end
