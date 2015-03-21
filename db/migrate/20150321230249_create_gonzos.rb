class CreateGonzos < ActiveRecord::Migration
  def change
    create_table :gonzos do |t|
      t.string :name
      t.boolean :done

      t.timestamps null: false
    end
  end
end
