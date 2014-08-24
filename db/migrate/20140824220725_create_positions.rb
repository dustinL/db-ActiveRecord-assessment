class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.column :title, :string

      t.timestamps
    end
  end
end
