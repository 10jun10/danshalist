class RenameIndroductionColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :indroduction, :introduction
  end
end
