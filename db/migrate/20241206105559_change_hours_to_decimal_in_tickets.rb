class ChangeHoursToDecimalInTickets < ActiveRecord::Migration[7.2]
  def change
    change_column :tickets, :hours, :decimal, precision: 5, scale: 2, default: 0.00

  end
end
