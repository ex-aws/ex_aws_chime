defmodule ExAws.Chime.EngineTranscribeSettings do
  @moduledoc """
  Module representing the Chime EngineTranscribeSettings data type

  See https://docs.aws.amazon.com/chime/latest/APIReference/API_EngineTranscribeSettings.html
  """

  defstruct [
    :content_identification_type,
    :content_redaction_type,
    :enable_partial_results_stabilization,
    :identify_language,
    :language_code,
    :language_model_name,
    :language_options,
    :partial_results_stability,
    :pii_entity_types,
    :preferred_language,
    :region,
    :vocabulary_filter_method,
    :vocabulary_filter_name,
    :vocabulary_filter_names,
    :vocabulary_name,
    :vocabulary_names
  ]

  @type t :: %__MODULE__{
          content_identification_type: String.t() | nil,
          content_redaction_type: String.t() | nil,
          enable_partial_results_stabilization: boolean() | nil,
          identify_language: boolean() | nil,
          language_code: String.t() | nil,
          language_model_name: String.t() | nil,
          language_options: String.t() | nil,
          partial_results_stability: String.t() | nil,
          pii_entity_types: String.t() | nil,
          preferred_language: String.t() | nil,
          region: String.t() | nil,
          vocabulary_filter_method: String.t() | nil,
          vocabulary_filter_name: String.t() | nil,
          vocabulary_filter_names: String.t() | nil,
          vocabulary_name: String.t() | nil,
          vocabulary_names: String.t() | nil
        }
end
