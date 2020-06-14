class CreateCnas < ActiveRecord::Migration[6.0]
  def change
    create_table :cnas do |t|
      t.references :company
      t.string :code
      t.string :account
      t.string :name
      t.string :inits
      t.string :given_names
      t.string :contact
      t.string :phone_h
      t.string :phone_b
      t.string :phone_o
      t.string :facsimile
      t.string :address
      t.string :suburb
      t.string :state
      t.string :pcode
      t.string :post_address
      t.string :post_suburb
      t.string :post_state
      t.string :post_pcode
      t.string :create_date
      t.string :shortcode
      t.string :acn
      t.string :bsbcode
      t.string :paymethod
      t.string :bank_account
      t.string :bank_drawer
      t.string :phone_name
      t.string :phone_address
      t.string :phone_number
      t.string :phone_ext
      t.string :contact_name
      t.string :contact_address
      t.string :contact_number
      t.string :contact_ext
      t.string :photo_id
      t.string :video_id
      t.string :map_ref
      t.string :abn
      t.string :phone_type
      t.boolean :adobe_sent
      t.string :gl_sw_ft
      t.string :gl_sw_ca
      t.string :gl_sickleave
      t.string :gl_wcomp
      t.string :gl_super
      t.string :gl_al_taken
      t.string :gl_ptax
      t.string :gl_al_accrued
      t.string :gl_dept
      t.string :gl_wages
      t.string :gl_lve_loading
      t.string :gl_lsl
      t.string :gl_clearing
      t.string :web_user_id


      t.string :client_code

      t.timestamps
    end
    add_index :cnas, :code
  end
end
