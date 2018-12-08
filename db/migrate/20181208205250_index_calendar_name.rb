class IndexCalendarName < ActiveRecord::Migration[5.2]
  def change
    add_index :calendars, :name
  end
end
