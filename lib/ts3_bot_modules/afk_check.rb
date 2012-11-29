$moved_clients = {}

def afk_check_module(bot, query)
  channel_name = bot.afk_check_module.channel_name.gsub(' ', "\\s")

  clients = query.clientlist do |opt|
    opt.away
  end

  clients[0...-1].each do |client|
    client_type       = client["client_type"]
    client_id         = client["clid"]
    client_channel_id = client["cid"]
    client_away       = client["client_away"]
    client_name       = client["client_nickname"]

    if client_type.to_i == 0 && client_away.to_i == 1
      query.channellist.each do |channel|
        if channel_name == channel["channel_name"]
          afk_channel_id =  channel["cid"]

          unless afk_channel_id == client_channel_id
            query.clientmove :clid => client_id, :cid => afk_channel_id
            $moved_clients[client_id] = client_channel_id

            @logger.info "Moved #{client_name} (#{client_id}) form Channel #{client_channel_id} to #{afk_channel_id}."
          end
        end
      end
    end

    if client_type.to_i == 0 && client_away.to_i == 0
      channel_id = $moved_clients[client_id]

      if channel_id
        query.clientmove :clid => client_id, :cid => channel_id
        $moved_clients.delete(client_id)

        @logger.info "Moved #{client_name} (#{client_id}) form back to #{channel_id}."
      end
    end
  end
end