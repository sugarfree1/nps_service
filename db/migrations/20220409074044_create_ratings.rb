Hanami::Model.migration do
  change do
    create_table :ratings do
      primary_key :id

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
      column :score,            Integer, null: false
      column :touchpoint,       String,  null: false
      column :respondent_class, String,  null: false
      column :respondent_id,    Integer, null: false, unique: true
      column :object_class,     String,  null: false
      column :object_id,        Integer, null: false, unique: true

      check %(touchpoint IN('realtor_feedback', 'property_feedback'))
      check %(respondent_class IN('seller', 'buyer', 'additional_buyer'))
      check %(object_class IN('realtor', 'property'))
    end
  end
end
