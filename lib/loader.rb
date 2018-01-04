require './violation'

module Loader

  def load_csv
    CSV.foreach 'customers.csv', headers: true, header_converters: :symbol do |row|
      Violation.new(row)
    end
  end

end
