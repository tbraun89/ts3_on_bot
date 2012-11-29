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
    connect_to_ts3 unless Rails.env == "test"

    while @running
      unless Rails.env == "test"
        begin
          module_handler
        rescue
          @logger.info "Connection lost, trying to reconnect."
          connect_to_ts3
        end
      end

      sleep 1
    end
  end

  def connect_to_ts3
    connected = false

    while !connected
      @logger.info "Connecting to #{@bot.server_address}:#{@bot.server_port}"

      begin
        @query = TS3Query.connect :address  => @bot.server_address,
                                  :port     => @bot.server_port,
                                  :username => @bot.query_user,
                                  :password => @bot.query_password
        connected = true
      rescue
        @logger.error "Failed connecting to #{@bot.server_address}:#{@bot.server_port}"
        sleep 3
      end
    end
  end

  def module_handler
    # TODO
  end
end