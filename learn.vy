# @pragma version 0.4.0
# @license MIT 

struct Person:
    fav_number: uint256
    name: String[100]



has_favourite_number: public(uint256)
list_of_number: public(uint256[5])
index: public(uint256)
list_of_people: public(Person[5])

name_to_fav: public(HashMap[String[100], uint256])


@deploy
def __init__():
    self.has_favourite_number = 7
    self.index = 0

@external
def store(new_number: uint256):
    #self check if it is a state variable so use self
    self.has_favourite_number = new_number
    #self.retrive()
    #technically if i call the self.retrive() view function here it 
    # will cost gas. 

@external
@view
def retrive() -> uint256:
    return self.has_favourite_number

@external
def add_number(name: String[100], fav_number: uint256):
    self.list_of_number[self.index] = fav_number

    #mapping the fav_name to fav_number
    self.name_to_fav[name] = fav_number
    
    #struct of person
    new_person: Person = Person(fav_number = fav_number, name=name)
    #adding an index so we tie it to the new struct (new_person)
    self.list_of_people[self.index] = new_person
    #change the index
    self.index += 1










