##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Preview
      class Wireless < Version
        ##
        # Initialize the Wireless version of Preview
        def initialize(domain)
          super
          @version = 'wireless'
          @commands = nil
          @rate_plans = nil
          @sims = nil
        end

        def commands(sid=:unset)
          if sid == :unset
            @commands ||= CommandList.new self
          else
            CommandContext.new(self, sid)
          end
        end

        def rate_plans(sid=:unset)
          if sid == :unset
            @rate_plans ||= RatePlanList.new self
          else
            RatePlanContext.new(self, sid)
          end
        end

        def sims(sid=:unset)
          if sid == :unset
            @sims ||= SimList.new self
          else
            SimContext.new(self, sid)
          end
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Preview::Wireless>'
        end
      end
    end
  end
end