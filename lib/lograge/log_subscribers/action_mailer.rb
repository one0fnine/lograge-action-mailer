# frozen_string_literal: true

module Lograge
  module LogSubscribers
    class ActionMailer < Lograge::ActionMailer::BaseLogSubscriber
      def deliver(event)
        data = {
          status: event.payload[:perform_deliveries] ? :delivered : :skipped,
          mailer: event.payload[:mailer],
          message_id: event.payload[:message_id],
          duration: "#{event.duration.round(1)}ms"
        }.compact

        processing_data(event, data)
      end

      def process(event)
        data = {
          status: event.payload[:perform_deliveries] ? :delivered : :skipped,
          mailer: event.payload[:mailer],
          action: event.payload[:action],
          duration: "#{event.duration.round(1)}ms"
        }.compact

        processing_data(event, data)
      end
    end
  end
end
