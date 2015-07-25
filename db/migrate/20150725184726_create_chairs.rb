class CreateChairs < ActiveRecord::Migration
  def change
    create_table :chairs do |t|
      t.boolean :status

      t.timestamps null: false
    end
  end
end
