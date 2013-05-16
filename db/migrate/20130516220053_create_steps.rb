class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :title
      t.string :description
      t.references :howto

      t.timestamps
    end
    add_index :steps, :howto_id
  end
end
