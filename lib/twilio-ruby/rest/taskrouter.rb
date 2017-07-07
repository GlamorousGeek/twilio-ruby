##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Taskrouter < Domain
      ##
      # Initialize the Taskrouter Domain
      def initialize(twilio)
        super

        @base_url = 'https://taskrouter.twilio.com'
        @host = 'taskrouter.twilio.com'
        @port = 443

        # Versions
        @v1 = nil
      end

      ##
      # Version v1 of taskrouter
      def v1
        @v1 ||= V1.new self
      end

      def workspaces(sid=:unset)
        self.v1.workspaces(sid)
      end

      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio::REST::Taskrouter>'
      end
    end
  end
end