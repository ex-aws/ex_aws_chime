defmodule ExAws.Chime.MediaPipelines.AudioArtifactsConfiguration do
  @moduledoc """
  Module representing the Chime AudioArtifactsConfiguration data type

  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_AudioArtifactsConfiguration.html
  """

  defstruct [
    :mux_type
  ]

  @type t :: %__MODULE__{
          mux_type: :AudioOnly | :AudioWithActiveSpeakerVideo | :AudioWithCompositedVideo
        }
end
