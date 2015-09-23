<%@ Page Title="Add Division | Keysight Technologies" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="AddDivision.aspx.cs" Inherits="KeysightMOR.ControlPanel.AddDivision" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Assets/Stylesheets/controlpanel.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left: auto; margin-right: auto">
        <div class="box" style="text-align: center">
            <h2>Add Division</h2>

            <fieldset>
                <p>Division Name:</p>

                <p>
                    <asp:TextBox ID="txtAddDivision" runat="server" class="txtbox"></asp:TextBox>
                </p>

                <p>
                    <asp:RequiredFieldValidator ID="valdtxtAddDivName" runat="server" ControlToValidate="txtAddDivision" ErrorMessage="You must enter a division name!" ForeColor="Red"></asp:RequiredFieldValidator>
                </p>

                <p>
                    <asp:Label ID="lblAddDivisionStatus" runat="server" ForeColor="Red"></asp:Label>
                </p>

                <p>
                    <asp:Button ID="btnCreateDivision" runat="server" Text="Create" CssClass="action-button hvr-radial-out" OnClick="btnCreateDivision_Click"
                        OnClientClick="return confirm('Are you sure you want to add this CM into the database?')" />
                    &nbsp;&nbsp;&nbsp;
                 
                <asp:HyperLink ID="hlCancelDivision" runat="server" Text="Cancel" CssClass="cancel_button" NavigateUrl="~/ControlPanel/Index.aspx"></asp:HyperLink>
                    <%-- <asp:Button ID="btnCancelDivision" runat="server" Text="Cancel" CssClass="cancel_button" PostBackUrl="~/ControlPanel/Index.aspx" />--%>
                </p>

            </fieldset>
        </div>
        <%--End of box div--%>
    </div>
    <%--End of Web form centering div--%>
</asp:Content>
