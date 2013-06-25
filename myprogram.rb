class Library
  def initialize (shelfNum)
      @shelves = Array.new(shelfNum)
      for i in 0..shelfNum-1
        @shelves[i] = Shelf.new(i)
      end
  end
  
  def addBookToShelf (book, shelf)
      @shelves[shelf].addBook(book)
  end
  
  def removeBookFromShelf(book, shelf)
    @shelves[shelf].removeBook(book)
  end
    
  def shelfCount
    @shelves.size()
  end
  
  def print ()
    @shelves.each do |shelf|
      booklist = shelf.books
      booklist.each do |book|
        book.print()
      end  
    end
  end
end

class Shelf
  def initialize (id)
    @id = id
    @books = []
  end
  
  def id
    @id
  end
  
  def books
    @books
  end
  
  def removeBook(book)
    @books.delete(book)
  end
  
  def addBook(book)
    @books.push(book)
  end
end

class Book
  def initialize (title, author)
    @title = title
    @author = author
  end
  
  def enshelf(library, shelf)
      @shelf = shelf
      library.addBookToShelf(self, shelf);
  end
  
  def unshelf (library)
    library.removeBookFromShelf(self, @shelf);
    @shelf = nil
  end
  
  def print ()
    puts @title + " by " + @author
  end
end

library = Library.new(2)
book1 = Book.new("To Kill a Mockingbird", "Harper Lee")
book2 = Book.new("To Kill a Mockingbird 2: More Mock, Less Bird", "Harper Lee")
book2.enshelf(library, 0)
book1.enshelf(library, 1)

#Output
puts "Welcome to the Library!"
puts "The Library has " + library.shelfCount.to_s + " shelves"
puts "The Library has the following books in stock: "
library.print
