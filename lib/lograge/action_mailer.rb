# frozen_string_literal: true

require "lograge/action_mailer/version"
require "lograge/action_mailer/railtie"
require "lograge/action_mailer/base_log_subscriber"
require "lograge/log_subscribers/action_mailer"

require "action_mailer/log_subscriber"

module Lograge
  module ActionMailer
    class << self
      attr_accessor :logger, :ignore_events

      def remove_existing_log_subscriptions
        ActiveSupport::LogSubscriber.log_subscribers.each do |subscriber|
          next unless subscriber.is_a?(ActionMailer::LogSubscriber)

          Lograge.unsubscribe(:action_mailer, subscriber)
        end
      end

      def setup(app)
        Lograge::ActionMailer.remove_existing_log_subscriptions
        Lograge::LogSubscribers::ActionMailer.attach_to :action_mailer
        Lograge::ActionMailer.logger = app.config.lograge.action_mailer.logger
        Lograge::ActionMailer.custom_options = app.config.lograge.action_mailer.custom_options
        Lograge::ActionMailer.ignore_events = app.config.lograge.action_mailer.ignore_events
      end
    end
  end
end
