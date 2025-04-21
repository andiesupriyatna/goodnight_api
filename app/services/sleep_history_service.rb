class SleepHistoryService
    def clock_in_user(user, clock_in_time: Time.current)
        sleep_history = SleepHistory.create!(user: user, clock_in: Time.now)
    
        return {
          message: "Clocked in successfully",
          sleep_history: sleep_history.as_json(methods: :duration)
        }, :ok
    end

    def clock_out_user(user)
        Rails.logger.info(user.sleep_history)
        sleep_history = user.sleep_history.where(clock_out: nil).last
    
        if sleep_history
          sleep_history.update(clock_out: Time.now)
          return {
            message: "Clocked out successfully",
            sleep_history: sleep_history.as_json(methods: :duration)
          }, :ok
        else
          return { error: "No active clock-in found" }, :unprocessable_entity
        end
    end

    def get_list_history(user)
      sleep_history = user.sleep_history.order_by(created_at: :desc)

      return {
          message: "List History",
          sleep_history: sleep_history.as_json(methods: :duration)
        }, :ok
    end
end
