class AddStationToJob < ActiveRecord::Migration[5.0]
  def change
  	add_column: :jobs, :station, :string
  end
end
