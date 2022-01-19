# frozen_string_literal: true

require "rails/railtie"
require "active_support"
require "lograge"

module Lograge
  module ActionMailer
    class Railtie < Rails::Railtie
      config.lograge.action_mailer = ActiveSupport::OrderedOptions.new
      config.lograge.action_mailer.enabled = false
      config.lograge.action_mailer.ignore_events = []

      config.after_initialize do |app|
        Lograge::ActionMailer.setup(app) if app.config.lograge.action_mailer.enabled
      end
    end
  end
end
