class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :firstname
      t.string :lastname
      t.string :company
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
