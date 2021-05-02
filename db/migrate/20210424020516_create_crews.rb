class CreateCrews < ActiveRecord::Migration[5.2]
  def change
    create_table :crews do |t|
      t.string :crew_name
      t.references :group

      t.timestamps
    end
  end
end
