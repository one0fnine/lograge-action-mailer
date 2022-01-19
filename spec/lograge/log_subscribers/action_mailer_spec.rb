# frozen_string_literal: true

require "lograge/log_subscribers/action_mailer"
require "logger"
require "action_mailer"

RSpec.describe Lograge::LogSubscribers::ActionMailer do
  let(:log_output) { StringIO.new }
  let(:logger) do
    Logger.new(log_output).tap { |logger| logger.formatter = ->(_, _, _, msg) { msg } }
  end

  let(:subscriber) { described_class.new }
  let(:event_params) { {} }
  let(:mailer) { ActionMailer::Base }

  let(:event) do
    ActiveSupport::Notifications::Event.new(
      "deliver.action_mailer",
      Time.now,
      Time.now + 1,
      1,
      mailer: mailer,
      perform_deliveries: [],
      action: :process
    )
  end

  before do
    Lograge.logger = logger
    Lograge.formatter = Lograge::Formatters::KeyValue.new
  end

  context "when delivering an action with lograge output" do
    before { subscriber.deliver(event) }

    it "includes status" do
      expect(log_output.string).to include("status=delivered ")
    end

    it "includes mailer class" do
      expect(log_output.string).to include("mailer=ActionMailer::Base ")
    end

    it "includes duration" do
      expect(log_output.string).to include("duration=1000.0ms")
    end
  end

  context "when delivering an action with lograge output" do
    before { subscriber.process(event) }

    it "includes status" do
      expect(log_output.string).to include("status=delivered ")
    end

    it "includes mailer class" do
      expect(log_output.string).to include("mailer=ActionMailer::Base ")
    end

    it "includes mailer class" do
      expect(log_output.string).to include("action=process ")
    end

    it "includes duration" do
      expect(log_output.string).to include("duration=1000.0ms")
    end
  end
end
