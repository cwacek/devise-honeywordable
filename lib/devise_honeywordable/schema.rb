module DeviseHoneywordable
  module Schema

    # Add honeywords support to an authentication model.
    #
    # Example
    #
    # change_table :users do |t|
    #   t.honeywordable
    # end
    #
    def honeywordable
      apply_devise_schema :honeywordable_passwords, Integer, null => false
      apply_devise_schema :honeyword_index, Integer
    end

    # Create a honeywords table to have the set of valid honeywords.
    # This is required if you use 'honeywordable'
    #
    # Example
    #
    # add_table :honeywords do |t|
    #   t.honeywords
    # end
    #
    def honeywords
      apply_devise_schema :index, Integer, :null => false
      apply_devise_schema :encrypted_password, String, :limit => 128, :null => false
      apply_devise_schema :password_salt, String
    end

  end
end
