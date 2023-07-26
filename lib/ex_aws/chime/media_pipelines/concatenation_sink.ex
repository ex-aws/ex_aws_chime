defmodule ExAws.Chime.MediaPipelines.ConcatenationSink do
  @moduledoc """
  Module representing the Chime ConcatenationSink data type

  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_ConcatenationSink.html
  """

  defstruct [
    :s3_bucket_sink_configuration,
    :type
  ]

  @type t :: %__MODULE__{
          s3_bucket_sink_configuration: ExAws.Chime.MediaPipelines.S3BucketSinkConfiguration.t(),
          type: :S3Bucket
        }
end
