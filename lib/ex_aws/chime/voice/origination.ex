defmodule ExAws.Chime.Voice.Origination do
  @moduledoc """
  Module representing the Chime Origination data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_Origination.html
  """

  alias ExAws.Chime.Voice.OriginationRoute

  defstruct [
    :disabled,
    :routes
  ]

  @type t :: %__MODULE__{
          disabled: boolean() | nil,
          routes: [OriginationRoute.t()] | nil
        }
end
