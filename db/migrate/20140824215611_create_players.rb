class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.column :name, :string
      t.column :team_id, :integer
      t.column :position_id, :integer
      t.column :depth_rank, :integer

      t.timestamps
    end
  end
end
