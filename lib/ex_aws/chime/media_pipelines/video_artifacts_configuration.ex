defmodule ExAws.Chime.MediaPipelines.VideoArtifactsConfiguration do
  @moduledoc """
  Module representing the Chime VideoArtifactsConfiguration data type

  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_VideoArtifactsConfiguration.html
  """

  defstruct [
    :state,
    :mux_type
  ]

  alias ExAws.Chime.MediaPipelines

  @type t :: %__MODULE__{
          state: MediaPipelines.state(),
          mux_type: :VideoOnly | nil
        }
end
