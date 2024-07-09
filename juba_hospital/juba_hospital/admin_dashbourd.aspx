<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="admin_dashbourd.aspx.cs" Inherits="juba_hospital.admin_dashbourd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                <div class="row">
              <div class="col-sm-6 col-md-3">
                <div class="card card-stats card-round">
                  <div class="card-body">
                    <div class="row align-items-center">
                      <div class="col-icon">
                        <div
                          class="icon-big text-center icon-primary bubble-shadow-small"
                        >
                          <i class="fas fa-users"></i>
                        </div>
                      </div>
                      <div class="col col-stats ms-3 ms-sm-0">
                        <div class="numbers">
                          <p class="card-category">Doctors</p>
                          <h4 class="card-title"><span id="td"></span></h4>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-md-3">
                <div class="card card-stats card-round">
                  <div class="card-body">
                    <div class="row align-items-center">
                      <div class="col-icon">
                        <div
                          class="icon-big text-center icon-info bubble-shadow-small"
                        >
                          <i class="fas fa-user-check"></i>
                        </div>
                      </div>
                      <div class="col col-stats ms-3 ms-sm-0">
                        <div class="numbers">
                          <p class="card-category">In Patients </p>
                          <h4 class="card-title"><span id="ip"></span></h4>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-md-3">
                <div class="card card-stats card-round">
                  <div class="card-body">
                    <div class="row align-items-center">
                      <div class="col-icon">
                        <div
                          class="icon-big text-center icon-success bubble-shadow-small"
                        >
                          <i class="fas fa-luggage-cart"></i>
                        </div>
                      </div>
                      <div class="col col-stats ms-3 ms-sm-0">
                        <div class="numbers">
                          <p class="card-category">Out Patients</p>
                          <h4 class="card-title"><span id="op"></span></h4>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-md-3">
                <div class="card card-stats card-round">
                  <div class="card-body">
                    <div class="row align-items-center">
                      <div class="col-icon">
                        <div
                          class="icon-big text-center icon-secondary bubble-shadow-small"
                        >
                          <i class="far fa-check-circle"></i>
                        </div>
                      </div>
                      <div class="col col-stats ms-3 ms-sm-0">
                        <div class="numbers">
                          <p class="card-category">Amount</p>
                          <h4 class="card-title"><span id="am"></span></h4>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>


          <script src="assets/js/plugin/datatables/datatables.min.js"></script>
<script src="Scripts/jquery-3.4.1.min.js"></script>
    <script>
        $(document).ready(function () {
            // When the first dropdown changes



            $.ajax({
                type: "POST",
                url: "admin_dashbourd.aspx/amount",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    console.log(r);
                    var earnings = r.d; // Assuming it's an array
                    var total = earnings[0].amount; // Accessing the total property of the first element

                    $("#am").text(total); // Update the text content of the label with the total value

                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });

        });
        $(document).ready(function () {
            // When the first dropdown changes



            $.ajax({
                type: "POST",
                url: "admin_dashbourd.aspx/op_patients",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    console.log(r);
                    var earnings = r.d; // Assuming it's an array
                    var total = earnings[0].op_patients; // Accessing the total property of the first element

                    $("#op").text(total); // Update the text content of the label with the total value

                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });

        });
        $(document).ready(function () {
            // When the first dropdown changes



            $.ajax({
                type: "POST",
                url: "admin_dashbourd.aspx/inpatient",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    console.log(r);
                    var earnings = r.d; // Assuming it's an array
                    var total = earnings[0].in_patients; // Accessing the total property of the first element

                    $("#ip").text(total); // Update the text content of the label with the total value

                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });

        });

        $(document).ready(function () {
            // When the first dropdown changes



            $.ajax({
                type: "POST",
                url: "admin_dashbourd.aspx/doctors",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    console.log(r);
                    var earnings = r.d; // Assuming it's an array
                    var total = earnings[0].inpatient; // Accessing the total property of the first element

                    $("#td").text(total); // Update the text content of the label with the total value

                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });

        });
    </script>
</asp:Content>
