class CreateCreativePrompts < ActiveRecord::Migration[6.1]
  def change
    create_table :creative_prompts do |t|
      t.string :prompt

      t.timestamps
    end
  end
end
