require "date"

class Violation

  def initialize(data)
    @violation_date = Date.parse(data[:violation_date])
    @violation_category = data[:violation_category]
  end

end
