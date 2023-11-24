class AddDescriptionToStories < ActiveRecord::Migration[7.1]
  def change
    add_column :stories, :description, :text
  end
end
