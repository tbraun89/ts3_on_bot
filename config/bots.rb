require File.expand_path('lib/ts3_bot', Rails.root)

module Bots
  class Application
    @bot_thread_pool = []

    def self.initialize!
      Bot.where(:running => true).each do |bot|
        @bot_thread_pool << TS3Bot.new(bot.id)
      end
    end

    def self.add_bot id
      @bot_thread_pool.each do |bot|
        return false if bot.id == id
      end

      @bot_thread_pool << TS3Bot.new(id)
    end

    def self.remove_bot id
      @bot_thread_pool.each do |bot|
        if bot.id == id
          return @bot_thread_pool.delete(bot)
        end
      end

      false
    end

    def self.running_bots
      @bot_thread_pool
    end
  end
end