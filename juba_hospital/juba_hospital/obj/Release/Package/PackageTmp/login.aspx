<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="juba_hospital.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
     
          <link
      rel="icon"
      href="assets/img/kaiadmin/j.ico"
      type="image/x-icon"
    />
        <style>
        .gradient-custom {
/* fallback for old browsers */
background: #6a11cb;

/* Chrome 10-25, Safari 5.1-6 */
background: -webkit-linear-gradient(to right, rgba(106, 17, 203, 1), rgba(37, 117, 252, 1));

/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
background: linear-gradient(to right, rgba(106, 17, 203, 1), rgba(37, 117, 252, 1))
}
    </style>
    <script src="assets/js/core/bootstrap.min.js"></script>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
                    <section class="vh-100 gradient-custom">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-white text-white" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">

            <div class="mb-md-5 mt-md-4 pb-5">


                <img src="assets/img/j.png" />
     

              <div data-mdb-input-init class="form-outline form-white mb-4">
                    <asp:TextBox ID="TextBoxUsername"  type="text"  class="form-control form-control-lg"  runat="server" autocomplete="off" ></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="TextBoxUsername" ErrorMessage="username is required." CssClass="text-danger" Display="Dynamic"  />
                <label class="form-label text-black" for="typeEmailX">Username</label>
              </div>

              <div data-mdb-input-init class="form-outline form-white mb-4">
             
                  <asp:TextBox ID="TextBoxPassword"  type="password"  class="form-control form-control-lg"  runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Password is required." CssClass="text-danger" Display="Dynamic" />
                <label class="form-label  text-black" for="typePasswordX">Password</label>
              </div>



                <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server"></asp:DropDownList>
                                       <br />
                <asp:Label ID="LabelMessage" CssClass=" text-danger" runat="server" Text=""></asp:Label> <br />
                <asp:Label ID="Label1" CssClass=" text-danger" runat="server" Text=""></asp:Label><br />
                <asp:Button ID="lognbtn" class="btn btn-outline-dark btn-lg px-5  text-black" type="submit" runat="server" Text="Login" OnClick="lognbtn_Click"  />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" />
              <div class="d-flex justify-content-center text-center mt-4 pt-1">
                <a href="#!" class="text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
                <a href="#!" class="text-white"><i class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
                <a href="#!" class="text-white"><i class="fab fa-google fa-lg"></i></a>
              </div>

            </div>

         

          </div>
        </div>
      </div>
    </div>
  </div>
</section>
        </div>
    </form>
</body>
</html>
