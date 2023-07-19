defmodule ExAws.Chime.MediaPipelines.SourceConfiguration do
  @moduledoc """
  Module representing the Chime SourceConfiguration data type

  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_SourceConfiguration.html
  """

  defstruct [
    :selected_video_streams
  ]

  @type t :: %__MODULE__{
          selected_video_streams: ExAws.Chime.MediaPipelines.SelectedVideoStreams.t()
        }
end
