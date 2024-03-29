defmodule ToyAlchemist.MixProject do
  use Mix.Project

  def project do
    [
      app: :toy_alchemist,
      version: "0.0.1",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    []
  end

  defp escript do
    [
      main_module: ToyAlchemist.CLI,
      name: :alchemist
    ]
  end
end
