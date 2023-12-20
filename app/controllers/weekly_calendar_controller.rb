class WeeklyCalendarController < ApplicationController
  
    def show
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])

      @events = Event.where(start_time: start_date..end_date)

      # Handle events with start and end times ranging from 30 minutes to an hour
    # @events.each do |event|
    #   event.start_time = event.start_time.beginning_of_hour
    #   event.end_time = event.end_time.end_of_hour
    # end

      # Handle multiple events in the same time slot
      #@events = @events.group_by { |event| [event.start_time, event.end_time] }
    end

end
