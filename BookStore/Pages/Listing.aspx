<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listing.aspx.cs" Inherits="BookStore.Pages.Listing"
    MasterPageFile="~/Pages/Store.Master" %>
<%@ Import Namespace="System.Web.Routing" %>

<asp:Content ContentPlaceHolderID="bodyContent" runat="server">
    <div id="content">
        <asp:Repeater ItemType="BookStore.Models.Book"
            SelectMethod="GetBooks" runat="server">
            <ItemTemplate>
                <div class="item">
                      
                    <img style="float:left;width:170px;height:170px;margin-right:15px;" src="@Url.Action("GetImage", "Book", />
                    <h3><%# Item.Name %></h3>
                    <h4><%# Item.Author %></h4>
                    <%# Item.Description %>
                    <h4><%# Item.Price.ToString("c") %></h4>
                    <button name="add" type="submit" value="<%# Item.BookId %>" >
                        Dodaj do Koszyka
                    </button>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="pager">
        <%
            for (int i = 1; i <= MaxPage; i++)
            {
                string category = (string)Page.RouteData.Values["category"]
                    ?? Request.QueryString["category"];
                
                string path = RouteTable.Routes.GetVirtualPath(null, null,
                    new RouteValueDictionary() { {"category", category}, { "page", i } }).VirtualPath;
                Response.Write(
                    String.Format("<a href='{0}' {1}>{2}</a>",
                        path, i == CurrentPage ? "class='selected'" : "", i));
            }
        %>
    </div>
    <!-- Footer -->
    <footer class="w3-container w3-padding-16">
        <h3>BookStore</h3>
        <p>ASP.Net WEB Forms & CSS W3</p>
    </footer>
</asp:Content>

