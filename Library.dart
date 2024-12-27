class _Book {
  int? id;
  String? title;
  bool? _isBorrowed = false;

  _Book({required this.id, required this.title, bool? isBorrowed})
      : _isBorrowed = isBorrowed;

  void displayInfo() {
    print('Book\'s ID: ${this.id}\nBook\'s title: ${this.title}');
    print(
        'Book\'s Status: ${_isBorrowed == true ? 'Borrowed' : 'Available'}\n');
  }
}

class _User {
  final int? id;
  final String? name;

  List<_Book>? borrowedBooks = [];

  _User({this.id, this.name});

  void displayInfo() {
    print('User ID: ${this.id}\nUser name: ${this.name}\n');
  }
}

class Library {
  List<_Book>? listOfBooks = [
    _Book(id: 1, title: 'Shakespeare', isBorrowed: false),
    _Book(id: 2, title: 'Fairy Tales', isBorrowed: false),
  ];

  List<_User>? listOfUsers = [
    _User(id: 1, name: 'Khaled'),
    _User(id: 2, name: 'Mohamed'),
  ];

  void addBook({required int? id, required String? title}) {
    print('\nPlease Wait, Requesting to Add ${title} Book to the Library...');
    // Checks if book id doesn't exist
    if (!(listOfBooks!.any((existingBook) => existingBook.id == id))) {
      listOfBooks!.add(_Book(id: id, title: title));
      print('${title} Book has been added to the Library Successfully!\n');
    } else {
      print('This Book already exists in the library\n');
    }
  }

  void addUser({required int? id, required String? userName}) {
    print(
        '\nPlease Wait, Adding User ${userName} to the Library\'s Authorized Users...');
    // Checks if book id doesn't exist
    if (!(listOfBooks!.any((existingBook) => existingBook.id == id))) {
      listOfUsers!.add(_User(id: id, name: userName));
      print(
          'User ${userName} has been added to the Library Authorized Users Successfully!\n');
    } else {
      print('This User already exists in the library Authorized Users');
    }
  }

  void borrowBook({String? userName, String? bookTitle}) {
    //checking if user & book exists in the library then returning their respective
    //element and storing them in the user, book variables respectively otherwise null will be stored
    _Book? book = findBook(this.listOfBooks!, bookTitle);
    _User? user = findUser(this.listOfUsers!, userName);
    print(
        'User $userName has requested to borrow $bookTitle Book, please wait...');
    if (user != null) {
      if (book != null) {
        if (book._isBorrowed == false) {
          listOfBooks![user.id! - 1]._isBorrowed = true;
          print(
              'User ${listOfUsers![user.id! - 1].name} has borrowed ${listOfBooks![book.id! - 1].title} Book\n');
        } else {
          print('Sorry $bookTitle Book is borrowed\n');
        }
      } else {
        print('$bookTitle Book is not available in the library\n');
      }
    } else {
      print('$userName is not an Authorized User\n');
    }
  }

  void returnBook({String? userName, String? bookTitle}) {
    //checking if user & book exists in the library then returning their respective
    //element and storing them in the user, book variables respectively otherwise null will be stored
    _Book? book = findBook(this.listOfBooks!, bookTitle);
    _User? user = findUser(this.listOfUsers!, userName);

    if (user != null) {
      if (book != null) {
        listOfBooks![user.id! - 1]._isBorrowed = false;
        print(
            'User ${listOfUsers![user.id! - 1].name} has returned ${listOfBooks![book.id! - 1].title} Book\n');
      }
    }
  }

  void displayInfo() {
    if (listOfBooks!.isNotEmpty) {
      print('Library Books List:');
      listOfBooks!.forEach((book) {
        book.displayInfo();
      });
    } else {
      print('Books list is Empty\n');
    }

    if (listOfUsers!.isNotEmpty) {
      print('Authorized Users List:');
      listOfUsers!.forEach((user) {
        user.displayInfo();
      });
    } else {
      print('No Authorized Users Found');
    }
  }
}

findBook(List listOfBooks, String? bookTitle) {
  for (_Book book in listOfBooks) {
    if (bookTitle == book.title) return book;
  }
}

findUser(List listOfUsers, String? userName) {
  for (_User user in listOfUsers) {
    if (userName == user.name) return user;
  }
}
