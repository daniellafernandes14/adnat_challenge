# Adnat Challenge

### Sign In/Up:
I started by creating a new Rails app with 3 models: Organisations, Shifts and Users through the devise Ruby gem.
<br>I included `gem 'devise'` into the Gemfile and ran `bundle install`, and then installed the gems views so my user would be able to log in and sign up.

As I wanted 'name' to be part of the users sign up process, and this isnt included in the devise gem, I had to ensure that in my devise.rb file this line was included - `config.scoped_views = true` and then I was able to add the 'name' form row into my views > users > registrations > new.html.erb file.

In order for this to be saved when a user signs up or edits their profile I had to include the below in the Application Controller:
<br>In the `configure_permitted_parameters` method:
<br>  `devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])`
<br>  `devise_parameter_sanitizer.permit(:account_update, keys: %i[name])`

----
### Models, Controllers & Routes:
Models -
<br>User - As this already included devise, I just needed to add a `has_many` relationship for shifts and a `belongs_to` relationship for organisations. As devise creates a user model for you, I just had to run a new migration that added 'name' as a string and a references, foreign_key link for organisation_id.
<br>Organisation - `has_many` relationship for users and `has_many` relationship for shifts, as well as validations for the creation of an organisation.
<br>Shift - `belongs_to` relationship for both users and organisations, as well as validations for the creation of a shift. When creating the model, I made sure to create a references, foreign_key link with users.

Routes - 
<br>The index of all organisations is the root page
<br>Shifts have nested routes within Organisations as the shifts are connected to each organisation. Organisations has all routes except new and Shifts has three nested resources 'create', 'index' and 'destroy'.
<br>Organisations also has member routes for leave and join methods so that our user can leave and join an organisation.

Controllers -
<br>Organisations - This includes all regular CRUD actions except for new, as well as the join and leave methods.
<br>Shifts - Includes the index and create methods. Including the sorted list of shifts in the index method.

----
### Views

Organisation - 
<br> Index: I iterated through each organisation and displayed the name and Join and Edit links. I also included a form to create a new organisation.
<br> Show: Once a user has chosen to join or create a new organisation, they are taken to the show page, which has the options to view shifts, edit and organisation or leave an organisation.
<br> Edit: I included a bootstrap simple form which updates the form based on inputs. I also included a delete button that allows the user to delete the organisation.
<br>Added `gem 'simple-form'` to the Gemfile and ran `bundle install` so I could use this bootstrap styled form.

Shifts - 
<br>I created a HTML table with table headers and shifts as the table rows.
<br>I iterated over each shift and displayed all the required information in the required format for the table headers.
<br>I rendered a bootstrap form that is associated with organisation, allowing users to add their shifts

----
### Optionals
Users Details:
<br>I added a link to the first page so a user could update their profile
<br>I updated the edit form to include 'name' in Views > Users > Registrations > edit.html.erb

Modifying/Deleting Shifts:
<br>I updated the routes.rb to have destroy, edit and update paths, and updated the Shifts controller to have a destroy, edit and update methods.
<br>I added a 'Delete' and 'Edit' button to the shifts.

----
### Challenges:
One of the main challenges I came across while building this app was with the join and leave methods.
<br>The links I had created for users to join and leave organisations, wasn't updating the data for my user model. 
<br>I eventually managed to work out that both 'join' and 'leave' needed to be member routes. 
<br>Once I updated this and the controller with their own methods, the users were saving as they should.
