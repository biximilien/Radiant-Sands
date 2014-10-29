class Venue < ActiveRecord::Base
  before_save :to_lower_case

  def to_s
    "#{name.titleize}"
  end

  private
    def to_lower_case
      self.name = name.downcase
    end
end
