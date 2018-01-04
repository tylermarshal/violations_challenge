require './violation'

class Loader

  attr_reader :violations

  def initialize
    @violations = []
  end

  def load_csv
    CSV.readlines('./Violations-2012.csv', headers: true, header_converters: :symbol) do |row|
      violations << Violation.new(row)
    end
  end

  def count_of_violations
    violations.reduce(Hash.new(0)) do |violation|
      violation.
    end
  end


end
