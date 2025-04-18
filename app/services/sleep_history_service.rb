class SleepHistoryService
    def clock_in_user(user:current_user, clock_in_time: Time.current)
        result = current_user.sleep_records.create!(clock_in_time: Time.current)
        all_clock_ins = current_user.sleep_records.order_by(created_at: :asc)
        return json_response(@all_clock_ins, :created)
    end
end
