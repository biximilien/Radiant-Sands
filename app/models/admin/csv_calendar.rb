class Admin::CsvCalendar < ActiveRecord::Base
  has_one_attached :file
end
