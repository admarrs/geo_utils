defmodule Geo.GreatCircleTest do
  use ExUnit.Case

  alias Geo.GreatCircle

  @earth_radius 6371.009
  @earth_circumference 2 * :math.pi * @earth_radius

  describe "Distance" do

    test "should calc distance for half trip round equator" do
      d = GreatCircle.distance([0.0, 0.0], [180.0, 0.0])
      assert d == @earth_circumference / 2
    end

    test "should calc destination for half trip round equator" do
      [lon, lat] = GreatCircle.destination([0.0, 0.0], 90.0, @earth_circumference / 2)
      assert_in_delta(lon, 180.0, 0.00001)
      assert_in_delta(lat, 0.0, 0.00001)
    end
  end
end
