class CreateMovie < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :actor
    end
  end
end
