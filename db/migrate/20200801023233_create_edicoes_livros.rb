class CreateEdicoesLivros < ActiveRecord::Migration[6.0]
  def change
    create_table :edicoes_livros do |t|
      t.belongs_to :livro
      t.string :nome
      t.integer :numero
      t.string :editora
      t.string :idioma
      t.integer :num_paginas

      t.timestamps
    end
  end
end
