class CreateReasons < ActiveRecord::Migration[7.1]
  def change
    create_table :reasons do |t|
      t.string :name

      t.timestamps
    end
  end
end
