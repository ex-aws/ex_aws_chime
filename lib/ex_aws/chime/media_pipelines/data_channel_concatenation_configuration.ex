defmodule ExAws.Chime.MediaPipelines.DataChannelConcatenationConfiguration do
  @moduledoc """
  Module representing the Chime DataChannelConcatenationConfiguration data type
  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_DataChannelConcatenationConfiguration.html
  """

  alias ExAws.Chime.MediaPipelines

  defstruct [
    :state
  ]

  @type t :: %__MODULE__{
          state: MediaPipelines.state()
        }
end
