defmodule ExAws.Chime.MediaPipelines.SelectedVideoStreams do
  @moduledoc """
  Module representing the Chime SelectedVideoStreams data type

  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_SelectedVideoStreams.html
  """

  defstruct [
    :attendee_ids,
    :external_user_ids
  ]

  @type t :: %__MODULE__{
          attendee_ids: [String.t()] | nil,
          external_user_ids: [String.t()] | nil
        }
end
