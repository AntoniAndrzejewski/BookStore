<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CartView.aspx.cs" Inherits="BookStore.Pages.CartView"
    MasterPageFile="~/Pages/Store.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="bodyContent" runat="server">
    <div id="content">
        <h2>Twój koszyk</h2>
        <table id="cartTable">
            <thead>
                <tr>
                    <th>Ilość</th>
                    <th>Nazwa</th>
                    <th>Cena</th>
                    <th>Koszt</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="Repeater1" ItemType="BookStore.Models.CartLine"
                    SelectMethod="GetCartLines" runat="server" EnableViewState="false">
                    <ItemTemplate>
                        <tr>
                            <td><%# Item.Quantity %></td>
                            <td><%# Item.Book.Name %></td>
                            <td><%# Item.Book.Price.ToString("c")%></td>
                            <td><%# ((Item.Quantity * 
                                Item.Book.Price).ToString("c"))%></td>
                            <td>
                                <button type="submit" class="actionButtons" name="remove"
                                    value="<%#Item.Book.BookId %>">
                                    Kasuj</button>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="3">Razem:</td>
                    <td><%= CartTotal.ToString("c") %></td>
                </tr>
            </tfoot>
        </table>
        <p class="actionButtons">
            <a href="<%= ReturnUrl %>">Kontynuuj zakupy</a>
            <a href="<%= CheckoutUrl %>">Złóż zamówienie</a>
        </p>
    </div>
</asp:Content>

