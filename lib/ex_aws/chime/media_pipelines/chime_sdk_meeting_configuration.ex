defmodule ExAws.Chime.MediaPipelines.ChimeSdkMeetingConfiguration do
  @moduledoc """
  Module representing the Chime ChimeSdkMeetingConfiguration data type.

  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_ChimeSdkMeetingConfiguration.html
  """

  alias ExAws.Chime.MediaPipelines

  defstruct [
    :artifacts_configuration,
    :source_configuration
  ]

  @type t :: %__MODULE__{
          artifacts_configuration: MediaPipelines.ArtifactsConfiguration.t() | nil,
          source_configuration: MediaPipelines.SourceConfiguration.t() | nil
        }
end
