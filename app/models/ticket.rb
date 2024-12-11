class Ticket < ApplicationRecord
        enum ticket_type: {
          story: 0,
          feature: 1,
          support: 2,
          other: 3
        }
      
        validates :ticket_type, presence: true
        validates :summary, presence: true
      
        #class Ticket < ApplicationRecord
  # Format hours into days and remaining hours
  def formatted_time
    return "0 hours" if hours.nil? || hours.zero?

    total_hours = hours.to_f # Ensure it's a Float
    days = (total_hours / 24).to_i
    remaining_hours = (total_hours % 24).to_i

    formatted = []
    formatted << "#{days}d" if days > 0
    formatted << "#{remaining_hours} hour#{'s' if remaining_hours != 1}" if remaining_hours > 0

    formatted.join(" ")
  end

      

    end



