require './violation'

class Loader

  def load_csv
    CSV.readlines('./Violations-2012.csv', headers: true, header_converters: :symbol) do |row|
      Violation.new(row)
    end
  end



end
