using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace BookStore.Models.Repository
{
    public class Repository
    {
        private EFDbContext context = new EFDbContext();

        public IEnumerable<Book> Books
        {
            get { return context.Books; }
        }

        // Чтение данных из таблицы Orders
        public IEnumerable<Order> Orders
        {
            get
            {
                return context.Orders
                    .Include(o => o.OrderLines.Select(ol => ol.Book));
            }
        }

        public void SaveBook(Book book)
        {
            if (book.BookId == 0)
            {
                book = context.Books.Add(book);
            }
            else
            {
                Book dbBook = context.Books.Find(book.BookId);
                if (dbBook != null)
                {
                    dbBook.Name = book.Name;
                    dbBook.Author = book.Author;
                    dbBook.Description = book.Description;
                    dbBook.Price = book.Price;
                    dbBook.Category = book.Category;
                    dbBook.ImageData = book.ImageData;
                    dbBook.ImageMimeType = book.ImageMimeType;
                }
            }
            context.SaveChanges();
        }

        public void DeleteBook(Book book)
        {
            IEnumerable<Order> orders = context.Orders
                .Include(o => o.OrderLines.Select(ol => ol.Book))
                .Where(o => o.OrderLines
                    .Count(ol => ol.Book.BookId == book.BookId) > 0)
                .ToArray();

            foreach (Order order in orders)
            {
                context.Orders.Remove(order);
            }
            context.Books.Remove(book);
            context.SaveChanges();
        }

        // Сохранить данные заказа в базе данных
        public void SaveOrder(Order order)
        {
            if (order.OrderId == 0)
            {
                order = context.Orders.Add(order);

                foreach (OrderLine line in order.OrderLines)
                {
                    context.Entry(line.Book).State
                        = EntityState.Modified;
                }

            }
            else
            {
                Order dbOrder = context.Orders.Find(order.OrderId);
                if (dbOrder != null)
                {
                    dbOrder.Name = order.Name;
                    dbOrder.Line1 = order.Line1;
                    dbOrder.Line2 = order.Line2;
                    dbOrder.Line3 = order.Line3;
                    dbOrder.City = order.City;
                    dbOrder.GiftWrap = order.GiftWrap;
                    dbOrder.Dispatched = order.Dispatched;
                }
            }
        }
    }
}
