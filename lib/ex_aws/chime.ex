defmodule ExAws.Chime do
  @moduledoc """
  Chime API calls are now broken up into their various services. This module is a
  top level helper.

  @See ExAws.Chime.Meetings, ExAws.Chime.Voice, ExAws.Chime.Identity, and ExAws.Chime.MediaPipelines
  for the different services.
  """

  alias ExAws.Operation.JSON
  alias ExAws.Operation.RestQuery

  def delete_request(action, service), do: rest_request(action, :delete, service)
  def get_request(action, params, service), do: rest_request(action, params, :get, service)
  def post_request(action, params, service), do: rest_request(action, params, :post, service)

  defp rest_request(action, params \\ %{}, method, service) do
    %RestQuery{
      http_method: method,
      path: action,
      params: params,
      service: service,
      parser: &parse/2
    }
  end

  def json_request(path, params \\ %{}, data, method \\ :post, service) do
    %JSON{
      http_method: method,
      params: params,
      path: path,
      data: normalise_data(data),
      service: service
    }
  end

  defp parse({:ok, %{body: ""}}, _), do: {:ok, :ok}

  defp parse({:ok, %{body: body}}, _) do
    Jason.decode(body)
  end

  defp parse({:error, error}, _), do: {:error, error}

  def normalise_data(struct) when is_map(struct) do
    struct
    |> Map.drop([:__struct__])
    |> Enum.reduce(%{}, fn
      {_k, nil}, acc -> acc
      {k, v}, acc when is_atom(k) -> Map.put(acc, Macro.camelize(to_string(k)), normalise_data(v))
      {k, v}, acc -> Map.put(acc, k, normalise_data(v))
    end)
  end

  def normalise_data(v) when is_atom(v), do: to_string(v)
  def normalise_data(v) when is_list(v), do: Enum.map(v, &normalise_data/1)
  def normalise_data(v) when is_binary(v), do: v
  def normalise_data(v) when is_integer(v), do: v
  def normalise_data(v) when is_boolean(v), do: v
end
