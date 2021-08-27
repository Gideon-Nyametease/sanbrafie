class CreateUserTestimonials < ActiveRecord::Migration[6.1]
  def change
    create_table :user_testimonials do |t|
      t.string :fullname
      t.string :trip
      t.text :testimonial

      t.timestamps
    end
  end
end
