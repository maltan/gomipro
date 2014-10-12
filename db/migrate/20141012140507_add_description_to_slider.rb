class AddDescriptionToSlider < ActiveRecord::Migration
  def change
    add_column :sliders, :description, :string
  end
end
