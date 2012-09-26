class TS3Bot < Thread
  attr_accessor :id

  def initialize id
    @id = id
    super &method(:thread)

    @logger = Logger.new(File.expand_path("log/bot-#{id}.log", Rails.root))
    @logger.formatter = proc do |severity, datetime, progname, msg|
      "[#{severity}] #{datetime}: #{msg}\n"
    end
    @logger.info "Starting Bot #{id}"
  end

  private

  def thread
    while true
      # Do all the Bot actions in here.
      sleep 2
    end
  end
end