class RenameListaToList < ActiveRecord::Migration[6.0]
  def up
    rename_column :listas, :data_criacao, :creation_date
    rename_column :listas, :data_atualizacao, :update_date
    rename_column :listas, :progresso, :progress
    rename_column :listas, :usuario_id, :user_id
    rename_table :listas, :lists
  end

  def down
    rename_column :lists, :creation_date, :data_criacao
    rename_column :lists, :update_date, :data_atualizacao
    rename_column :lists, :progress, :progresso
    rename_column :lists, :user_id, :usuario_id
    rename_table :lists, :listas
  end
end
