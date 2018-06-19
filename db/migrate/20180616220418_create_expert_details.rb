class CreateExpertDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :expert_details do |t|
      t.belongs_to :expert, index: true
      t.string :service
      t.string :profession

      t.timestamps
    end
  end
end
