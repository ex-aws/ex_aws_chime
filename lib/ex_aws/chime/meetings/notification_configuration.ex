defmodule ExAws.Chime.Meetings.NotificationConfiguration do
  @moduledoc """
  Module representing the Chime NotificationConfiguration data type

  See https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_meeting-chime_NotificationsConfiguration.html
  """

  defstruct [
    :lambda_function_arn,
    :sns_topic_arn,
    :sqs_queue_arn
  ]

  @type t :: %__MODULE__{
          lambda_function_arn: String.t() | nil,
          sns_topic_arn: String.t() | nil,
          sqs_queue_arn: String.t() | nil
        }
end
