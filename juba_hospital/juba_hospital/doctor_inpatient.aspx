<%@ Page Title="" Language="C#" MasterPageFile="~/doctor.Master" AutoEventWireup="true" CodeBehind="doctor_inpatient.aspx.cs" Inherits="juba_hospital.doctor_inpatient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

             <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">Patient Details</h4>
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
                              <th>patient_status </th>
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
                             <th>patient_status </th>
                            
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
      $(document).ready(function () {
          $("#datatable").DataTable({});
      });

      $(document).ready(function () {






          var search = parseInt($("#label2").html());

          $.ajax({
              url: 'doctor_inpatient.aspx/patientwait',
              data: "{'search':'" + search + "'}",
              dataType: "json",
              type: 'POST',
              contentType: "application/json",
              success: function (response) {
                  console.log(response);

                  $("#datatable tbody").empty();

                  for (var i = 0; i < response.d.length; i++) {
                      $("#datatable tbody").append(
                          "<tr style='cursor:pointer' onclick='passValue(this)'>"
                          + "<td>" + response.d[i].full_name + "</td>"
                          + "<td>" + response.d[i].sex + "</td>"
                          + "<td>" + response.d[i].location + "</td>"
                          + "<td>" + response.d[i].phone + "</td>"
                          + "<td>" + response.d[i].amount + "</td>"

                          + "<td>" + response.d[i].dob + "</td>"
                          + "<td>" + response.d[i].date_registered + "</td>"
                          + "<td>" + response.d[i].doctortitle + "</td>"
                          + "<td>" + response.d[i].patient_status + "</td>"

                  
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
