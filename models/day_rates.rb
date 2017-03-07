require_relative("../db/sql_runner")

class DayRates

  attr_reader :date, :usd, :jpy, :bgn, :czk, :dkk, :gbp, :huf, :pln
  
  def initialize(date, usd, jpy, bgn, czk, dkk, gbp, huf, pln)
    @date = date
    @usd = usd
    @jpy = jpy
    @bgn = bgn
    @czk = czk
    @dkk = dkk
    @gbp = gbp
    @huf = huf
    @pln = pln

  end

  def save
    sql = "
      INSERT INTO fx_rates (date, usd, jpy, bgn, czk, dkk, gbp, huf, pln)
      VALUES ('#{date}', '#{usd}', '#{jpy}', '#{bgn}', '#{czk}', '#{dkk}', '#{gbp}', '#{huf}', '#{pln}')
      "
    SqlRunner.run( sql )
  end

end