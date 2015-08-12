class AddAllTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :name, limit: 15, uniqueness: true
      t.string   :password_digest
      t.string   :slug
      t.timestamps
    end

    add_index :users, :name, unique: true

    create_table :boards do |t|
      t.string   :name, limit: 15
      t.text     :description
      t.boolean  :status
      t.integer  :user_id, index: true
      t.timestamps
    end

    create_table :lists do |t|
      t.string   :name, limit: 15
      t.integer  :position
      t.integer  :board_id, index: true
      t.timestamps
    end

    create_table :cards do |t|
      t.string   :name, limit: 25
      t.text     :description, default: ''
      t.integer  :postition
      t.integer  :list_id, index: true
      t.timestamps
    end
  end
end
