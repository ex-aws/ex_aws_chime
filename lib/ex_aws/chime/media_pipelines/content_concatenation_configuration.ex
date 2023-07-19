defmodule ExAws.Chime.MediaPipelines.ContentConcatenationConfiguration do
  @moduledoc """
  Module representing the Chime ContentConcatenationConfiguration data type
  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_ContentConcatenationConfiguration.html
  """

  defstruct [
    :state
  ]

  alias ExAws.Chime.MediaPipelines

  @type t :: %__MODULE__{
          state: MediaPipelines.state()
        }
end
