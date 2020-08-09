class CreateUsuariosLivros < ActiveRecord::Migration[6.0]
  def change
    create_table :usuarios_livros do |t|
      t.belongs_to :usuario
      t.belongs_to :livro
      t.integer :status_livro
    end
  end
end
