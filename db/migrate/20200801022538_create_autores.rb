class CreateAutores < ActiveRecord::Migration[6.0]
  def change
    create_table :autores do |t|
      t.string :nome
      t.date :data_nascimento
      t.string :nacionalidade

      t.timestamps
    end
  end
end
