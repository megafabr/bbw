class AddDeviseToUsers < ActiveRecord::Migration

  # Обычная миграция обвёрнута в метод change
  # Девайзовская в методы self.up и self.down
  # Эти методы помогают откатить миграцию, если необходимо
  def self.up

    # До этого был хелпер create_table, а теперь
    # change-table, потому что мы не создаём новую,
    # а меняем существующую
    change_table :users do |t|

      ## Database authenticatable
      # Меняется поле email: добавляются новые ограничения
      t.change :email, :string, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end