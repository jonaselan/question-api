class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
  Rack::Attack.blocklist('allow2ban login scrapers') do |req|
    Rack::Attack::Allow2Ban.filter(req.ip, :maxretry => 100, :findtime => 1.day, :bantime => 15.seconds) do
      req.ip
    end
  end
end
