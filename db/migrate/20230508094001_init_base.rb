class InitBase < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :company_name
      t.string :inn
      t.string :email, default: "", null: false
      t.string :phone
      t.string :country, null: false
      t.string :city, null: false
      t.boolean :is_partner, default: false
      t.integer :users_count
      t.integer :points_count

      t.timestamps
    end

    create_table :points do |t|
      t.string :name, null: false
      t.string :address
      t.integer :orders_count
      t.integer :users_count
      t.references :account

      t.timestamps
    end

    create_table :users do |t|
      t.string :first_name, default: ""
      t.string :last_name, default: ""
      t.string :email, default: "", null: false
      t.string :phone, default: ""
      t.string :role, default: "executive"
      t.string :ancestry
      t.boolean :disabled, default: false
      t.references :account
      t.references :point

      t.timestamps
    end

    create_table :order_stages do |t|
      t.string :name
      t.string :color
      t.integer :position
      t.references :point

      t.timestamps
    end

    create_table :orders do |t|
      t.string :title
      t.text :dishes
      t.decimal :amount, default: "0.0"
      t.string :customer_name
      t.string :customer_phone
      t.string :customer_comment
      t.bigint :number
      t.integer :executor_id
      t.references :order_stages
      t.references :account
      t.references :point

      t.timestamps
    end
  end
end
