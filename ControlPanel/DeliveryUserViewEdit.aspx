<%@ Page Title="Delivery User Settings | Keysight Technologies" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="DeliveryUserViewEdit.aspx.cs" Inherits="KeysightMOR.ControlPanel.DeliveryUserViewEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Assets/Stylesheets/controlpanel.css" />
    <link rel="stylesheet" href="../Assets/Stylesheets/ControlPanel/DeliveryUserViewEdit.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div >
        <div class="confD_box" style="margin-left: auto; margin-right: auto">
            <h2>Evaluation Settings > Delivery</h2>

            <fieldset>
                <div class="description">
                    <p class="title-description" style="text-align:center">View or edit current users for Delivery</p>
                </div>

                <asp:Table ID="Delivery" CssClass="duve_table" runat="server">
                    <asp:TableRow>
                        <asp:TableCell><h3>Delivery Template (BRP and Manual)</h3></asp:TableCell>
                        <asp:TableCell><h3>Assigned Users</h3></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Actual delivery versus request (CRD)</asp:TableCell>
                        <asp:TableCell CssClass="cell_num"><asp:HyperLink ID="D1_1" CssClass="edit_link" runat="server">[Edit]</asp:HyperLink></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Actual delivery versus commit (OTD)</asp:TableCell>
                        <asp:TableCell CssClass="cell_num"><asp:HyperLink ID="D1_2" CssClass="edit_link" runat="server">[Edit]</asp:HyperLink></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Commit versus request (Commit)</asp:TableCell>
                        <asp:TableCell CssClass="cell_num"><asp:HyperLink ID="D1_3" CssClass="edit_link" runat="server">[Edit]</asp:HyperLink></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Exception commit (Exception)</asp:TableCell>
                        <asp:TableCell CssClass="cell_num"><asp:HyperLink ID="D1_4" CssClass="edit_link" runat="server">[Edit]</asp:HyperLink></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell><h3>Delivery Template (IODM)</h3></asp:TableCell>
                        <asp:TableCell><h3>Assigned Users</h3></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Actual versus purchase order (CRD)</asp:TableCell>
                        <asp:TableCell CssClass="cell_num"><asp:HyperLink ID="D2_1" CssClass="edit_link" runat="server">[Edit]</asp:HyperLink></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Commit versus request (Commit)</asp:TableCell>
                        <asp:TableCell CssClass="cell_num"><asp:HyperLink ID="D2_2" CssClass="edit_link" runat="server">[Edit]</asp:HyperLink></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Exception commit (Exception)</asp:TableCell>
                        <asp:TableCell CssClass="cell_num"><asp:HyperLink ID="D2_3" CssClass="edit_link" runat="server">[Edit]</asp:HyperLink></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <br />
            </fieldset>

        </div>
    </div>

    <!----POP UP--->
    <div id="editdialog" class="overlay" style="margin-left: auto; margin-right: auto; text-align:center">
        <div class="popup">
            <a class="close" href="#">×</a>
            <br />
            <h2>Edit Users</h2>

            <table class="edituser_table">
                <tr>
                    <td align="center" class="td_h3">
                        <h3>Available Users</h3>
                    </td>
                    <td></td>
                    <td align="center" class="td_h3">
                        <h3>Assigned Users</h3>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ListBox ID="lbAvailableUsers" runat="server" Height="200px" Width="350px" CssClass="list_box">
                            <asp:ListItem>Art McLean (CTD)</asp:ListItem>
                            <asp:ListItem>Teoh TC (CTD)</asp:ListItem>
                            <asp:ListItem>HENG SY (CTD)</asp:ListItem>
                            <asp:ListItem>Art McLean (SA)</asp:ListItem>
                            <asp:ListItem>Lim Eng Chuan (SA)</asp:ListItem>
                            <asp:ListItem>Tan Hian See (SA)</asp:ListItem>
                            <asp:ListItem>Wong Weng Yew (SA)</asp:ListItem>
                        </asp:ListBox>
                    </td>

                    <td class="cell_buttons">
                        <p>
                            <asp:Button ID="btnAssignUser" runat="server" Text=">>" CssClass="popupButton" />
                        </p>
                        <p>
                            <asp:Button ID="btnRemoveUser" runat="server" Text="<<" CssClass="popupButton" />
                        </p>
                        <p>
                            <asp:Button ID="btnSaveChanges" runat="server" Text="Save" CssClass="popupButton" />
                        </p>
                        <p>
                            <asp:Button ID="btnCancelChanges" runat="server" Text="Cancel" CssClass="popupButton" />
                        </p>
                    </td>

                    <td>
                        <asp:ListBox ID="lbAssignedUsers" runat="server" Height="200px" Width="350px" CssClass="list_box">
                            <asp:ListItem>Lim Eng Chuan (MBO)</asp:ListItem>
                            <asp:ListItem>Tan Hian See (MBO)</asp:ListItem>
                            <asp:ListItem>Wong Bee (MMA)</asp:ListItem>
                            <asp:ListItem>Tan Chin Sian (MMA)</asp:ListItem>
                            <asp:ListItem>Lim Kin Moon (MMA)</asp:ListItem>
                            <asp:ListItem>Leong Wai Meng (MMA)</asp:ListItem>
                        </asp:ListBox>
                    </td>
                </tr>
            </table>
        </div>
    </div>

</asp:Content>
