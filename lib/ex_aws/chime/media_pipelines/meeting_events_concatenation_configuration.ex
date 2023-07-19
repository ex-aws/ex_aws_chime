defmodule ExAws.Chime.MediaPipelines.MeetingEventsConcatenationConfiguration do
  @moduledoc """
  Module representing the Chime MeetingEventsConcatenationConfiguration data type
  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_MeetingEventsConcatenationConfiguration.html
  """

  defstruct [
    :state
  ]

  alias ExAws.Chime.MediaPipelines

  @type t :: %__MODULE__{
          state: MediaPipelines.state()
        }
end
