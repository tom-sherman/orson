class AddAssociationToMedia < ActiveRecord::Migration[5.1]
  def change
    change_table :media do |t|
      t.belongs_to :library, index: true
    end
  end
end
