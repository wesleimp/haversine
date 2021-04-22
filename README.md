# Haversine [![Elixir CI](https://github.com/wesleimp/haversine/actions/workflows/elixir.yaml/badge.svg)](https://github.com/wesleimp/haversine/actions/workflows/elixir.yaml)

Calculate great circle distances (shortest travel distance on the surface of a spherical Earth) given a two longitude-latitude pairs.

## Installation

```elixir
def deps do
  [
    {:haversine, "~> 0.1.0"}
  ]
end
```

## Usage

Passing two latitude-longitude pais

```elixir
iex> Haversine.distance({-105.343, 39.984}, {-105.534, 39.123})
97129.22118967834

iex> Haversine.distance({-74.00597, 40.71427}, {-70.56656, -33.42628})
8251609.780264794
```

Passing a list of longitude-latitude pairs

```elixir
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
```

## Contributing

Clone this repository anywhere

```sh
git clone git@github.com:wesleimp/haversine.git
```

Install and compile dependencies

```sh
mix do deps.get, deps.compile
```

A good way of making sure everything is all right is running the test suite:

```sh
mix test
```

## LICENSE

[MIT](https://github.com/wesleimp/haversine/blob/main/LICENSE)

---

Special thanks to **[@vnbrs](https://github.com/vnbrs)** 
