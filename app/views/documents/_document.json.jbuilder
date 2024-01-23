json.extract! document, :id, :name, :description, :location, :hide, :is_instructor, :is_student, :is_maintenance, :is_frontoffice, :is_dispatcher, :is_guest, :created_at, :updated_at
json.url document_url(document, format: :json)
