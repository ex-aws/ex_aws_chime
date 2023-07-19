defmodule ExAws.Chime.MediaPipelines.ConcatenationSource do
  @moduledoc """
  Module representing the Chime ConcatenationSource data type

  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_ConcatenationSource.html
  """

  defstruct [
    :media_capture_pipeline_source_configuration,
    :type
  ]

  alias ExAws.Chime.MediaPipelines

  @type t :: %__MODULE__{
          media_capture_pipeline_source_configuration:
            MediaPipelines.MediaCapturePipelineSourceConfiguration.t(),
          type: :MediaCapturePipeline
        }
end
