class Bankrekening
  def initialize(nummer, naam, saldo)
    @nummer, @naam, @saldo = nummer, naam, saldo
  end
end
rek1 = Bankrekening.new(313, 'Jeanette', 1000.0)
rek2 = Bankrekening.new(547, 'Menno', 1250.0)

