module InputTypes
  class SearchType < InputTypes::BaseInputObject
    argument :name, String, null: true
    argument :display_order, Boolean, null: true
    argument :detail, String, null: true
  end

end
