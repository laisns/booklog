class CreateLivros < ActiveRecord::Migration[6.0]
  def change
    create_table :livros do |t|
      t.belongs_to :autor
      t.belongs_to :genero
      t.string :nome
      t.integer :ano_lancamento
      t.text :sinopse
      t.string :idioma

      t.timestamps
    end
  end
end
