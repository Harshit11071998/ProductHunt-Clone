class AddHeadlineToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :headline, :string
  end
end
