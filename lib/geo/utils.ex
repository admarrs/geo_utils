defmodule Geo.Utils do

  def nm_to_km(nm), do: nm * 1.852

  def km_to_nm(km), do: km / 1.852

  def degrees_to_radians(degrees), do: degrees * :math.pi() / 180

  def radians_to_degrees(radians), do: radians * 180 / :math.pi()
end
