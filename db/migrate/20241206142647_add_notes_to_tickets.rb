class AddNotesToTickets < ActiveRecord::Migration[7.2]
  def change
    add_column :tickets, :notes, :text
  end
end
