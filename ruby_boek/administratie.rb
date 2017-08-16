module Administratie
  VERSIE = '1.05'

  class Student
    attr_accessor :naam, :opleiding, :gebdat

    def initialize(naam, opl, gebdat)
      @naam, @opleiding, @gebdat = naam, opl, gebdat
    end

    def to_s
      "#{self.naam}, (geb #{self.gebdat}) studeert #{self.opleiding}"
    end
  end #student

  class Datum
    attr_accessor :dag, :maand, :jaar

    def initialize(d = 1, m = 1, j = 1900)
      @dag, @maand, @jaar = d, m, j
    end

    def to_s
      '%02d-%02d-%4d' % [@dag, @maand, @jaar]
    end
  end #datum

  def self.to_text
    'Deze module bevat Max, Student, Datum en to_text'
  end
end #administratie

