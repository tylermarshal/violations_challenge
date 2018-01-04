require "minitest/autorun"
require "minitest/pride"
require "./lib/violation"
require "pry"


class ViolationsTest < Minitest::Test

  def test_it_exists
    violation = Violation.new({violation_date: "2012-01-03 00:00:00", violation_category: "Garbage and Refuse"})

    assert_instance_of Violation, violation
  end

end
