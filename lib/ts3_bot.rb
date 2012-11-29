class TS3Bot < Thread
  attr_accessor :id

  def initialize id
    @bot     = Bot.find(id)
    @running = true
    super &method(:thread)

    @logger = Logger.new(File.expand_path("log/bot-#{@bot.id}.log", Rails.root), 3, 1048576)
    @logger.formatter = proc do |severity, datetime, progname, msg|
      "[#{severity}] #{datetime}: #{msg}\n"
    end
    @logger.info "Starting Bot \"#{@bot.name}\" (#{@bot.id})"
  end

  def id
    @bot.id
  end

  def name
    @bot.name
  end

  def stop
    @logger.info "Stopping Bot \"#{@bot.name}\" (#{@bot.id})"
    @running = false
  end

  private

  def thread
    while @running
      # TODO do all bot actions in here
      sleep 1
    end
  end
end