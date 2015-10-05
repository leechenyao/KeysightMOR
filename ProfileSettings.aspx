<%@ Page Title="Profile Settings | Keysight Technologies" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="ProfileSettings.aspx.cs" Inherits="KeysightMOR.ProfileSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .mainbox {
            background-color: #fff;
            color: #000;
            font-size: 16px;
            width: 600px;
            -moz-box-shadow: 0px 3px 6px #c9c9c9;
            -webkit-box-shadow: 0px 3px 6px #c9c9c9;
            box-shadow: 0px 3px 6px #c9c9c9;
            margin:30px auto 30px auto;
        }

        fieldset {
            background-color: #fff;
            border: none;
            margin: auto;
        }

        h2 {
            color: #fff;
            background-color: #d32f2f;
            font-size: 20px;
            letter-spacing: 1px;
            height: 60px;
            line-height: 60px;
            text-align: center;
        }
        /*-----Buttons----------*/
        .cancel_button {
            padding: 7px 10px 10px 10px;
            font-size: 16px;
            font-family: 'Lato', sans-serif;
            color: #fff;
            border: solid 5px #e90029;
            text-decoration: none;
            background-color: #e90029;
            cursor: pointer;
        }

            .cancel_button:hover {
                background-color: #b71c1c;
                border: solid 5px #b71c1c;
            }

        .buttons {
            padding: 7px 15px 10px 15px;
            font-size: 16px;
            font-family: 'Lato', sans-serif;
            color: #e90029;
            border: solid 5px #e90029;
            text-decoration: none;
            background-color: transparent;
            cursor: pointer;
        }

            .buttons:hover {
                border-radius: 20px 20px;
            }

        .hvr-radial-out {
            display: inline-block;
            vertical-align: middle;
            -webkit-transform: translateZ(0);
            transform: translateZ(0);
            box-shadow: 0 0 1px rgba(0, 0, 0, 0);
            -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
            -moz-osx-font-smoothing: grayscale;
            position: relative;
            overflow: hidden;
            background: #fff;
            -webkit-transition-property: color;
            transition-property: color;
            -webkit-transition-duration: 0.3s;
            transition-duration: 0.3s;
        }

            .hvr-radial-out:before {
                content: "";
                position: absolute;
                z-index: -1;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: #fff;
                border-radius: 100%;
                -webkit-transform: scale(0);
                transform: scale(0);
                -webkit-transition-property: transform;
                transition-property: transform;
                -webkit-transition-duration: 0.3s;
                transition-duration: 0.3s;
                -webkit-transition-timing-function: ease-out;
                transition-timing-function: ease-out;
            }

            .hvr-radial-out:hover, .hvr-radial-out:focus, .hvr-radial-out:active {
                color: #fff;
                background: #e90029;
            }

                .hvr-radial-out:hover:before, .hvr-radial-out:focus:before, .hvr-radial-out:active:before {
                    -webkit-transform: scale(2);
                    transform: scale(2);
                }
        /*----------------------------------*/


        /*----------TextBox-------------*/
        .txtbox {
            padding: 10px;
            border: solid 5px #c9c9c9;
            transition: border 0.3s;
        }

            .txtbox:focus {
                border-radius: 20px 20px;
                border: solid 5px #808080;
            }

        /*-------------------------------------------*/

        .title_edit {
            color: #fff;
            background-color: #6BB9F0;
            font-size: 20px;
            padding: 5px;
            text-align: center;
            padding: 10px 10px 10px 10px;
        }

        table {
            border-collapse: separate;
            padding: 5px;
            text-align: center;
        }

        .cell_item {
            border-spacing: 20px 20px 20px 20px;
            text-align: left;
        }

        .cell_buttons {
            border-spacing: 20px 20px 20px 20px;
            text-align: center;
        }

        ._container {
            margin-left: 120px;
            margin-top: 15px;
        }
    </style>
    <div class="wrapper">
        <div class="mainbox" style="word-spacing: normal">
            <h2>PROFILE SETTINGS</h2>
            <fieldset>
                <div class="_container">
                    <asp:Table ID="profilesetting" runat="server">
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2" style="text-align: center">Current Name: <strong><asp:Label ID="currentname" runat="server"></asp:Label></strong></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2" style="text-align: center">
                                Current Email: <strong><asp:Label ID="currentemail" runat="server"></asp:Label></strong>
                                <br />
                                <br />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2" CssClass="title_edit" style="text-align:center">Edit Name</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2"></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell CssClass="cell_item">New Name </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="NewName" CssClass="txtbox" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Height="10px">
                            <asp:TableCell ColumnSpan="2">
                                <asp:Label ID="NewNameStatus" runat="server"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2" CssClass="cell_buttons">
                                <br />
                                <asp:Button ID="NewNameChange" runat="server" CssClass="buttons hvr-radial-out" Text="Change" OnClick="NewNameChange_Click" />&nbsp
                                <asp:Button ID="NewNameCancel" runat="server" CssClass="cancel_button" Text="Cancel" />
                                <br />
                                <br />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2" CssClass="title_edit" style="text-align:center">Edit Email</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2"></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell CssClass="cell_item">New Email</asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="NewEmail" CssClass="txtbox" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Height="10px">
                            <asp:TableCell ColumnSpan="2">
                                <asp:Label ID="NewEmailStatus" runat="server"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2" CssClass="cell_buttons">
                                <br />
                                <asp:Button ID="NewEmailChange" runat="server" CssClass="buttons hvr-radial-out" Text="Change" OnClick="NewEmailChange_Click" />&nbsp
                                <asp:Button ID="NewEmailCancel" runat="server" CssClass="cancel_button" Text="Cancel" />
                                <br />
                                <br />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2"></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2" CssClass="title_edit" style="text-align:center">Edit Password</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2"></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell CssClass="cell_item">Old Password </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="oldPw" CssClass="txtbox" runat="server" TextMode="Password"></asp:TextBox><br />
                                <asp:Label ID="oldPwStatus" runat="server"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell CssClass="cell_item">New Password </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="newPw" CssClass="txtbox" runat="server" TextMode="Password"></asp:TextBox><br />
                                <asp:Label ID="newPwStatus" runat="server"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell CssClass="cell_item">Repeat New Password </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="newPw2" CssClass="txtbox" runat="server" TextMode="Password"></asp:TextBox><br />
                                <asp:Label ID="newPw2Status" runat="server"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Height="10px">
                            <asp:TableCell ColumnSpan="2">
                                <asp:Label ID="ChangePwStatus" runat="server"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell CssClass="cell_buttons" ColumnSpan="2">
                                <br />
                                <asp:Button ID="NewPwChange" runat="server" CssClass="buttons hvr-radial-out" Text="Change" OnClick="NewPwChange_Click" />&nbsp
                                <asp:Button ID="NewPwCancel" runat="server" CssClass="cancel_button" Text="Cancel" />
                                <br />
                                <br />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>
            </fieldset>
        </div>
    </div>

</asp:Content>
