defmodule Haversine do
  @moduledoc ~S"""
  Calculate great circle distances (shortest travel distance on the surface of
  a spherical Earth) given a two longitude-latitude pairs. This is an implementation
  of the [Haversine formula](https://en.wikipedia.org/wiki/Haversine_formula)
  """

  @pi_over_180 :math.pi() / 180.0
  @radius_of_earth_meters 6_371_008.8

  @type coordinates :: {float(), float()}

  @spec distance(coordinates(), coordinates() | list(coordinates()) | list() | list(any)) ::
          float()
  @doc """
  Returns the great circle distance in meters between two points in the form of
  `{longitude, latitude}`.

  ## Examples

      iex> Haversine.distance({-105.343, 39.984}, {-105.534, 39.123})
      97129.22118967834

      iex> Haversine.distance({-74.00597, 40.71427}, {-70.56656, -33.42628})
      8251609.780264794

      iex> Haversine.distance([
      ...>    {-96.796667, 32.775833},
      ...>    {126.967583, 37.566776},
      ...>    {151.215158, -33.857406},
      ...>    {55.274180, 25.197229},
      ...>    {6.942661, 50.334057},
      ...>    {-97.635926, 30.134442}
      ...>  ])
      44728827.84910634

      iex> Haversine.distance([])
      0.0

      iex> Haversine.distance([{-96.796667, 32.775833}])
      0.0
  """
  def distance({lon1, lat1}, {lon2, lat2}) do
    radial_arcs_latitude = :math.sin((lat2 - lat1) * @pi_over_180 / 2)
    radial_arcs_longitude = :math.sin((lon2 - lon1) * @pi_over_180 / 2)

    factor =
      radial_arcs_latitude * radial_arcs_latitude +
        radial_arcs_longitude * radial_arcs_longitude *
          :math.cos(lat1 * @pi_over_180) * :math.cos(lat2 * @pi_over_180)

    2 * :math.atan2(:math.sqrt(factor), :math.sqrt(1 - factor)) * @radius_of_earth_meters
  end

  def distance([]), do: 0.0
  def distance([_]), do: 0.0

  def distance([point_1, point_2 | tail]),
    do: distance(point_1, point_2) + distance([point_2 | tail])
end
