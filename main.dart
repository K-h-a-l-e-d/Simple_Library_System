import 'Library.dart';

void main() {
  Library library = Library();
  //How to use:
  //library.displayInfo()   : Displays list of Books with their ID and Availability status along with
  //                          authorized Users who have access to the books
  //library.borrowBook(userName: 'Authorized User Name', bookTitle: 'Name of the book that exists');//
  //library.returnBook(userName: 'Authorized User Name', bookTitle: 'Name of the book to be returned');

  library.displayInfo();
  /******* test case 1: Successfull operation of adding a user & adding borriwing, returning a book  ****/
  library.addUser(id: 3, userName: 'Ali');
  library.addBook(id: 3, title: 'MacBeth');
  library.borrowBook(userName: 'Ali', bookTitle: 'MacBeth');
  library.returnBook(userName: 'Ali', bookTitle: 'MacBeth');

  /*********** test case 2: trying to borrow a book that is already borrowed *********/
  library.borrowBook(userName: 'Khaled', bookTitle: 'Shakespeare');
  library.borrowBook(userName: 'Khaled', bookTitle: 'Shakespeare');

  /*********** test case 3: trying to add a book that exists  *********/
  library.addBook(id: 3, title: 'MacBeth');

  /*********** test case 4: UnAuthorized user trys to borrow a book *********/
  library.borrowBook(userName: 'Mahmoud', bookTitle: 'Fairy Tales');
}
