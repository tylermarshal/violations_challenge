require "minitest/autorun"
require "minitest/pride"
require "pry"


class ViolationsTest < Minitest:Test

  def test_it_exists
    violation = Violation.new({violation_date: "2012-01-03 00:00:00", violation_category: "Garbage and Refuse"})

    assert_intstance_of Violation, violation
  end

end
