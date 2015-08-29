class AddConfimationFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_token, :string
  end

  # OUTRA FORMA DE SE ADICIONAR VARIOS CAMPOS A UMA TABELA SÓ
  # change_table :users do |t|
  #   t.datetime :confirmed_at
  #   t.string :confirmation_token
  # end
end
