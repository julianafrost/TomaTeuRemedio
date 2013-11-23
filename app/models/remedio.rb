class Remedio < ActiveRecord::Base
  def self.proximo_remedio
    resultado_final = 24
    Remedio.all.each do |remedio|
      hora = remedio.hora.to_i
      while hora < Time.now.hour
        hora = hora + remedio.frequencia
      end
      if hora < resultado_final
        resultado_final = hora
        proximo_remedio = remedio
      end
    end
    proximo_remedio
  end

  def self.remedios_ativos
     Remedio.where("data_inicio <= ? AND data_fim >= ?", Date.today, Date.today)
  end

  def self.remedios_vencidos
    Remedio.where("data_fim < ?", Date.today)
  end
end
