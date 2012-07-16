class CreateMadLibSolutions < ActiveRecord::Migration
  def change
    create_table :mad_lib_solutions do |t|
      t.text :values
      t.belongs_to :mad_lib

      t.timestamps
    end
    add_index :mad_lib_solutions, :mad_lib_id
  end
end
