defmodule ExAws.Chime.MediaPipelines.PresenterOnlyConfiguration do
  @moduledoc """
  Module representing the Chime PresenterOnlyConfiguration data type
  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_PresenterOnlyConfiguration.html
  """

  defstruct [
    :presenter_position
  ]

  @type t :: %__MODULE__{
          presenter_position: :TopLeft | :TopRight | :BottomLeft | :BottomRight | nil
        }
end
