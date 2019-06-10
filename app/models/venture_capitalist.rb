class VentureCapitalist
  attr_accessor :name, :total_worth
  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    @@all.select {|vc| vc.total_worth > 1000000000}
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def invest
    FundingRound.all.select{|invest| invest.venture_capitalist == self}
  end

  def funding_rounds
    invest.count
  end

  def portfolio
    invest.map {|invest| invest.startup}.uniq
  end

  def biggest_investment
    dollar = invest.map {|invest| invest.investment}
    dollar.sort.first
  end

  def invested(domain)
    FundingRound.all.select {|fund| fund.domain == domain}
  end

end
