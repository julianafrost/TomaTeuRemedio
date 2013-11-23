class CreateRemedios < ActiveRecord::Migration
  def change
    create_table :remedios do |t|
      t.string :nome
      t.string :dosagem
      t.string :hora
      t.integer :dias
      t.date :data_inicio
      t.date :data_fim

      t.timestamps
    end
  end
end
