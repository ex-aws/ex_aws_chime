defmodule ExAws.Chime.MediaPipelines.AudioConcatenationConfiguration do
  @moduledoc """
  Module representing the Chime AudioConcatenationConfiguration data type
  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_AudioConcatenationConfiguration.html
  """

  defstruct [
    :state
  ]

  alias ExAws.Chime.MediaPipelines

  @type t :: %__MODULE__{
          state: MediaPipelines.state()
        }
end
