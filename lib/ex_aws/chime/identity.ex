defmodule ExAws.Chime.Identity do
  @moduledoc """
  API calls for Amazon Chime SDK Identity
  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_Operations_Amazon_Chime_SDK_Identity.html
  """

  alias ExAws.Chime
  alias ExAws.Chime.Tag
  alias ExAws.Operation.JSON
  alias ExAws.Operation.RestQuery

  @service :"chime-sdk-identity"

  @spec list_tags_for_resource(String.t()) :: RestQuery.t()
  def list_tags_for_resource(resource_arn) do
    get_request("/tags/#{resource_arn}")
  end

  @spec tag_resource(String.t(), [Tag.t()]) :: JSON.t()
  def tag_resource(resource_arn, tags) do
    json_request(
      "/tags",
      %{
        operation: "add"
      },
      %{
        "ResourceARN" => resource_arn,
        "Tags" => tags
      }
    )
  end

  @spec untag_resource(String.t(), [String.t()]) :: JSON.t()
  def untag_resource(resource_arn, tag_keys) do
    json_request(
      "/tags",
      %{
        operation: "delete"
      },
      %{
        "ResourceARN" => resource_arn,
        "TagKeys" => tag_keys
      }
    )
  end

  defp json_request(path, params, data),
    do: Chime.json_request(path, params, data, :post, @service)

  defp get_request(path), do: Chime.get_request(path, %{}, @service)
end
