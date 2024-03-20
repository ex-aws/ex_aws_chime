defmodule ExAws.Chime.Utils do
  @moduledoc """
  Common helper functions for Chime services
  """

  @type max_results :: pos_integer() | nil
  @type paging_token :: String.t() | nil

  def add_paging(max_results, next_token), do: add_paging(%{}, max_results, next_token)

  def add_paging(map, max_results, next_token) do
    map
    |> maybe_add_param("max-results", max_results)
    |> maybe_add_param("next-token", next_token)
  end

  defp maybe_add_param(map, _name, nil), do: map
  defp maybe_add_param(map, name, value), do: Map.put(map, name, value)
end
