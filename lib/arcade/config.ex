defmodule Arcade.Config do

  @config %{
    arcade: %{
      node_name: :"arcade@127.0.0.1",
    },

    dictionary: %{
      node_name: :"words@127.0.0.1",
    },

    hangman: %{
      node_name: :"hangman@127.0.0.1",
    },
  }

  def config_for(component) do
    @config[component] || raise("Can't find configuration for #{component}")
  end

  def node_name_for(component) do
    component
    |> config_for()
    |> Map.get(:node_name)
  end
end