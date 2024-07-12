<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="patient_status.aspx.cs" Inherits="juba_hospital.patient_status" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

             <div class="row">

                 <div class="col-3">
                                                   <select class="form-control" id="patient">
    <option value="0"> Please Select a Week</option>
     
                    <option value="0"> out patient</option>
                    <option value="1"> in patient</option>
                  
                   
</select>
         <br />
                 </div>
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
          // When the first dropdown changes
          $('#patient').change(function () {
              var search = $(this).val();
           



              $.ajax({
                  url: 'patient_status.aspx/inoutpatient',
                  data: "{  'search':'" + search + "'  }",
                  dataType: "json",
                  type: 'POST',
                  contentType: "application/json",
                  success: function (response) {
                      console.log(response);

                      $("#datatable tbody").empty();

                      for (var i = 0; i < response.d.length; i++) {
                          $("#datatable tbody").append(
                              "<tr>"

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


                      // Show the delete button
                      $('#delete').show();

                  },
                  error: function (response) {
                      alert(response.responseText);
                  }
              });



          });
      });









      $(document).ready(function () {
          $("#datatable").DataTable({});
      });

      datadisplay();
      function datadisplay() {
          $.ajax({
              url: 'patient_in.aspx/datadisplay',
              dataType: "json",
              type: 'POST',
              contentType: "application/json",
              success: function (response) {
                  console.log(response)

                  /*         swal("Good job!", "You clicked the button!", "success");*/
                  $("#datatable tbody").empty();

                  for (var i = 0; i < response.d.length; i++) {
                      $("#datatable tbody").append(
                          "<tr>"
                          + "<td>" + response.d[i].full_name + "</td>"
                          + "<td>" + response.d[i].sex + "</td>"
                          + "<td>" + response.d[i].location + "</td>"
                          + "<td>" + response.d[i].phone + "</td>"
                          + "<td>" + response.d[i].amount + "</td>"

                          + "<td>" + response.d[i].dob + "</td>"
                          + "<td>" + response.d[i].date_registered + "</td>"
                          + "<td>" + response.d[i].doctortitle + "</td>"
                          + "<td>" + response.d[i].patient_status + "</td>"

                          








                          + "</tr>")
                  }
              },
              error: function (response) {
                  alert(response.responseText);
              }
          });
      }



  </script>
</asp:Content>
