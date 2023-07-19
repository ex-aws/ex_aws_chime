defmodule ExAws.Chime.MediaPipelines.GridViewConfiguration do
  @moduledoc """
  Module representing the Chime GridViewConfiguration data type
  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_GridViewConfiguration.html
  """

  defstruct [
    :contents_share_layout,
    :presenter_only_configuration
  ]

  @type t :: %__MODULE__{
          contents_share_layout: :PresenterOnly | :Horizontal | :Vertical,
          presenter_only_configuration:
            ExAws.Chime.MediaPipelines.PresenterOnlyConfiguration.t() | nil
        }
end
