defmodule GeoUtils.CoordsTest do
  use ExUnit.Case

  describe "geo utils" do

    test "get quakey for tile" do
      quad = GeoUtils.Coords.quadkey({486, 332}, 10)
      assert quad == "0313102310"
    end

    test "get tile containing lon, lat at zoom" do
      tile = GeoUtils.Coords.tile(-1.0, 52.0, 10)
      assert tile == {509, 338}
    end

    test "get mercator x, y at for lon, lat at zoom" do
      x = GeoUtils.Coords.mercator_x(10, -1.0)
      y = GeoUtils.Coords.mercator_y(10, 52.0)
      assert {x, y} == {130343.82222222222, 86590.11990239238}
    end
  end

end
