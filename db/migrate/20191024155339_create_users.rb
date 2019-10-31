class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      #je crée ma table user
    	t.string :first_name
    	t.string :last_name
    	t.text :description
    	t.string :email
    	t.integer :age
    end
  end
end


#Nous allons stocker dans la table users un string nommé password_digest. À l'inscription, l'utilisateur va saisir son mot de passe et on va le récupérer via params. Ensuite on va le convertir en hash, et le stocker dans la colonne password_digest (le mot de passe normal est parti aux oubliettes du params).
