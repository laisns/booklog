class RenameUsuarioToUser < ActiveRecord::Migration[6.0]
  def up
    rename_column :usuarios, :nome, :name
    rename_column :usuarios, :data_nascimento, :birth_date
    rename_column :usuarios, :nome_exibicao, :login_name
    rename_table :usuarios, :users
  end

  def down
    rename_column :users, :name, :nome
    rename_column :users, :birth_date, :data_nascimento
    rename_column :users, :login_name, :nome_exibicao
    rename_table :users, :usuarios
  end
end
