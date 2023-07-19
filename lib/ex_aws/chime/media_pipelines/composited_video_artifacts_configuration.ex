defmodule ExAws.Chime.MediaPipelines.CompositedVideoArtifactsConfiguration do
  @moduledoc """
  Module representing the Chime CompositedVideoArtifactsConfiguration data type
  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_CompositedVideoArtifactsConfiguration.html
  """

  defstruct [
    :grid_view_configuration,
    :layout,
    :resolution
  ]

  @type t :: %__MODULE__{
          grid_view_configuration: ExAws.Chime.MediaPipelines.GridViewConfiguration.t(),
          layout: :GridView | nil,
          resolution: :HD | :FHD | nil
        }
end
