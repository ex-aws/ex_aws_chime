defmodule ExAws.Chime.MediaPipelines do
  @moduledoc """
  API calls for Amazon Chime SDK Media Pipelines
  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_Operations_Amazon_Chime_SDK_Media_Pipelines.html
  """

  alias ExAws.Chime
  alias ExAws.Chime.MediaPipelines
  alias ExAws.Chime.Tag
  alias ExAws.Operation.JSON

  @type state() :: :Enabled | :Disabled

  @service :"chime-sdk-media-pipelines"

  @spec create_media_capture_pipeline(
          String.t(),
          String.t(),
          MediaPipelines.ChimeSdkMeetingConfiguration.t() | nil,
          [Tag.t()] | nil
        ) :: JSON.t()
  def create_media_capture_pipeline(source_arn, sink_arn, config \\ nil, tags \\ nil) do
    json_request(
      "/sdk-media-capture-pipelines",
      %{
        SourceType: "ChimeSdkMeeting",
        SourceArn: source_arn,
        SinkType: "S3Bucket",
        SinkArn: sink_arn,
        ChimeSdkMeetingConfiguration: config,
        Tags: tags
      }
    )
  end

  @spec delete_media_capture_pipeline(String.t()) :: JSON.t()
  def delete_media_capture_pipeline(pipeline_id) do
    json_request(
      "/sdk-media-capture-pipelines/#{pipeline_id}",
      %{},
      :delete
    )
  end

  @spec create_media_concatenation_pipeline(
          [MediaPipelines.ConcatenationSource.t()],
          [MediaPipelines.ConcatenationSink.t()],
          [Tag.t()] | nil
        ) :: JSON.t()
  def create_media_concatenation_pipeline(sources, sinks, tags \\ nil) do
    json_request(
      "/sdk-media-concatenation-pipelines",
      %{
        Sources: sources,
        Sinks: sinks,
        Tags: tags
      }
    )
  end

  ### HELPERS

  defp json_request(path, data, method \\ :post),
    do: Chime.json_request(path, %{}, data, method, @service)
end
