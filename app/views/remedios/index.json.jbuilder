json.array!(@remedios) do |remedio|
  json.extract! remedio, :nome, :dosagem, :hora, :dias, :data_inicio, :data_fim
  json.url remedio_url(remedio, format: :json)
end
