class CreateListaLivros < ActiveRecord::Migration[6.0]
  def change
    create_table :lista_livros do |t|
      t.belongs_to :lista
      t.belongs_to :livro

      t.timestamps
    end
  end
end
