class CreateUsuarios < ActiveRecord::Migration[6.0]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.date :data_nascimento
      t.string :nome_exibicao

      t.timestamps
    end
  end
end
