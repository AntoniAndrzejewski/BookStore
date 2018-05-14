using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookStore.Models;
using BookStore.Models.Repository;
using System.Web.ModelBinding;

namespace BookStore.Pages.Admin
{
    public partial class Books : System.Web.UI.Page
    {
        private Repository repository = new Repository();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IEnumerable<Book> GetBooks()
        {
            return repository.Books;
        }

        public void UpdateGame(int BookID)
        {
            Book myBook = repository.Books
                .Where(p => p.BookId == BookID).FirstOrDefault();
            if (myBook != null && TryUpdateModel(myBook,
                new FormValueProvider(ModelBindingExecutionContext)))
            {
                repository.SaveBook(myBook);
            }
        }

        public void DeleteBook(int BookID)
        {
            Book myBook = repository.Books
                .Where(p => p.BookId == BookID).FirstOrDefault();
            if (myBook != null)
            {
                repository.DeleteBook(myBook);
            }
        }

        public void InsertBook()
        {
            Book myBook = new Book();
            if (TryUpdateModel(myBook,
                new FormValueProvider(ModelBindingExecutionContext)))
            {
                repository.SaveBook(myBook);
            }
        }
    }
}