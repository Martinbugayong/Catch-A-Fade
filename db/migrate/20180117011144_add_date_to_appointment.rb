class AddDateToAppointment < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :date, :string
  end
end
