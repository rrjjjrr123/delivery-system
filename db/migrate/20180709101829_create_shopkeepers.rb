class CreateShopkeepers < ActiveRecord::Migration[5.2]
  def change
    create_table :shopkeepers do |t|
      t.belongs_to :order
      t.timestamps
    end
  end
end
