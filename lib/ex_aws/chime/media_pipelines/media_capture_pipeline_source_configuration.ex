defmodule ExAws.Chime.MediaPipelines.MediaCapturePipelineSourceConfiguration do
  @moduledoc """
  Module representing the Chime MediaCapturePipelineSourceConfiguration data type

  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_MediaCapturePipelineSourceConfiguration.html
  """

  alias ExAws.Chime.MediaPipelines

  defstruct [
    :chime_sdk_meeting_configuration,
    :media_pipeline_arn
  ]

  @type t :: %__MODULE__{
          chime_sdk_meeting_configuration:
            MediaPipelines.ChimeSdkMeetingConcatenationConfiguration.t(),
          media_pipeline_arn: String.t()
        }
end
