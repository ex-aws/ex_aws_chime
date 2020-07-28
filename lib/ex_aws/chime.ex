defmodule ExAws.Chime do
  @moduledoc """
  See https://docs.aws.amazon.com/chime/latest/APIReference
  """

  alias ExAws.Operation.JSON
  alias ExAws.Operation.RestQuery

  # TODO:
  # * Add all actions
  # * Add tag support where applicable
  # * Add max results/paging to List actions

  ### AWS Chime API
  def associate_phone_numbers_with_voice_connector(
        voice_connector_id,
        phone_numbers,
        force \\ false
      ) do
    json_request(
      "/voice-connectors/#{voice_connector_id}?operation=associate-phone-numbers",
      %{
        "E164PhoneNumbers" => phone_numbers,
        "ForceAssociate" => force
      }
    )
  end

  def associate_phone_numbers_with_voice_connector_group(
        voice_connector_group_id,
        phone_numbers,
        force \\ false
      ) do
    json_request(
      "/voice-connector-groups/#{voice_connector_group_id}?operation=associate-phone-numbers",
      %{
        "E164PhoneNumbers" => phone_numbers,
        "ForceAssociate" => force
      }
    )
  end

  def associate_phone_number_with_user(account_id, user_id, phone_number) do
    json_request(
      "/accounts/#{account_id}/users/#{user_id}?operation=associate-phone-numbers",
      %{
        "E164PhoneNumber" => phone_number
      }
    )
  end

  def associate_signin_delegate_groups_with_account(account_id, group_names) do
    json_request(
      "/accounts/#{account_id}?operation=associate-signin-delegate-groups",
      %{
        "SigninDelegateGroups" => Enum.map(group_names, &%{"GroupName" => &1})
      }
    )
  end

  def batch_create_attendee(meeting_id, attendee_requests) do
    json_request(
      "/meetings/#{meeting_id}/attendees?operation=batch-create",
      %{
        "Attendees" => structs_to_objs(attendee_requests)
      }
    )
  end

  def batch_create_room_membership(account_id, room_id, memberships) do
    json_request(
      "/accounts/#{account_id}/rooms/#{room_id}/memberships?operation=batch-create",
      %{
        "MembershipItemList" => structs_to_objs(memberships)
      }
    )
  end

  def batch_delete_phone_number(phone_number_ids) do
    json_request(
      "/phone-numbers?operation=batch-delete",
      %{
        "PhoneNumberIds" => phone_number_ids
      }
    )
  end

  def batch_suspend_user(account_id, user_ids) do
    json_request(
      "/accounts/#{account_id}/users?operation=suspend",
      %{
        "UserIdList" => user_ids
      }
    )
  end

  def batch_unsuspend_user(account_id, user_ids) do
    json_request(
      "/accounts/#{account_id}/users?operation=unsuspend",
      %{
        "UserIdList" => user_ids
      }
    )
  end

  def batch_update_phone_number(phone_number_updates) do
    json_request(
      "/phone-numbers?operation=batch-update",
      %{
        "UpdatePhoneNumberRequestItems": structs_to_objs(phone_number_updates)
      }
    )
  end

  def batch_update_user() do
    # TODO
  end

  def create_account() do
    # TODO
  end

  def create_attendee(meeting_id, create_attendee, _opts \\ []) do
    json_request(
      "/meetings/#{meeting_id}/attendees",
      %{
        "ExternalUserId" => create_attendee.external_user_id,
        "Tags" => create_attendee.tags
      }
    )
  end

  def create_bot() do
    # TODO
  end

  def create_meeting(meeting_id, opts \\ []) do
    data =
      %{
        "ClientRequestToken" => UUID.uuid4(),
        "ExternalMeetingId" => meeting_id
      }
      |> add_json_opts([meeting_region: "MeetingRegion"], opts)

    json_request("/meetings", data)
  end

  def create_meeting_with_attendees() do
    # TODO
  end

  def create_phone_number_order() do
    # TODO
  end

  def create_proxy_session() do
    # TODO
  end

  def create_room() do
    # TODO
  end

  def create_room_membership() do
    # TODO
  end

  def create_user() do
    # TODO
  end

  def create_voice_connector() do
    # TODO
  end

  def create_voice_connector_group() do
    # TODO
  end

  def delete_account() do
    # TODO
  end

  def delete_attendee(meeting_id, attendee_id, opts \\ []) do
    rest_request("/meetings/#{meeting_id}/attendees/#{attendee_id}", :delete, opts)
  end

  def delete_events_configuration() do
    # TODO
  end

  def delete_meeting(meeting_id) do
    rest_request("/meetings/#{meeting_id}", :delete, [])
  end

  def delete_phone_number() do
    # TODO
  end

  def delete_proxy_session() do
    # TODO
  end

  def delete_room() do
    # TODO
  end

  def delete_room_membership() do
    # TODO
  end

  def delete_voice_connector() do
    # TODO
  end

  def delete_voice_connector_emergency_calling_configuration() do
    # TODO
  end

  def delete_voice_connector_group() do
    # TODO
  end

  def delete_voice_connector_origination() do
    # TODO
  end

  def delete_voice_connector_proxy() do
    # TODO
  end

  def delete_voice_connector_streaming_configuration() do
    # TODO
  end

  def delete_voice_connector_termination() do
    # TODO
  end

  def delete_voice_connector_termination_credentials() do
    # TODO
  end

  def disassociate_phone_number_from_user() do
    # TODO
  end

  def disassociate_phone_numbers_from_voice_connector() do
    # TODO
  end

  def disassociate_phone_numbers_from_voice_connector_group() do
    # TODO
  end

  def disassociate_signin_delegate_groups_from_account() do
    # TODO
  end

  def get_account() do
    # TODO
  end

  def get_account_settings() do
    # TODO
  end

  def get_attendee() do
    # TODO
  end

  def get_bot() do
    # TODO
  end

  def get_events_configuration() do
    # TODO
  end

  def get_global_settings() do
    # TODO
  end

  def get_meeting() do
    # TODO
  end

  def get_phone_number() do
    # TODO
  end

  def get_phone_number_order() do
    # TODO
  end

  def get_phone_number_settings() do
    # TODO
  end

  def get_proxy_session() do
    # TODO
  end

  def get_retention_settings() do
    # TODO
  end

  def get_room() do
    # TODO
  end

  def get_user() do
    # TODO
  end

  def get_user_settings() do
    # TODO
  end

  def get_voice_connector() do
    # TODO
  end

  def get_voice_connector_emergency_calling_configuration() do
    # TODO
  end

  def get_voice_connector_group() do
    # TODO
  end

  def get_voice_connector_logging_configuration() do
    # TODO
  end

  def get_voice_connector_origination() do
    # TODO
  end

  def get_voice_connector_proxy() do
    # TODO
  end

  def get_voice_connector_streaming_configuration() do
    # TODO
  end

  def get_voice_connector_termination() do
    # TODO
  end

  def get_voice_connector_termination_health() do
    # TODO
  end

  def invite_users() do
    # TODO
  end

  def list_accounts(opts \\ []) do
    rest_request("/accounts", opts)
  end

  def list_attendees(meeting_id, opts \\ []) do
    rest_request("/meetings/#{meeting_id}/attendees", opts)
  end

  def list_attendee_tags() do
    # TODO
  end

  def list_bots() do
    # TODO
  end

  def list_meetings(opts \\ []) do
    rest_request("/meetings", opts)
  end

  def list_meeting_tags() do
    # TODO
  end

  def list_phone_number_orders() do
    # TODO
  end

  def list_phone_numbers() do
    # TODO
  end

  def list_proxy_sessions() do
    # TODO
  end

  def list_room_memberships() do
    # TODO
  end

  def list_rooms() do
    # TODO
  end

  def list_tags_for_resource() do
    # TODO
  end

  def list_users() do
    # TODO
  end

  def list_voice_connector_groups() do
    # TODO
  end

  def list_voice_connectors() do
    # TODO
  end

  def list_voice_connector_termination_credentials() do
    # TODO
  end

  def logout_user() do
    # TODO
  end

  def put_events_configuration() do
    # TODO
  end

  def put_retention_settings() do
    # TODO
  end

  def put_voice_connector_emergency_calling_configuration() do
    # TODO
  end

  def put_voice_connector_logging_configuration() do
    # TODO
  end

  def put_voice_connector_origination() do
    # TODO
  end

  def put_voice_connector_proxy() do
    # TODO
  end

  def put_voice_connector_streaming_configuration() do
    # TODO
  end

  def put_voice_connector_termination() do
    # TODO
  end

  def put_voice_connector_termination_credentials() do
    # TODO
  end

  def redact_conversation_message() do
    # TODO
  end

  def redact_room_message() do
    # TODO
  end

  def regenerate_security_token() do
    # TODO
  end

  def reset_personal_pin() do
    # TODO
  end

  def restore_phone_number() do
    # TODO
  end

  def search_available_phone_numbers() do
    # TODO
  end

  def tag_attendee() do
    # TODO
  end

  def tag_meeting() do
    # TODO
  end

  def tag_resource() do
    # TODO
  end

  def untag_attendee() do
    # TODO
  end

  def untag_meeting() do
    # TODO
  end

  def untag_resource() do
    # TODO
  end

  def update_account() do
    # TODO
  end

  def update_account_settings() do
    # TODO
  end

  def update_bot() do
    # TODO
  end

  def update_global_settings() do
    # TODO
  end

  def update_phone_number() do
    # TODO
  end

  def update_phone_number_settings() do
    # TODO
  end

  def update_proxy_session() do
    # TODO
  end

  def update_room() do
    # TODO
  end

  def update_room_membership() do
    # TODO
  end

  def update_user() do
    # TODO
  end

  def update_user_settings() do
    # TODO
  end

  def update_voice_connector() do
    # TODO
  end

  def update_voice_connector_group() do
    # TODO
  end

  ### HELPERS

  defp add_json_opts(base, opts_list, opts) do
    Enum.reduce(opts_list, base, fn {k, d}, acc ->
      case Keyword.get(opts, k) do
        nil -> acc
        value -> Map.put(acc, d, value)
      end
    end)
  end

  defp rest_request(action, method \\ :get, params \\ %{}, _opts) do
    %RestQuery{
      http_method: method,
      path: action,
      params: params,
      service: :chime,
      parser: &parse/2
    }
  end

  defp json_request(path, data) do
    %JSON{
      path: path,
      data: data,
      service: :chime
    }
  end

  defp parse({:ok, %{body: ""}}, _), do: {:ok, :ok}

  defp parse({:ok, %{body: body}}, _) do
    Jason.decode(body)
  end

  def structs_to_objs(structs), do: Enum.map(structs, &struct_to_obj/1)

  def struct_to_obj(struct) do
    struct
    |> Map.drop([:__struct__])
    |> Enum.map(fn {k, v} -> {Macro.camelize(to_string(k)), v} end)
    |> Enum.into(%{})
  end
end