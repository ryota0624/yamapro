class Essay < ActiveRecord::Migration
    def change
    add_column :essays, :question, :boolean, default: false
  end
end
