defmodule ExAws.Chime.MediaPipelines.ContentArtifactsConfiguration do
  @moduledoc """
  Module representing the Chime ContentArtifactsConfiguration data type

  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_ContentArtifactsConfiguration.html
  """

  defstruct [
    :state,
    :mux_type
  ]

  alias ExAws.Chime.MediaPipelines

  @type t :: %__MODULE__{
          state: MediaPipelines.state(),
          mux_type: :ContentOnly | nil
        }
end
