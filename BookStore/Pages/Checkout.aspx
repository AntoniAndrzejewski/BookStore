<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" 
    Inherits="BookStore.Pages.Checkout"
    MasterPageFile="~/Pages/Store.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="bodyContent" runat="server">
    <div id="content">

        <div id="checkoutForm" class="checkout" runat="server">
            <h2>Złóż zamówienie</h2>
            Wprowadź dane!

        <div id="errors" data-valmsg-summary="true">
            <ul>
                <li style="display:none"></li>
            </ul>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        </div>

            <h3>Заказчик</h3>
            <div>
                <label for="name">Imię:</label>
                <SX:VInput Property="Name" runat="server" />
            </div>

            <h3>Adres</h3>
            <div>
                <label for="line1">Adres 1:</label>
                <SX:VInput Property="Line1" runat="server" />
            </div>
            <div>
                <label for="line2">Adres 2:</label>
                <SX:VInput Property="Line2" runat="server" />
            </div>
            <div>
                <label for="line3">Adres 3:</label>
                <SX:VInput Property="Line3" runat="server" />
            </div>
            <div>
                <label for="city">Miasto:</label>
                <SX:VInput Property="City" runat="server" />
            </div>

            <h3>Szczegóły zamówienia</h3>
            <input type="checkbox" id="giftwrap" name="giftwrap" value="true" />
            Zapakować jako prezent?
        
        <p class="actionButtons">
            <button class="actionButtons" type="submit">Edytuj zamówienie</button>
        </p>
        </div>
        <div id="checkoutMessage" runat="server">
            <h2>Dziękuję!</h2>
            Dziękujemy za złożenie zamówienia!   
        </div>
    </div>
</asp:Content>