defmodule ExAws.Chime.Meetings do
  @moduledoc """
  API calls for Amazon Chime SDK Meetings
  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_Operations_Amazon_Chime_SDK_Meetings.html
  """

  alias ExAws.Chime
  alias ExAws.Chime.Meetings.CreateAttendeeRequestItem
  alias ExAws.Chime.Meetings.EngineTranscribeSettings
  alias ExAws.Chime.Meetings.MeetingNotificationConfiguration
  alias ExAws.Chime.Tag
  alias ExAws.Chime.Utils
  alias ExAws.Operation.JSON
  alias ExAws.Operation.RestQuery

  @service :"chime-sdk-meetings"

  @spec batch_create_attendee(String.t(), [CreateAttendeeRequestItem.t()]) :: JSON.t()
  def batch_create_attendee(meeting_id, attendee_requests) do
    json_request(
      "/meetings/#{meeting_id}/attendees",
      %{
        operation: "batch-create"
      },
      %{
        "Attendees" => attendee_requests
      }
    )
  end

  @spec create_attendee(String.t(), CreateAttendeeRequestItem.t()) :: JSON.t()
  def create_attendee(meeting_id, create_attendee) do
    json_request(
      "/meetings/#{meeting_id}/attendees",
      create_attendee
    )
  end

  @spec create_meeting(
          String.t() | nil,
          String.t() | nil,
          String.t() | nil,
          MeetingNotificationConfiguration.t() | nil,
          [Tag.t()] | nil
        ) :: JSON.t()
  def create_meeting(
        external_meeting_id \\ nil,
        media_region \\ nil,
        meeting_host_id \\ nil,
        notifications_configuration \\ nil,
        tags \\ nil
      ) do
    json_request(
      "/meetings",
      %{
        "ClientRequestToken" => UUID.uuid4(),
        "ExternalMeetingId" => external_meeting_id,
        "MediaRegion" => media_region,
        "MeetingHostId" => meeting_host_id,
        "NotificationsConfiguration" => notifications_configuration,
        "Tags" => tags
      }
    )
  end

  @spec create_meeting_with_attendees(
          [CreateAttendeeRequestItem.t()] | nil,
          String.t(),
          String.t() | nil,
          String.t() | nil,
          MeetingNotificationConfiguration.t() | nil,
          [Tag.t()] | nil
        ) :: JSON.t()
  def create_meeting_with_attendees(
        attendees \\ nil,
        external_meeting_id,
        media_region \\ nil,
        meeting_host_id \\ nil,
        notifications_configuration \\ nil,
        tags \\ nil
      ) do
    json_request(
      "/meetings",
      %{
        operation: "create-attendees"
      },
      %{
        "Attendees" => attendees,
        "ClientRequestToken" => UUID.uuid4(),
        "ExternalMeetingId" => external_meeting_id,
        "MediaRegion" => media_region,
        "MeetingHostId" => meeting_host_id,
        "NotificationsConfiguration" => notifications_configuration,
        "Tags" => tags
      }
    )
  end

  @spec delete_attendee(String.t(), String.t()) :: RestQuery.t()
  def delete_attendee(meeting_id, attendee_id) do
    delete_request("/meetings/#{meeting_id}/attendees/#{attendee_id}")
  end

  @spec delete_meeting(String.t()) :: RestQuery.t()
  def delete_meeting(meeting_id) do
    delete_request("/meetings/#{meeting_id}")
  end

  @spec get_attendee(String.t(), String.t()) :: RestQuery.t()
  def get_attendee(meeting_id, attendee_id) do
    get_request("/meetings/#{meeting_id}/attendees/#{attendee_id}")
  end

  @spec get_meeting(String.t()) :: RestQuery.t()
  def get_meeting(meeting_id) do
    get_request("/meetings/#{meeting_id}")
  end

  @spec list_attendees(String.t(), Utils.max_results(), Utils.paging_token()) :: RestQuery.t()
  def list_attendees(meeting_id, max_results \\ nil, next_token \\ nil) do
    get_request("/meetings/#{meeting_id}/attendees", Utils.add_paging(max_results, next_token))
  end

  @spec start_meeting_transcription(String.t(), EngineTranscribeSettings.t()) :: JSON.t()
  def start_meeting_transcription(meeting_id, engine_transcribe_settings) do
    json_request(
      "/meetings/#{meeting_id}/transcription",
      %{
        operation: "start"
      },
      %{
        "TranscriptionConfiguration" => %{
          "EngineTranscribeSettings" => engine_transcribe_settings
        }
      }
    )
  end

  @spec stop_meeting_transcription(String.t()) :: JSON.t()
  def stop_meeting_transcription(meeting_id) do
    json_request(
      "/meetings/#{meeting_id}/transcription",
      %{
        operation: "stop"
      },
      %{}
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

  ### HELPERS
  defp json_request(path, data, method \\ :post),
    do: Chime.json_request(path, data, method, @service)

  defp delete_request(path), do: Chime.delete_request(path, @service)

  defp get_request(path, params \\ %{}), do: Chime.get_request(path, params, @service)
end
