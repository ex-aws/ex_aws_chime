defmodule ExAws.Chime.Meetings.AttendeeCapabilities do
  @moduledoc """
  Module representing the Chime AttendeeCapabilities data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_meeting-chime_AttendeeCapabilities.html
  """

  defstruct [
    :audio,
    :content,
    :video
  ]

  @type capability_value :: :SendReceive | :Send | :Receive | :None

  @type t :: %__MODULE__{
          audio: capability_value(),
          content: capability_value(),
          video: capability_value()
        }
end
