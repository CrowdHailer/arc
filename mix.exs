defmodule Arc.Mixfile do
  use Mix.Project

  @version "0.6.0"

  def project do
    [app: :arc,
     version: @version,
     elixir: "~> 1.0",
     deps: deps,

    # Hex
     description: description,
     package: package]
  end

  defp description do
    """
    Flexible file upload and attachment library for Elixir.
    """
  end

  defp package do
    [maintainers: ["Sean Stavropoulos"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => "https://github.com/stavro/arc"},
     files: ~w(mix.exs README.md CHANGELOG.md lib)]
  end

  def application do
    [
      applications: [
        :logger,
        :httpoison,
      ] ++ applications(Mix.env)
    ]
  end

  def applications(:test), do: [:ex_aws, :poison]
  def applications(_), do: []

  defp deps do
    [
      {:httpoison, "~> 0.8"}, # Required for downloading remote files
      {:ex_aws, "~> 1.0.0", optional: true},
      {:mock, "~> 0.1.1", only: :test},
      {:ex_doc, "~> 0.14", only: :dev},

      # If using Amazon S3:
      {:poison, "~> 2.0 or ~> 3.0", optional: true},
      {:sweet_xml, "~> 0.5", optional: true}
    ]
  end
end
