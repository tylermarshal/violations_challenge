require './lib/violation'
require 'csv'

class Loader

  attr_reader :violations

  def initialize
    @violations = []
  end

  def load_csv
    CSV.readlines('./Violations-2012.csv', headers: true, header_converters: :symbol) do |row|
      @violations << Violation.new(row)
    end
  end

  def count_of_violations
    violations.reduce(Hash.new(0)) do |result,violation|
      result[violation.violation_category] += 1
      result
    end
  end

  def date_of_earliest_violation
    violations.reduce(Hash.new(0)) do |result,violation|
      if result[violation.violation_categoy] < violation.violation_date
        result[violation.violation_categoy] = violation.violation
      end
      result
    end
  end

  def date_of_latest_violation
    violations.reduce(Hash.new(0)) do |result,violation|
      if result[violation.violation_categoy] > violation.violation_date
        result[violation.violation_categoy] = violation.violation
      end
      result
    end
  end


end
