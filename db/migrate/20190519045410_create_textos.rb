class CreateTextos < ActiveRecord::Migration[5.2]
  def change
    create_table :textos do |t|
      t.string :titulo
      t.text :conteudo

      t.timestamps
    end
  end
end
