defmodule ExAws.Chime.MediaPipelines.AudioConcatenationConfiguration do
  @moduledoc """
  Module representing the Chime AudioConcatenationConfiguration data type
  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_AudioConcatenationConfiguration.html
  """

  alias ExAws.Chime.MediaPipelines

  defstruct [
    :state
  ]

  @type t :: %__MODULE__{
          state: MediaPipelines.state()
        }
end
