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

    assert_equal 545, loader.violations.count
  end

  def test_it_can_count_violations_per_violation
    loader = Loader.new
    loader.load_csv
    result = {"Garbage and Refuse"=>126, "Unsanitary Conditions"=>83, "Animals and Pests"=>180, "Building Conditions"=>62, "Vegetation"=>67, "Chemical Hazards"=>17, "Biohazards"=>7, "Air Pollutants and Odors"=>2, "Retail Food"=>1}

    assert_equal result, loader.count_of_violations
  end

  def test_it_find_date_of_earliest_violation_per_violation
    loader = Loader.new
    loader.load_csv

    result = {"Garbage and Refuse"=>"01/03/12", "Unsanitary Conditions"=>"01/03/12", "Animals and Pests"=>"01/03/12", "Building Conditions"=>"01/12/12", "Vegetation"=>"02/01/12", "Chemical Hazards"=>"02/08/12", "Biohazards"=>"04/13/12", "Air Pollutants and Odors"=>"12/05/12", "Retail Food"=>"12/20/12"}

    assert_equal result, loader.date_of_earliest_violation
  end

  def test_it_find_date_of_latest_violation_per_violation
    loader = Loader.new
    loader.load_csv

    result = {"Garbage and Refuse"=>"12/21/12", "Unsanitary Conditions"=>"12/19/12", "Animals and Pests"=>"12/28/12", "Building Conditions"=>"12/26/12", "Vegetation"=>"12/05/12", "Chemical Hazards"=>"12/06/12", "Biohazards"=>"12/18/12", "Air Pollutants and Odors"=>"12/19/12", "Retail Food"=>"12/20/12"}

    assert_equal result, loader.date_of_latest_violation
  end

  def test_it_outputs
    loader = Loader.new
    loader.load_csv

    loader.output
  end

end
