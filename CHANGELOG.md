2.0.0 (2024-03-20)
* BREAKING: Chime services are now broken up into the individual services rather than being
(mostly) grouped together in ExAws.Chime. Note that this is largely just a reorganisation of the
functions and types from 1.0.1. There are a lot of unimplemented new functions in the new
services. PRs to implement them are welcome :)

The new services now call the new Chime SDK endpoints (requires ExAws 2.5.2 or newer).

1.0.1
* Fix some typespecs in the new media pipeline work

1.0.0
* Add media pipeline support
* Add transcription support

0.1.2
* Fix typo in create_meeting

0.1.1
* Fix field types for MeetingNotificationConfiguration

0.1.0
* Initial version
