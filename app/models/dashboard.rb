class Dashboard
  def initialize(region: nil)
    # TODO pre filter by region (detected via IP Address)
  end

  def latest_consumers
    @latest_consumers ||= Consumer.last(10)
  end

  def latest_providers
    @latest_providers ||= Provider.last(10)
  end

  def consumers_count
    @consumers_count ||= Consumer.count
  end

  def providers_count
    @providers_count ||= Provider.count
  end
end