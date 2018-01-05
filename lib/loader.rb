require './lib/violation'
require 'csv'

class Loader

  attr_reader :violations

  def initialize
    @violations = []
  end

  def load_csv
    CSV.foreach('Violations-2012.csv', headers: true, header_converters: :symbol) do |row|
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
      if result.has_key?(violation.violation_category) == false
        result[violation.violation_category] = violation.violation_date
      elsif  result[violation.violation_category] > violation.violation_date
        result[violation.violation_category] = violation.violation_date
      end
      result
    end
  end


  def date_of_latest_violation
    violations.reduce(Hash.new(0)) do |result,violation|
      if result.has_key?(violation.violation_category) == false
        result[violation.violation_category] = violation.violation_date
      elsif  result[violation.violation_category] < violation.violation_date
        result[violation.violation_category] = violation.violation_date
      end
      result
    end
  end

  def unique_violations
    violations.map do |violation|
      violation.violation_category
    end.uniq
  end

  def output
    puts "Violation Count Date-of-Earliest-Violation  Date-of-Latest-Violation"
    unique_violations.each do |violation|
      puts "#{violation}  #{count_of_violations[violation]} #{date_of_earliest_violation[violation]}  #{date_of_latest_violation[violation]}"
    end
  end



end
