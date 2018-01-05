require "date"

class Violation

  attr_reader :violation_category, :violation_date

  def initialize(data)
    @violation_date = Date.parse(data[:violation_date]).strftime("%D")
    @violation_category = data[:violation_category]
  end

end
