class AddAttendancePlaceDurationDateToConcerts < ActiveRecord::Migration[5.2]
  def change
    add_column :concerts, :attendance, :integer
    add_column :concerts, :place, :string
    add_column :concerts, :duration, :integer
  end
end
