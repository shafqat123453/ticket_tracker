class Ticket < ApplicationRecord
  after_create :update_ticket_title
  
  enum ticket_type: { story: 0, feature: 1, support: 2, other: 3}
      
  validates :ticket_type, presence: true
  validates :summary, presence: { message: "Please fill the summary field" }

      
  #class Ticket < ApplicationRecord
  # Format hours into days and remaining hours
  def formatted_time
    return "0 hours" if hours.nil? || hours.zero?
  
    total_minutes = (hours.to_f * 60).to_i # Convert total hours to minutes
    days = total_minutes / (24 * 60) # Calculate total days
    remaining_minutes = total_minutes % (24 * 60) # Remaining minutes after extracting days
    remaining_hours = remaining_minutes / 60 # Calculate hours from remaining minutes
    minutes = remaining_minutes % 60 # Calculate the leftover minutes
  
    formatted = []
    formatted << "#{days}d" if days > 0
    formatted << "#{remaining_hours} hour#{'s' if remaining_hours != 1}" if remaining_hours > 0
    formatted << "#{minutes} minute#{'s' if minutes != 1}" if minutes > 0
  
    formatted.join(" ")
  end
  

  def update_ticket_title
    self.update(summary: "#{self.id} #{self.summary}")
  end

end



