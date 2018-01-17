class AddDetailsToAppointment < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :details, :text
  end
end
