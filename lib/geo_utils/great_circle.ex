defmodule GeoUtils.GreatCircle do

  alias GeoUtils.Convert

  @earth_radius 6371.009

  def destination([lon, lat], bearing, distance) do
    # Calculate the Great Circle (spherical geometry) destination
    # given start point [lon, lat], course bearing
    # and distance travelled in Kilometres
    lon_r = Convert.degrees_to_radians(lon)
    lat_r = Convert.degrees_to_radians(lat)
    bearing_r = Convert.degrees_to_radians(bearing)

    d_div_r = distance / @earth_radius # Earth radius in Km

    lat2_r = :math.asin(
      :math.sin(lat_r)*:math.cos(d_div_r) +
      :math.cos(lat_r)*:math.sin(d_div_r)*:math.cos(bearing_r))
    lon2_r = lon_r + :math.atan2(
      :math.sin(bearing_r)*:math.sin(d_div_r)*:math.cos(lat_r),
      :math.cos(d_div_r) - :math.sin(lat_r)*:math.sin(lat2_r)
    )
    [Convert.radians_to_degrees(lon2_r), Convert.radians_to_degrees(lat2_r)]
  end

  def distance([lon1, lat1], [lon2, lat2]) do
    # Calculate Great Circle (spherical geometry) distance
    # in Km between two points
    lat1_r = Convert.degrees_to_radians(lat1)
    lon1_r = Convert.degrees_to_radians(lon1)
    lat2_r = Convert.degrees_to_radians(lat2)
    lon2_r = Convert.degrees_to_radians(lon2)

    sin_lat1 = :math.sin(lat1_r)
    cos_lat1 = :math.cos(lat1_r)
    sin_lat2 = :math.sin(lat2_r)
    cos_lat2 = :math.cos(lat2_r)

    delta_lon = lon2_r - lon1_r
    cos_delta_lon = :math.cos(delta_lon)
    sin_delta_lon = :math.sin(delta_lon)

    d = :math.atan2(
          :math.sqrt((cos_lat2 * sin_delta_lon) ** 2 +
                    (cos_lat1 * sin_lat2 -
                      sin_lat1 * cos_lat2 * cos_delta_lon) ** 2),
          sin_lat1 * sin_lat2 + cos_lat1 * cos_lat2 * cos_delta_lon
        )

    d * @earth_radius
  end


end
