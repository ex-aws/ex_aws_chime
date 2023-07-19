defmodule ExAws.Chime.MediaPipelines.ChimeSdkMeetingConcatenationConfiguration do
  @moduledoc """
  Module representing the Chime ChimeSdkMeetingConcatenationConfiguration data type.

  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_ChimeSdkMeetingConcatenationConfiguration.html
  """

  defstruct [
    :artifacts_configuration
  ]

  @type t :: %__MODULE__{
          artifacts_configuration:
            ExAws.Chime.MediaPipelines.ArtifactsConcatenationConfiguration.t()
        }
end
