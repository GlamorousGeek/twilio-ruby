##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceContext < InstanceContext
          class WorkspaceStatisticsList < ListResource
            ##
            # Initialize the WorkspaceStatisticsList
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The workspace_sid
            # @return [WorkspaceStatisticsList] WorkspaceStatisticsList
            def initialize(version, workspace_sid: nil)
              super(version)
              
              # Path Solution
              @solution = {
                  workspace_sid: workspace_sid
              }
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Taskrouter.V1.WorkspaceStatisticsList>'
            end
          end
        
          class WorkspaceStatisticsPage < Page
            ##
            # Initialize the WorkspaceStatisticsPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] workspace_sid The workspace_sid
            # @return [WorkspaceStatisticsPage] WorkspaceStatisticsPage
            def initialize(version, response, solution)
              super(version, response)
              
              # Path Solution
              @solution = solution
            end
            
            ##
            # Build an instance of WorkspaceStatisticsInstance
            # @param [Hash] payload Payload response from the API
            # @return [WorkspaceStatisticsInstance] WorkspaceStatisticsInstance
            def get_instance(payload)
              return WorkspaceStatisticsInstance.new(
                  @version,
                  payload,
                  workspace_sid: @solution['workspace_sid'],
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Taskrouter.V1.WorkspaceStatisticsPage>'
            end
          end
        
          class WorkspaceStatisticsContext < InstanceContext
            ##
            # Initialize the WorkspaceStatisticsContext
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The workspace_sid
            # @return [WorkspaceStatisticsContext] WorkspaceStatisticsContext
            def initialize(version, workspace_sid)
              super(version)
              
              # Path Solution
              @solution = {
                  workspace_sid: workspace_sid,
              }
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/Statistics"
            end
            
            ##
            # Fetch a WorkspaceStatisticsInstance
            # @param [String] minutes The minutes
            # @param [Time] start_date_before The start_date
            # @param [Time] start_date The start_date
            # @param [Time] start_date_after: The start_date
            # @param [Time] end_date_before The end_date
            # @param [Time] end_date The end_date
            # @param [Time] end_date_after: The end_date
            # @return [WorkspaceStatisticsInstance] Fetched WorkspaceStatisticsInstance
            def fetch(minutes: nil, start_date_before: nil, start_date: nil, start_date_after: nil, end_date_before: nil, end_date: nil, end_date_after: nil)
              params = {
                  'Minutes' => minutes,
                  'StartDate<' => Twilio.serialize_iso8601(start_date_before),
                  'StartDate' => Twilio.serialize_iso8601(start_date),
                  'StartDate>' => Twilio.serialize_iso8601(start_date_after),
                  'EndDate<' => Twilio.serialize_iso8601(end_date_before),
                  'EndDate' => Twilio.serialize_iso8601(end_date),
                  'EndDate>' => Twilio.serialize_iso8601(end_date_after),
              }
              
              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )
              
              return WorkspaceStatisticsInstance.new(
                  @version,
                  payload,
                  workspace_sid: @solution['workspace_sid'],
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Taskrouter.V1.WorkspaceStatisticsContext #{context}>"
            end
          end
        
          class WorkspaceStatisticsInstance < InstanceResource
            ##
            # Initialize the WorkspaceStatisticsInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] workspace_sid The workspace_sid
            # @return [WorkspaceStatisticsInstance] WorkspaceStatisticsInstance
            def initialize(version, payload, workspace_sid: nil)
              super(version)
              
              # Marshaled Properties
              @properties = {
                  'realtime' => payload['realtime'],
                  'cumulative' => payload['cumulative'],
                  'account_sid' => payload['account_sid'],
                  'workspace_sid' => payload['workspace_sid'],
              }
              
              # Context
              @instance_context = nil
              @params = {
                  'workspace_sid' => workspace_sid,
              }
            end
            
            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @param [Version] version Version that contains the resource
            # @return [WorkspaceStatisticsContext] WorkspaceStatisticsContext for this WorkspaceStatisticsInstance
            def context
              unless @instance_context
                @instance_context = WorkspaceStatisticsContext.new(
                    @version,
                    @params['workspace_sid'],
                )
              end
              @instance_context
            end
            
            def realtime
              @properties['realtime']
            end
            
            def cumulative
              @properties['cumulative']
            end
            
            def account_sid
              @properties['account_sid']
            end
            
            def workspace_sid
              @properties['workspace_sid']
            end
            
            ##
            # Fetch a WorkspaceStatisticsInstance
            # @param [String] minutes The minutes
            # @param [Time] start_date_before The start_date
            # @param [Time] start_date The start_date
            # @param [Time] start_date_after: The start_date
            # @param [Time] end_date_before The end_date
            # @param [Time] end_date The end_date
            # @param [Time] end_date_after: The end_date
            # @return [WorkspaceStatisticsInstance] Fetched WorkspaceStatisticsInstance
            def fetch(minutes: nil, start_date_before: nil, start_date: nil, start_date_after: nil, end_date_before: nil, end_date: nil, end_date_after: nil)
              context.fetch(
                  minutes: minutes,
                  start_date_before: start_date_before,
                  start_date: start_date,
                  start_date_after: start_date_after,
                  end_date_before: end_date_before,
                  end_date: end_date,
                  end_date_after: end_date_after,
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Taskrouter.V1.WorkspaceStatisticsInstance #{values}>"
            end
          end
        end
      end
    end
  end
end