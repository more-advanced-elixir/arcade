defmodule Arcade.Network do

  def connect_as(component) do
    set_node_name(component)
    connect_to_arcade()
  end

  def set_node_name(component) do
    component
    |> Arcade.node_name_for()
    |> Node.start(:longnames)
  end

  defp connect_to_arcade() do
    Arcade.node_name_for(:arcade)
    |> do_connect()
  end

  defp do_connect(node_name, backoff \\ 500) do
    require Logger

    case Node.connect(node_name) do
      true ->
        Logger.info("Connected to arcade")
        :ok

      false ->
        Logger.info("Waiting for arcade to start")
        :timer.sleep(backoff)
        do_connect(node_name, min(backoff * 2, 10_000))

      :ignored ->
        raise "This node isn't started"
    end
  end
end