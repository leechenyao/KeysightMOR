<%@ Page Title="Responsiveness User Settings | Keysight Technologies" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="ResponsivenessUserViewEdit.aspx.cs" Inherits="KeysightMOR.ControlPanel.ResponsivenessUserViewEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Assets/Stylesheets/controlpanel.css" />
    <link rel="stylesheet" href="../Assets/Stylesheets/ControlPanel/ResponsivenessUserViewEdit.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left:auto;margin-right:auto">
        <div class="confR_box">       
        <h2>Evaluation Settings > Responsiveness</h2>
        <fieldset>
            <div class="description">
                <p class="title-description" style="text-align:center">View or edit current users for Responsiveness</p>
            </div>
         
            <asp:Table ID="Responsiveness" runat="server" CellSpacing="0">
                <asp:TableRow>
                    <asp:TableCell CssClass="Rtable" style="width:50px"><h3>R1</h3></asp:TableCell>
                    <asp:TableCell><h3>Communication</h3></asp:TableCell>
                    <asp:TableCell><h3>Assigned Users</h3></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell CssClass="cell_num">1</asp:TableCell>
                    <asp:TableCell>How many cases of delay in responds that you experienced within the month of under review? (Response within 1 business day min)</asp:TableCell>
                    <asp:TableCell CssClass="cell_num"><asp:HyperLink ID="R1_1" runat="server" CssClass="edit_link">[Edit]</asp:HyperLink></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell CssClass="cell_num">2</asp:TableCell>
                    <asp:TableCell>No/delay in response due to unavailability of backup?</asp:TableCell>
                    <asp:TableCell CssClass="cell_num"><asp:HyperLink ID="R1_2" runat="server" CssClass="edit_link">[Edit]</asp:HyperLink></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell CssClass="cell_num">3</asp:TableCell>
                    <asp:TableCell>Proactively communicate process changes, critical issues or potential problems internally/with suppliers/with Keysight accurately in a timely manner</asp:TableCell>
                    <asp:TableCell CssClass="cell_num"><asp:HyperLink ID="R1_3" runat="server" CssClass="edit_link">[Edit]</asp:HyperLink></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell><h3>R2</h3></asp:TableCell>
                    <asp:TableCell><h3>Materials Management and Reporting</h3></asp:TableCell>
                    <asp:TableCell><h3>Assigned Users</h3></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell CssClass="cell_num">1</asp:TableCell>
                    <asp:TableCell>Proactively manages shortages process </asp:TableCell>
                    <asp:TableCell CssClass="cell_num"><asp:HyperLink ID="R2_1" runat="server" CssClass="edit_link">[Edit]</asp:HyperLink></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell RowSpan="2" CssClass="cell_num" style="padding:0 10px 0 10px">2<br />Reacts appropriately to increases/decreases in Keysight Demand in a timely manner</asp:TableCell>
                    <asp:TableCell>a) Fulfillment of LLM Safety Stock</asp:TableCell>
                    <asp:TableCell CssClass="cell_num"><asp:HyperLink ID="R2_2a" runat="server" CssClass="edit_link">[Edit]</asp:HyperLink></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>b) Fulfillment of FG Safety Stock</asp:TableCell>
                    <asp:TableCell CssClass="cell_num"><asp:HyperLink ID="R2_2b" runat="server" CssClass="edit_link">[Edit]</asp:HyperLink></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell RowSpan="6" CssClass="cell_num">3 <br />Provides timely monthly reports</asp:TableCell>
                    <asp:TableCell>a) AP/AR</asp:TableCell>
                    <asp:TableCell CssClass="cell_num"><asp:HyperLink ID="R2_3a" runat="server" CssClass="edit_link">[Edit]</asp:HyperLink></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>b) inventory</asp:TableCell>
                    <asp:TableCell CssClass="cell_num"><asp:HyperLink ID="R2_3b" runat="server" CssClass="edit_link">[Edit]</asp:HyperLink></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>c) ECN</asp:TableCell>
                    <asp:TableCell CssClass="cell_num"><asp:HyperLink ID="R2_3c" runat="server" CssClass="edit_link">[Edit]</asp:HyperLink></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>d) PPV monthly report</asp:TableCell>
                    <asp:TableCell CssClass="cell_num"><asp:HyperLink ID="R2_3d" runat="server" CssClass="edit_link">[Edit]</asp:HyperLink></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>e) Stock On Hand Revalution report (inclusive quarterly PPV report)</asp:TableCell>
                    <asp:TableCell CssClass="cell_num"><asp:HyperLink ID="R2_3e" runat="server" CssClass="edit_link">[Edit]</asp:HyperLink></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>f) Reports related to your area/ portfollio</asp:TableCell>
                    <asp:TableCell CssClass="cell_num"><asp:HyperLink ID="R2_3f" runat="server" CssClass="edit_link">[Edit]</asp:HyperLink></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br />                              
        </fieldset>
    </div> 
    </div>

    <!----POP UP--->
    <div id="editdialog" class="overlay">
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
                        <asp:ListBox ID="lbUsers" runat="server" Height="200px" Width="350px" CssClass="list_box">
                            <asp:ListItem>Art McLean (CTD)</asp:ListItem>
                            <asp:ListItem>Teoh TC (CTD)</asp:ListItem>
                            <asp:ListItem>HENG SY (CTD)</asp:ListItem>
                            <asp:ListItem>Art McLean (SA)</asp:ListItem>
                            <asp:ListItem>Lim Eng Chuan (SA)</asp:ListItem>
                            <asp:ListItem>Tan Hian See (SA)</asp:ListItem>
                            <asp:ListItem>Wong Weng Yew (SA)</asp:ListItem>
                        </asp:ListBox></td>
                    <td class="cell_buttons">
                        <p>
                            <asp:Button ID="Button1" runat="server" Text=">>" CssClass="popupButton" />
                        </p>
                        <p>
                            <asp:Button ID="Button2" runat="server" Text="<<" CssClass="popupButton" />
                        </p>
                        <p>
                            <asp:Button ID="Save" runat="server" Text="Save" CssClass="popupButton" />
                        </p>
                        <p>
                            <asp:Button ID="Button5" runat="server" Text="Cancel" CssClass="popupButton" />
                        </p>

                    </td>
                    <td>
                        <asp:ListBox ID="ListBox2" runat="server" Height="200px" Width="350px" CssClass="list_box">
                            <asp:ListItem>Lim Eng Chuan (MBO)</asp:ListItem>
                            <asp:ListItem>Tan Hian See (MBO)</asp:ListItem>
                            <asp:ListItem>Wong Bee (MMA)</asp:ListItem>
                            <asp:ListItem>Tan Chin Sian (MMA)</asp:ListItem>
                            <asp:ListItem>Lim Kin Moon (MMA)</asp:ListItem>
                            <asp:ListItem>Leong Wai Meng (MMA)</asp:ListItem>

                        </asp:ListBox></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
