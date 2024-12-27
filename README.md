# Simple Library System

## Code Description
This is a simple Library system which manages a list of existing books, and authorized Users, where authorized Users Can Borrow and return Books
based on their Availability status(Available/Borrowed), also new books can be added to library books, and new Users can be added to Library's authorized Users List as well.  

## How to Use:  
How to use: Create a Library instance with a default Constructor: Library library = Library();  
Method: library.displayInfo() : Displays a list of Books with their ID and Availability status along with
				                        authorized Users who have access to the books  
Method: library.borrowBook(userName: 'Authorized User Name', bookTitle: 'Name of the book that exists');  
Method: library.returnBook(userName: 'Authorized User Name', bookTitle: 'Name of the book to be returned');  

## Code Output:  
the output display the code with the following test case scenarios:  
test case 1: Successfull operation of adding a user & adding borrowing, returning a book  
test case 2: trying to borrow a book that is already borrowed  
test case 3: trying to add a book that exists  
test case 4: UnAuthorized user trys to borrow a book  

![CodeOutput](https://github.com/user-attachments/assets/0c6c1503-f9ce-45cc-b0dc-add3efc90091)
