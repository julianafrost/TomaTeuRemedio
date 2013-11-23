class AdicionaFrequencia < ActiveRecord::Migration
  def change
    add_column :remedios, :frequencia, :integer
  end
end
