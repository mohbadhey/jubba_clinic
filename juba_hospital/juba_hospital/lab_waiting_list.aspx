<%@ Page Title="" Language="C#" MasterPageFile="~/labtest.Master" AutoEventWireup="true" CodeBehind="lab_waiting_list.aspx.cs" Inherits="juba_hospital.lab_waiting_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <label id="label2">1</label>
         <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">Lap Waiting List</h4>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table
                      id="datatable"
                      class="display table table-striped table-hover"
                    >
                      <thead>
                        <tr>
                          <th>Name</th>
                          <th>Sex</th>
                          <th>Location</th>
                          <th>Phone</th>
                              <th>Amount</th>
<th>D.O.B</th>
                          <th>Date Registered</th>
                                  <th>Doctor Title</th>
                          <th>Status</th>
                        </tr>
                      </thead>
                      <tfoot>
                        <tr>
                          <th>Name</th>
 <th>Sex</th>
 <th>Location</th>
 <th>Phone</th>
                              <th>Amount</th>
                              <th>D.O.B</th>
 <th>Date Registered</th>
                             <th>Doctor Title</th>
 <th>Status</th>
                        </tr>
                      </tfoot>
             <tbody></tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>

      
          </div>

          <script src="assets/js/plugin/datatables/datatables.min.js"></script>
<script src="Scripts/jquery-3.4.1.min.js"></script>

    <script>
        // Delegate click events for edit and delete buttons to the table
        $("#datatable").on("click", ".edit-btn", function (event) {
            event.preventDefault(); // Prevent default behavior
            var row = $(this).closest("tr");
            var prescid = $(this).data("id");





            $("#id11").val(prescid);



            // Show the modal
            $('#staticBackdrop').modal('show');
        });



        $(document).ready(function () {







            $.ajax({
                url: 'lab_waiting_list.aspx/pendlap',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);

                    $("#datatable tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        $("#datatable tbody").append(
                            "<tr style='cursor:pointer' onclick='passValue(this)'>"
                            + "<td style='display:none'>" + response.d[i].doctorid + "</td>"
                            + "<td>" + response.d[i].full_name + "</td>"
                            + "<td>" + response.d[i].sex + "</td>"
                            + "<td>" + response.d[i].location + "</td>"
                            + "<td>" + response.d[i].phone + "</td>"
                            + "<td>" + response.d[i].amount + "</td>"
                            + "<td>" + response.d[i].dob + "</td>"
                            + "<td>" + response.d[i].date_registered + "</td>"
                            + "<td>" + response.d[i].doctortitle + "</td>"
                            + "<td><button style='background-color:red; curser:off;   color:white; border:none; padding:5px 10px;  border-radius:30%;' disabled>" + response.d[i].status + "</button></td>"
                            + "</tr>"
                        );
                    }




                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        });



    </script>
</asp:Content>
