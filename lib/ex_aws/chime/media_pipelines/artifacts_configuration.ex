defmodule ExAws.Chime.MediaPipelines.ArtifactsConfiguration do
  @moduledoc """
  Module representing the Chime ArtifactsConfiguration data type

  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_ArtifactsConfiguration.html
  """

  alias ExAws.Chime.MediaPipelines

  defstruct [
    :audio,
    :content,
    :video,
    :composited_video
  ]

  @type t :: %__MODULE__{
          audio: MediaPipelines.AudioArtifactsConfiguration.t(),
          content: MediaPipelines.ContentArtifactsConfiguration.t(),
          video: MediaPipelines.VideoArtifactsConfiguration.t(),
          composited_video: MediaPipelines.CompositedVideoArtifactsConfiguration.t() | nil
        }
end
