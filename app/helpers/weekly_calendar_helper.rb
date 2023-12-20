# app/helpers/weekly_calendar_helper.rb

module WeeklyCalendarHelper
    def event_duration_in_hours(event)
         ((event.end_time - event.start_time) / 1.hour).ceil  
       end

    def event_duration_in_half_hours(event)
      ((event.end_time - event.start_time) / 1800).ceil
    end
  
end
