defmodule Arcade.MixProject do
  use Mix.Project

  def project do
    [
      app: :arcade,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Arcade.Application, []}
    ]
  end

  defp deps do
    [
      { :swarm, "~> 3.0" },
    ]
  end
end
