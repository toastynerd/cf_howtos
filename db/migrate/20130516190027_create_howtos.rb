class CreateHowtos < ActiveRecord::Migration
  def change
    create_table :howtos do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
