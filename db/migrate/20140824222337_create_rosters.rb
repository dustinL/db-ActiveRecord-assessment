class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.column :team_id, :integer
      t.column :player_id, :integer
      t.column :position_id, :integer

      t.timestamps
    end
  end
end
