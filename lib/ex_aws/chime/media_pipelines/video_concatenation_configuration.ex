defmodule ExAws.Chime.MediaPipelines.VideoConcatenationConfiguration do
  @moduledoc """
  Module representing the Chime VideoConcatenationConfiguration data type
  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_VideoConcatenationConfiguration.html
  """

  defstruct [
    :state
  ]

  alias ExAws.Chime.MediaPipelines

  @type t :: %__MODULE__{
          state: MediaPipelines.state()
        }
end
