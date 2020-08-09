class CreateListas < ActiveRecord::Migration[6.0]
  def change
    create_table :listas do |t|
      t.belongs_to :usuario
      t.timestamp :data_criacao
      t.timestamp :data_atualizacao
      t.integer :progresso

      t.timestamps
    end
  end
end
