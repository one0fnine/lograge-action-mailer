# frozen_string_literal: true

require "active_support/log_subscriber"

module Lograge
  module ActionMailer
    class BaseLogSubscriber < ActiveSupport::LogSubscriber
      protected

      def processing_data(event, data)
        return if event_ignore?(event.name)

        logger.send(Lograge.log_level, Lograge.formatter.call(data))
      end

      private

      def event_ignore?(name)
        !!Array(Lograge::ActionMailer.ignore_events).index(name.split(".").first)
      end

      def logger
        Lograge::ActionMailer.logger.presence || Lograge.logger.presence || super
      end
    end
  end
end
