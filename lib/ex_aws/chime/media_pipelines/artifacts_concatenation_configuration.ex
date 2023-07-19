defmodule ExAws.Chime.MediaPipelines.ArtifactsConcatenationConfiguration do
  @moduledoc """
  Module representing the Chime ArtifactsConcatenationConfiguration data type

  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_ArtifactsConcatenationConfiguration.html
  """

  defstruct [
    :audio,
    :composited_video,
    :content,
    :data_channel,
    :meeting_events,
    :transcription_messages,
    :video
  ]

  alias ExAws.Chime.MediaPipelines

  @type t :: %__MODULE__{
          audio: MediaPipelines.AudioConcatenationConfiguration.t(),
          composited_video: MediaPipelines.CompositedVideoConcatenationConfiguration.t(),
          content: MediaPipelines.ContentConcatenationConfiguration.t(),
          data_channel: MediaPipelines.DataChannelConcatenationConfiguration.t(),
          meeting_events: MediaPipelines.MeetingEventsConcatenationConfiguration.t(),
          transcription_messages:
            MediaPipelines.TranscriptionMessagesConcatenationConfiguration.t(),
          video: MediaPipelines.VideoConcatenationConfiguration.t()
        }
end
