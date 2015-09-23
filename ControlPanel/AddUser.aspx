<%@ Page Title="Add User | Keysight Technologies" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="KeysightMOR.ControlPanel.AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Assets/Stylesheets/controlpanel.css" />
    <link rel="stylesheet" href="../Assets/Stylesheets/ControlPanel/AddUser.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left: auto; margin-right: auto">
        <div class="this_box">
            <h2>Add User</h2>
            <fieldset>
                <asp:ScriptManager runat="server" />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
                <asp:Table ID="Table1" CssClass="adduser_table" runat="server">
                    <asp:TableRow>
                        <asp:TableCell Width="150px">Name</asp:TableCell>
                        <asp:TableCell><asp:TextBox ID="usrName" runat="server" CssClass="txtbox"></asp:TextBox></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell>
                        <asp:TableCell><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="usrName" ErrorMessage="Name is required" ForeColor="Red"></asp:RequiredFieldValidator></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Email Address</asp:TableCell>
                        <asp:TableCell><asp:TextBox ID="usrEmail" runat="server" CssClass="txtbox"></asp:TextBox></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell>
                        <asp:TableCell><asp:RequiredFieldValidator ID="valdEmail" runat="server" ControlToValidate="usrEmail" ErrorMessage="Email is required" ForeColor="Red"></asp:RequiredFieldValidator><asp:Label ID="EmailExist" runat="server" ForeColor="Red"></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Position</asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="Position" AutoPostBack="true" runat="server" OnSelectedIndexChanged="Position_Changed">
                                <asp:ListItem Value="Employee" Text="Employee"></asp:ListItem>
                                <asp:ListItem Value="Admin" Text="Admin"></asp:ListItem>
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell>
                        <asp:TableCell><asp:RequiredFieldValidator ID="validPosition" runat="server" ControlToValidate="Position" ErrorMessage="Position is required" ForeColor="Red"></asp:RequiredFieldValidator></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Visible="false">
                        <asp:TableCell>Division</asp:TableCell>
                            <asp:TableCell style=""><div style="overflow:auto; height:150px; padding:0">
                                <asp:GridView ID="DivisionList" runat="server" DataKeyNames="DivID" AutoGenerateColumns="False" EmptyDataText="There are no data records to display." GridLines="None" >
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="SelectDivision" runat="server"></asp:CheckBox>
                                            </ItemTemplate>                   
                                        </asp:TemplateField>    
                                        <asp:BoundField DataField="DivName" HeaderText="Division" SortExpression="DivName" />
                                        <asp:BoundField DataField="DivID" SortExpression="DivID" Visible="false"/>
                                    </Columns>
                                </asp:GridView></div>
                            </asp:TableCell>
                        </asp:TableRow>
                </asp:Table>
                </ContentTemplate></asp:UpdatePanel>                
                <br />
                <p style="text-align:center">
                    <asp:Label ID="lblAddUserStatus" runat="server" Text="" ForeColor="Red"></asp:Label>
                </p>
                <div class="div_button" style="text-align:center">
                    <asp:Button ID="btnCreateUser" runat="server" Text="Create" CssClass="action-button hvr-radial-out" OnClick="btnCreateUser_Click" 
                        OnClientClick="return confirm('Are you sure you want to create this user?')"/>

                    &nbsp;&nbsp;
                    
                    <asp:HyperLink ID="hlCancelUser" runat="server" Text="Cancel" CssClass="cancel_button" NavigateUrl="~/ControlPanel/Index.aspx"></asp:HyperLink>
                    <%--<asp:Button ID="Button4" runat="server" Text="Cancel" CssClass="cancel_button" />--%>
                 </div>
            </fieldset>
        </div>      
    </div>
</asp:Content>
