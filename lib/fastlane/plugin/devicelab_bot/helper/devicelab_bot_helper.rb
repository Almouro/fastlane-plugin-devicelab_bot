module Fastlane
  module Helper
    class AppInstaller
      def initialize(deviceLabBaseUrl, appName)
        @appName = appName
        @deviceLabBaseUrl = deviceLabBaseUrl
        @logsCount = 0
      end

      def callInstallApp()
        RestClient.get("#{@deviceLabBaseUrl}/install", {params: {
          'appName': @appName,
        }})
      end

      def callGetLogs(buildId)
        JSON.parse(RestClient.get("#{@deviceLabBaseUrl}/build/#{buildId}").body)
      end

      def displayLog(log)
        if log.nil?
          return
        end
        if log.include? 'Done'
          return UI.success log
        end
        if log.downcase().include? 'error'
          return UI.error log
        end

        UI.message log
      end

      def checkLogs()
        logs = callGetLogs(@buildId)
        (@logsCount..logs.length).each do |logIndex|
          displayLog logs[logIndex]
          if logs[logIndex] == 'Done'
            @logsChecker.shutdown
            return
          end
        end
        @logsCount = logs.length
      end

      def install()
        @buildId = callInstallApp()
        checkLogs
        @logsChecker = Rufus::Scheduler.new
        @logsChecker.every '5s' do
          checkLogs
        end
        @logsChecker.join
      end
    end
  end
end
