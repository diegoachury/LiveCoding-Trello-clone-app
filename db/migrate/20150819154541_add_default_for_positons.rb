class AddDefaultForPositons < ActiveRecord::Migration
  def change
    remove_column :boards, :status
    change_column :cards, :position, :integer, default: 9999
    change_column :lists, :position, :integer, default: 9999
  end
end
