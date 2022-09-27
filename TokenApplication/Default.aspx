<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TokenApplication._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <h3>Save / Update token</h3>
        <asp:Table runat="server">
            
            <asp:TableRow>
                <asp:TableCell></asp:TableCell>
                <asp:TableCell><asp:HiddenField ID="txtID" runat="server"></asp:HiddenField></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell><asp:Label ID="Label1" runat="server" Text="Name"></asp:Label></asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtName" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell><asp:Label ID="Label2" runat="server" Text="Symbol"></asp:Label>  </asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtSymbol" runat="server"></asp:Textbox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell><asp:Label ID="Label3" runat="server" Text="Contract Address"></asp:Label></asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtContractAddres" runat="server"></asp:Textbox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell><asp:Label ID="Label4" runat="server" Text="Total Supply"></asp:Label></asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtTotalSupply" runat="server"></asp:Textbox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell><asp:Label ID="Label5" runat="server" Text="Total Holders"></asp:Label></asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtTotalHolders" runat="server"></asp:Textbox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell></asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                    <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

        <div style="margin-bottom: 25px"></div>

        <asp:GridView ID="grdTokens" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="Rank" DataField="id" />
                <asp:BoundField HeaderText="Symbol" DataField="symbol" />
                <asp:BoundField HeaderText="Name" DataField="name" />                
                <asp:BoundField HeaderText="Contract Address" DataField="contract_address" />                
                <asp:BoundField HeaderText="Total Holders" DataField="total_holders" />
                <asp:BoundField HeaderText="Total Supply" DataField="total_supply" />
                <asp:BoundField HeaderText="Total Supply %" DataField="total_supply_percentage" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="btnEdit" runat="server" ForeColor="#3333FF" OnCommand="btnEdit_Click" CommandArgument='<%# Eval("id")%>' >Edit</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </div>


</asp:Content>
