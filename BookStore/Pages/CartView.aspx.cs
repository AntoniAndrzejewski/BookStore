using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookStore.Models;
using BookStore.Models.Repository;
using BookStore.Pages.Helpers;
using System.Web.Routing;

namespace BookStore.Pages
{
    public partial class CartView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Repository repository = new Repository();
                int bookId;
                if (int.TryParse(Request.Form["remove"], out bookId))
                {
                    Book bookToRemove = repository.Books
                        .Where(g => g.BookId == bookId).FirstOrDefault();
                    if (bookToRemove != null)
                    {
                        SessionHelper.GetCart(Session).RemoveLine(bookToRemove);
                    }
                }
            }
        }
        public IEnumerable<CartLine> GetCartLines()
        {
            return SessionHelper.GetCart(Session).Lines;
        }

        public decimal CartTotal
        {
            get
            {
                return SessionHelper.GetCart(Session).ComputeTotalValue();
            }
        }

        public string ReturnUrl
        {
            get
            {
                return SessionHelper.Get<string>(Session, SessionKey.RETURN_URL);
            }
        }

        public string CheckoutUrl
        {
            get
            {
                return RouteTable.Routes.GetVirtualPath(null, "checkout",
                    null).VirtualPath;
            }
        }
    }
}