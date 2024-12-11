class CreateTickets < ActiveRecord::Migration[7.2]
  def change
    create_table :tickets do |t|
      t.integer :ticket_type
      t.string :summary
      t.text :details
      t.integer :hours

      t.timestamps
    end
  end
end
