<%@ Page Title="" Language="C#" MasterPageFile="~/doctor.Master" AutoEventWireup="true" CodeBehind="waitingpatients.aspx.cs" Inherits="juba_hospital.waitingpatients" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



       <div class="row">
              <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <h4 class="card-title">Patient waiting list</h4>
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
                           <th>Lap  Status</th>
                              <th>X-ray Status</th>
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
                           <th>Lap  Status</th>
                              <th>X-ray Status</th>
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
            url: 'assignmed.aspx/medic',
            data: JSON.stringify({ 'search': search }),
            dataType: "json",
            type: 'POST',
            contentType: "application/json",
            success: function (response) {
                console.log(response);

                $("#datatable tbody").empty();



                for (var i = 0; i < response.d.length; i++) {


                    $("#datatable tbody").append(
                        "<tr style='cursor:pointer' onclick='passValue(this)'>" +
                        "<td style='display:none'>" + response.d[i].doctorid + "</td>" +
                        "<td>" + response.d[i].full_name + "</td>" +
                        "<td>" + response.d[i].sex + "</td>" +
                        "<td>" + response.d[i].location + "</td>" +
                        "<td>" + response.d[i].phone + "</td>" +
                        "<td>" + response.d[i].amount + "</td>" +
                        "<td>" + response.d[i].dob + "</td>" +
                        "<td>" + response.d[i].date_registered + "</td>" +
                        "<td style='display:none'>" + response.d[i].doctortitle + "</td>" +
                        "<td style='display:none'>" + response.d[i].prescid + "</td>" +
                        "<td style='display:none'>" + response.d[i].patientid + "</td>" +
                        "<td>" + response.d[i].status + "</td>" +
                        "<td>" + response.d[i].xray_status + "</td>" +
                        "<td style='display:none'>" + response.d[i].xrayid + "</td>" +


                 
                        "</tr>"
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
