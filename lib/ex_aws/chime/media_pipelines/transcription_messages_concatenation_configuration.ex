defmodule ExAws.Chime.MediaPipelines.TranscriptionMessagesConcatenationConfiguration do
  @moduledoc """
  Module representing the Chime TranscriptionMessagesConcatenationConfiguration data type
  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_TranscriptionMessagesConcatenationConfiguration.html
  """

  alias ExAws.Chime.MediaPipelines

  defstruct [
    :state
  ]

  @type t :: %__MODULE__{
          state: MediaPipelines.state()
        }
end
