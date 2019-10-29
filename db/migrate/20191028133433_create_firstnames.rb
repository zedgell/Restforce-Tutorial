class CreateFirstnames < ActiveRecord::Migration[5.2]
  def change
    create_table :firstnames do |t|
      t.string :lastname
      t.string :company
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
