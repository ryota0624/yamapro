class AddEssayMd < ActiveRecord::Migration
  def change
    add_column :essays, :md, :boolean, :default => false
  end
end
