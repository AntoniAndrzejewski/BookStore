<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CartSummary.ascx.cs" 
   Inherits="BookStore.Controls.CartSummary" %>

<div id="cartSummary">
    <span class="caption">
        <b>W Koszyku:</b>
        <span id="csQuantity" runat="server"></span> książek,
        <span id="csTotal" runat="server"></span>
    </span>
    <a id="csLink" runat="server">Koszyk</a>
</div>

