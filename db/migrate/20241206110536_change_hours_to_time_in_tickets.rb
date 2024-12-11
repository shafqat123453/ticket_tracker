class ChangeHoursToTimeInTickets < ActiveRecord::Migration[7.2]
  def change
    change_column :tickets, :hours, :time, default: "00:00:00"
  end
end
