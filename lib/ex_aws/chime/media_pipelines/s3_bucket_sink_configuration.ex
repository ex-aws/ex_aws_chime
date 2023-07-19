defmodule ExAws.Chime.MediaPipelines.S3BucketSinkConfiguration do
  @moduledoc """
  Module representing the Chime S3BucketSinkConfiguration data type

  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_S3BucketSinkConfiguration.html
  """

  defstruct [
    :destination
  ]

  @type t :: %__MODULE__{
          # ARN
          destination: String.t()
        }
end
