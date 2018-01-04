require "minitest/autorun"
require "minitest/pride"
require "./lib/loader"
require "pry"


class LoaderTest < Minitest::Test

  def test_it_exists
    loader = Loader.new

    assert_instance_of Loader, loader
  end

  def test_it_can_load_csv
    loader = Loader.new
    loader.load_csv

    require "pry"; binding.pry
  end

  def test_it_can_count_violations

  end

end
