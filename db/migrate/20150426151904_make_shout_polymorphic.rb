class MakeShoutPolymorphic < ActiveRecord::Migration
  def change
    remove_column :shouts, :body
    add_column :shouts, :content_type, :string
    add_column :shouts, :content_id, :integer
    add_index :shouts, [:content_id, :content_type]
  end
end
