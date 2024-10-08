class CreateCalls < ActiveRecord::Migration[7.1]
  def change
    create_table :calls do |t|
      t.references :client, null: false, foreign_key: true
      t.references :reason, null: false, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
