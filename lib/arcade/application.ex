defmodule Arcade.Application do
  use Application

  def start(_type, _args) do

    Arcade.Network.set_node_name(:arcade)

    children = [
      Arcade.DummyWorker,
    ]

    opts = [strategy: :one_for_one, name: Arcade.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
