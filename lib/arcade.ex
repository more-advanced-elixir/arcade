defmodule Arcade do

  defdelegate config_for(component),    to: Arcade.Config

  defdelegate node_name_for(component), to: Arcade.Config

  defdelegate connect_as(component),    to: Arcade.Network

end
