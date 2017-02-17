class SetupProductAndReviewModels < ActiveRecord::Migration[5.0]
  def change
    rename_table :models, :users
    add_column :products, :name, :string
    add_column :products, :details, :string
    add_column :products, :cost, :string
    add_attachment :products, :imgfile
    add_column :reviews, :title, :string
    add_column :reviews, :content, :string
  end
end
