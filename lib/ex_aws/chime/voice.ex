defmodule ExAws.Chime.Voice do
  @moduledoc """
  API calls for Amazon Chime SDK Voice
  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_Operations_Amazon_Chime_SDK_Voice.html
  """

  alias ExAws.Chime
  alias ExAws.Chime.Tag
  alias ExAws.Chime.Utils
  alias ExAws.Chime.Voice.BusinessCallingSettings
  alias ExAws.Chime.Voice.Credentials
  alias ExAws.Chime.Voice.EmergencyCallingConfiguration
  alias ExAws.Chime.Voice.GeoMatchParams
  alias ExAws.Chime.Voice.LoggingConfiguration
  alias ExAws.Chime.Voice.Origination
  alias ExAws.Chime.Voice.StreamingConfiguration
  alias ExAws.Chime.Voice.Termination
  alias ExAws.Chime.Voice.UpdatePhoneNumberRequestItem
  alias ExAws.Chime.Voice.VoiceConnectorItem
  alias ExAws.Chime.Voice.VoiceConnectorSettings
  alias ExAws.Operation.JSON
  alias ExAws.Operation.RestQuery

  @type filters :: %{String.t() => String.t()}

  @service :"chime-sdk-voice"

  @spec associate_phone_numbers_with_voice_connector(String.t(), [String.t()], boolean()) ::
          JSON.t()
  def associate_phone_numbers_with_voice_connector(
        voice_connector_id,
        phone_numbers,
        force \\ false
      ) do
    json_request(
      "/voice-connectors/#{voice_connector_id}",
      %{
        operation: "associate-phone-numbers"
      },
      %{
        "E164PhoneNumbers" => phone_numbers,
        "ForceAssociate" => force
      }
    )
  end

  @spec associate_phone_numbers_with_voice_connector_group(String.t(), [String.t()], boolean()) ::
          JSON.t()
  def associate_phone_numbers_with_voice_connector_group(
        voice_connector_group_id,
        phone_numbers,
        force \\ false
      ) do
    json_request(
      "/voice-connector-groups/#{voice_connector_group_id}",
      %{
        operation: "associate-phone-numbers"
      },
      %{
        "E164PhoneNumbers" => phone_numbers,
        "ForceAssociate" => force
      }
    )
  end

  @spec batch_delete_phone_number([String.t()]) :: JSON.t()
  def batch_delete_phone_number(phone_number_ids) do
    json_request(
      "/phone-numbers",
      %{
        operation: "batch-delete"
      },
      %{
        "PhoneNumberIds" => phone_number_ids
      }
    )
  end

  @spec batch_update_phone_number(UpdatePhoneNumberRequestItem.t()) :: JSON.t()
  def batch_update_phone_number(phone_number_updates) do
    json_request(
      "/phone-numbers",
      %{
        operation: "batch-update"
      },
      %{
        "UpdatePhoneNumberRequestItems" => phone_number_updates
      }
    )
  end

  @spec create_phone_number_order([String.t()], String.t()) :: JSON.t()
  def create_phone_number_order(phone_numbers, product_type) do
    json_request(
      "/phone-number-orders",
      %{
        "E164PhoneNumbers" => phone_numbers,
        "ProductType" => product_type
      }
    )
  end

  @spec create_proxy_session(
          [String.t()],
          pos_integer() | nil,
          String.t() | nil,
          GeoMatchParams.t() | nil,
          String.t() | nil,
          String.t() | nil,
          [String.t()]
        ) :: JSON.t()
  def create_proxy_session(
        voice_connector_id,
        capabilities,
        expiry_minutes \\ nil,
        geo_match_level \\ nil,
        geo_match_params \\ nil,
        name \\ nil,
        number_selection_behavior \\ nil,
        participant_phone_numbers
      ) do
    json_request(
      "/voice-connectors/#{voice_connector_id}",
      %{
        "Capabilities" => capabilities,
        "ExpiryMinutes" => expiry_minutes,
        "GeoMatchLevel" => geo_match_level,
        "GeoMatchParams" => geo_match_params,
        "Name" => name,
        "NumberSelectionBehavior" => number_selection_behavior,
        "ParticipantPhoneNumbers" => participant_phone_numbers
      }
    )
  end

  @spec create_voice_connector(String.t() | nil, String.t(), boolean()) :: JSON.t()
  def create_voice_connector(aws_region \\ nil, name, require_encryption) do
    json_request(
      "/voice-connectors",
      %{
        "AwsRegion" => aws_region,
        "Name" => name,
        "RequireEncryption" => require_encryption
      }
    )
  end

  @spec create_voice_connector_group(String.t(), [VoiceConnectorItem.t()] | nil) :: JSON.t()
  def create_voice_connector_group(name, voice_connector_items \\ nil) do
    json_request(
      "/voice-connector-groups",
      %{
        "Name" => name,
        "VoiceConnectorItems" => voice_connector_items
      }
    )
  end

  @spec delete_phone_number(String.t()) :: RestQuery.t()
  def delete_phone_number(phone_number_id) do
    delete_request("/phone-numbers/#{phone_number_id}")
  end

  @spec delete_proxy_session(String.t(), String.t()) :: RestQuery.t()
  def delete_proxy_session(voice_connector_id, proxy_session_id) do
    delete_request("/voice-connectors/#{voice_connector_id}/proxy-sessions/#{proxy_session_id}")
  end

  @spec delete_voice_connector(String.t()) :: RestQuery.t()
  def delete_voice_connector(voice_connector_id) do
    delete_request("/voice-connectors/#{voice_connector_id}")
  end

  @spec delete_voice_connector_emergency_calling_configuration(String.t()) :: RestQuery.t()
  def delete_voice_connector_emergency_calling_configuration(voice_connector_id) do
    delete_request("/voice-connectors/#{voice_connector_id}/emergency-calling-configuration")
  end

  @spec delete_voice_connector_group(String.t()) :: RestQuery.t()
  def delete_voice_connector_group(voice_connector_group_id) do
    delete_request("/voice-connector-groups/#{voice_connector_group_id}")
  end

  @spec delete_voice_connector_origination(String.t()) :: RestQuery.t()
  def delete_voice_connector_origination(voice_connector_id) do
    delete_request("/voice-connectors/#{voice_connector_id}/origination")
  end

  @spec delete_voice_connector_proxy(String.t()) :: RestQuery.t()
  def delete_voice_connector_proxy(voice_connector_id) do
    delete_request("/voice-connectors/#{voice_connector_id}/programmable-numbers/proxy")
  end

  @spec delete_voice_connector_streaming_configuration(String.t()) :: RestQuery.t()
  def delete_voice_connector_streaming_configuration(voice_connector_id) do
    delete_request("/voice-connectors/#{voice_connector_id}/streaming-configuration")
  end

  @spec delete_voice_connector_termination(String.t()) :: RestQuery.t()
  def delete_voice_connector_termination(voice_connector_id) do
    delete_request("/voice-connectors/#{voice_connector_id}/termination")
  end

  @spec delete_voice_connector_termination_credentials(String.t(), [String.t()]) :: JSON.t()
  def delete_voice_connector_termination_credentials(voice_connector_id, usernames) do
    json_request(
      "/voice-connectors/#{voice_connector_id}/termination/credentials",
      %{
        operation: "delete"
      },
      %{
        "Usernames" => usernames
      }
    )
  end

  @spec disassociate_phone_numbers_from_voice_connector(String.t(), [String.t()]) :: JSON.t()
  def disassociate_phone_numbers_from_voice_connector(voice_connector_id, phone_numbers) do
    json_request(
      "/voice-connectors/#{voice_connector_id}",
      %{
        operation: "disassociate-phone-numbers"
      },
      %{
        "E164PhoneNumbers" => phone_numbers
      }
    )
  end

  @spec disassociate_phone_numbers_from_voice_connector_group(String.t(), [String.t()]) ::
          JSON.t()
  def disassociate_phone_numbers_from_voice_connector_group(
        voice_connector_group_id,
        phone_numbers
      ) do
    json_request(
      "/voice-connector-groups/#{voice_connector_group_id}",
      %{
        operation: "disassociate-phone-numbers"
      },
      %{
        "E164PhoneNumbers" => phone_numbers
      }
    )
  end

  @spec get_global_settings :: RestQuery.t()
  def get_global_settings do
    get_request("/settings")
  end

  @spec get_phone_number(String.t()) :: RestQuery.t()
  def get_phone_number(phone_number_id) do
    get_request("/phone-numbers/#{phone_number_id}")
  end

  @spec get_phone_number_order(String.t()) :: RestQuery.t()
  def get_phone_number_order(phone_number_order_id) do
    get_request("/phone-number-orders/#{phone_number_order_id}")
  end

  @spec get_phone_number_settings :: RestQuery.t()
  def get_phone_number_settings do
    get_request("/settings/phone-number")
  end

  @spec get_proxy_session(String.t(), String.t()) :: RestQuery.t()
  def get_proxy_session(voice_connector_id, proxy_session_id) do
    get_request("/voice-connectors/#{voice_connector_id}/proxy-sessoins/#{proxy_session_id}")
  end

  @spec get_voice_connector(String.t()) :: RestQuery.t()
  def get_voice_connector(voice_connector_id) do
    get_request("/voice-connectors/#{voice_connector_id}")
  end

  @spec get_voice_connector_emergency_calling_configuration(String.t()) :: RestQuery.t()
  def get_voice_connector_emergency_calling_configuration(voice_connector_id) do
    get_request("/voice-connectors/#{voice_connector_id}/emergency-calling-configuration")
  end

  @spec get_voice_connector_group(String.t()) :: RestQuery.t()
  def get_voice_connector_group(voice_connector_group_id) do
    get_request("/voice-connector-group/#{voice_connector_group_id}")
  end

  @spec get_voice_connector_logging_configuration(String.t()) :: RestQuery.t()
  def get_voice_connector_logging_configuration(voice_connector_id) do
    get_request("/voice-connectors/#{voice_connector_id}/logging-configuration")
  end

  @spec get_voice_connector_origination(String.t()) :: RestQuery.t()
  def get_voice_connector_origination(voice_connector_id) do
    get_request("/voice-connectors/#{voice_connector_id}/origination")
  end

  @spec get_voice_connector_proxy(String.t()) :: RestQuery.t()
  def get_voice_connector_proxy(voice_connector_id) do
    get_request("/voice-connectors/#{voice_connector_id}/programmable-numbers/proxy")
  end

  @spec get_voice_connector_streaming_configuration(String.t()) :: RestQuery.t()
  def get_voice_connector_streaming_configuration(voice_connector_id) do
    get_request("/voice-connectors/#{voice_connector_id}/streaming-configuration")
  end

  @spec get_voice_connector_termination(String.t()) :: RestQuery.t()
  def get_voice_connector_termination(voice_connector_id) do
    get_request("/voice-connectors/#{voice_connector_id}/termination")
  end

  @spec get_voice_connector_termination_health(String.t()) :: RestQuery.t()
  def get_voice_connector_termination_health(voice_connector_id) do
    get_request("/voice-connectors/#{voice_connector_id}/termination/health")
  end

  @spec list_phone_number_orders(Utils.max_results(), Utils.paging_token()) :: RestQuery.t()
  def list_phone_number_orders(max_results \\ nil, next_token \\ nil) do
    get_request("/phone-number-orders", Utils.add_paging(max_results, next_token))
  end

  @spec list_phone_numbers(filters(), Utils.max_results(), Utils.paging_token()) :: RestQuery.t()
  def list_phone_numbers(filters \\ %{}, max_results \\ nil, next_token \\ nil) do
    get_request("/phone-numbers", Utils.add_paging(filters, max_results, next_token))
  end

  @spec list_proxy_sessions(String.t(), filters(), Utils.max_results(), Utils.paging_token()) ::
          RestQuery.t()
  def list_proxy_sessions(
        voice_connector_id,
        filters \\ %{},
        max_results \\ nil,
        next_token \\ nil
      ) do
    get_request(
      "/voice-connectors/#{voice_connector_id}/proxy-sessions",
      Utils.add_paging(filters, max_results, next_token)
    )
  end

  @spec list_voice_connector_groups(Utils.max_results(), Utils.paging_token()) :: RestQuery.t()
  def list_voice_connector_groups(max_results \\ nil, next_token \\ nil) do
    get_request("/voice-connector-groups", Utils.add_paging(max_results, next_token))
  end

  @spec list_voice_connectors(Utils.max_results(), Utils.paging_token()) :: RestQuery.t()
  def list_voice_connectors(max_results \\ nil, next_token \\ nil) do
    get_request("/voice-connectors", Utils.add_paging(max_results, next_token))
  end

  @spec list_voice_connector_termination_credentials(String.t()) :: RestQuery.t()
  def list_voice_connector_termination_credentials(voice_connector_id) do
    get_request("/voice-connectors/#{voice_connector_id}/termination/credentials")
  end

  @spec put_voice_connector_emergency_calling_configuration(
          String.t(),
          EmergencyCallingConfiguration.t()
        ) :: JSON.t()
  def put_voice_connector_emergency_calling_configuration(
        voice_connector_id,
        emergency_calling_configuration
      ) do
    json_request(
      "/voice-connectors/#{voice_connector_id}/emergency-calling-configuration",
      %{},
      %{
        "EmergencyCallingConfiguration" => emergency_calling_configuration
      },
      :put
    )
  end

  @spec put_voice_connector_logging_configuration(String.t(), LoggingConfiguration.t()) ::
          JSON.t()
  def put_voice_connector_logging_configuration(voice_connector_id, logging_configuration) do
    json_request(
      "/voice-connectors/#{voice_connector_id}/logging-configuration",
      %{},
      %{
        "LoggingConfiguration" => logging_configuration
      },
      :put
    )
  end

  @spec put_voice_connector_origination(String.t(), Origination.t()) :: JSON.t()
  def put_voice_connector_origination(voice_connector_id, origination) do
    json_request(
      "/voice-connectors/#{voice_connector_id}/origination",
      %{},
      %{
        "Origination" => origination
      },
      :put
    )
  end

  @spec put_voice_connector_proxy(String.t(), integer(), boolean() | nil, String.t() | nil, [
          String.t()
        ]) :: JSON.t()
  def put_voice_connector_proxy(
        voice_connector_id,
        default_session_expiry_minutes,
        disabled \\ nil,
        fall_back_phone_number \\ nil,
        phone_number_pool_countries
      ) do
    json_request(
      "/voice-connectors/#{voice_connector_id}/programmable-numbers/proxy",
      %{},
      %{
        "DefaultSessionExpiryMinutes" => default_session_expiry_minutes,
        "Disabled" => disabled,
        "FallBackPhoneNumber" => fall_back_phone_number,
        "PhoneNumberPoolCountries" => phone_number_pool_countries
      },
      :put
    )
  end

  @spec put_voice_connector_streaming_configuration(String.t(), StreamingConfiguration.t()) ::
          JSON.t()
  def put_voice_connector_streaming_configuration(voice_connector_id, streaming_configuration) do
    json_request(
      "/voice-connectors/#{voice_connector_id}/streaming-configuration",
      %{},
      %{
        "StreamingConfiguration" => streaming_configuration
      },
      :put
    )
  end

  @spec put_voice_connector_termination(String.t(), Termination.t()) :: JSON.t()
  def put_voice_connector_termination(voice_connector_id, termination) do
    json_request(
      "/voice-connectors/#{voice_connector_id}/termination",
      %{},
      %{
        "Termination" => termination
      },
      :put
    )
  end

  @spec put_voice_connector_termination_credentials(String.t(), [Credentials.t()] | nil) ::
          JSON.t()
  def put_voice_connector_termination_credentials(voice_connector_id, credentials) do
    json_request(
      "/voice-connectors/#{voice_connector_id}/termination/credentials/operation=put",
      %{
        "Credentials" => credentials
      }
    )
  end

  @spec restore_phone_number(String.t()) :: RestQuery.t()
  def restore_phone_number(phone_number_id) do
    post_request(
      "/phone-numbers/#{phone_number_id}",
      %{
        operation: "restore"
      }
    )
  end

  @spec search_available_phone_numbers(filters(), Utils.max_results() | nil, Utils.paging_token()) ::
          RestQuery.t()
  def search_available_phone_numbers(filters \\ %{}, max_results \\ nil, next_token \\ nil) do
    get_request(
      "/search",
      Utils.add_paging(filters, max_results, next_token)
    )
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

  @spec update_global_settings(BusinessCallingSettings.t(), VoiceConnectorSettings.t()) ::
          JSON.t()
  def update_global_settings(business_calling, voice_connector) do
    json_request(
      "/settings",
      %{},
      %{
        "BusinessCalling" => business_calling,
        "VoiceConnector" => voice_connector
      },
      :put
    )
  end

  @spec update_phone_number(String.t(), String.t() | nil, String.t() | nil) :: JSON.t()
  def update_phone_number(phone_number_id, calling_name \\ nil, product_type \\ nil) do
    json_request(
      "/phone-numbers/#{phone_number_id}",
      %{
        "CallingName" => calling_name,
        "ProductType" => product_type
      }
    )
  end

  @spec update_phone_number_settings(String.t()) :: JSON.t()
  def update_phone_number_settings(calling_name) do
    json_request(
      "/settings/phone-number",
      %{},
      %{
        "CallingName" => calling_name
      },
      :put
    )
  end

  @spec update_proxy_session(String.t(), String.t(), [String.t()], pos_integer() | nil) ::
          JSON.t()
  def update_proxy_session(proxy_session_id, voice_connector_id, capabilities, expiry_minutes) do
    json_request(
      "/voice-connectors/#{voice_connector_id}/proxy-sessions/#{proxy_session_id}",
      %{
        "Capabilities" => capabilities,
        "ExpiryMinutes" => expiry_minutes
      }
    )
  end

  @spec update_voice_connector(String.t(), String.t(), boolean()) :: JSON.t()
  def update_voice_connector(voice_connector_id, name, require_encryption) do
    json_request(
      "/voice-connectors/#{voice_connector_id}",
      %{
        "Name" => name,
        "RequireEncryption" => require_encryption
      }
    )
  end

  @spec update_voice_connector_group(String.t(), String.t(), VoiceConnectorItem.t()) :: JSON.t()
  def update_voice_connector_group(voice_connector_group_id, name, voice_connector_items) do
    json_request(
      "/voice-connectors/#{voice_connector_group_id}",
      %{},
      %{
        "Name" => name,
        "VoiceConnectorItems" => voice_connector_items
      },
      :put
    )
  end

  ### HELPERS

  defp json_request(path, params \\ %{}, data, method \\ :post),
    do: Chime.json_request(path, params, data, method, @service)

  defp delete_request(action), do: Chime.delete_request(action, @service)
  defp get_request(action, params \\ %{}), do: Chime.get_request(action, params, @service)
  defp post_request(action, params), do: Chime.post_request(action, params, @service)
end
