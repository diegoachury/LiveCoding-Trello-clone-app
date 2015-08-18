class ChangeColumnPostitionInCards < ActiveRecord::Migration
  def change
    rename_column :cards, :postition, :position
  end
end
