defmodule ExAws.Chime.MediaPipelines do
  @moduledoc """
  """

  alias ExAws.Chime
  alias ExAws.Chime.Tag
  alias ExAws.Chime.MediaPipelines
  alias ExAws.Operation.JSON

  @type state() :: :AudioOnly | :AudioWithActiveSpeakerVideo | :AudioWithCompositedVideo

  ### AWS Chime Media Pipelines API

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

  # See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_CreateMediaConcatenationPipeline.html
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

  defp json_request(path, data, method \\ :post) do
    %JSON{
      headers: [{"content-type", "application/json"}],
      http_method: method,
      path: path,
      data: Chime.normalise_data(data),
      service: :"chime-sdk-media-pipelines"
    }
  end
end
