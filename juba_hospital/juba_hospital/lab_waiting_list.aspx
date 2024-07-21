<%@ Page Title="" Language="C#" MasterPageFile="~/labtest.Master" AutoEventWireup="true" CodeBehind="lab_waiting_list.aspx.cs" Inherits="juba_hospital.lab_waiting_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="datatables/datatables.min.css" rel="stylesheet" />
<style>
    /* Custom table styling */
    .dataTables_wrapper .dataTables_filter {
        float: right;
        text-align: right;
    }

    .dataTables_wrapper .dataTables_length {
        float: left;
    }

    .dataTables_wrapper .dataTables_paginate {
        float: right;
        text-align: right;
    }

    .dataTables_wrapper .dataTables_info {
        float: left;
    }

    #datatable {
        width: 100%;
        margin: 20px 0;
      font-size: 19px;
    font-weight:bold;
    }

    #datatable th,
    #datatable td {
        text-align: center;
        vertical-align: middle;
    }

    #datatable th {
        background-color: #007bff;
        color: white;
        font-weight: bold;
    }

    #datatable td {
        background-color: #f8f9fa;
    }

    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
    }


    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #004085;
    }


    .btn-success {
        background-color: #28a745;
        border-color: #28a745;
    }


    .btn-success:hover {
        background-color: #218838;
        border-color: #1e7e34;
    }


    /* Custom hover styles for pagination buttons */
    .dataTables_wrapper .dataTables_paginate .paginate_button {
        padding: 0.5em 1em;
        margin-left: 0.5em;
        color: #007bff;
        background-color: white;
        border: 1px solid #ddd;
    }


    .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
        color: white;
        background-color: #007bff;
        border: 1px solid #007bff;
        cursor: pointer;
    }


    .dataTables_wrapper .dataTables_paginate .paginate_button.current {
        color: white;
        background-color: #007bff;
        border: 1px solid #007bff;
    }

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <%--<label id="label2">1</label>--%>
         <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">Lap Waiting List</h4>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="display nowrap" style="width:100%" 
                      id="datatable">
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

         <script src="assets/js/core/jquery-3.7.1.min.js"></script>

    <script src="datatables/datatables.min.js"></script>
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
            // Initialize DataTable with empty data
            var table = $('#datatable').DataTable({
                dom: 'Bfrtip',
                buttons: ['excelHtml5'],
                paging: true,
                pageLength: 10,
                lengthMenu: [10, 25, 50, 100],
                responsive: true
            });

            // Fetch and populate the table with data
            $.ajax({
                url: 'lab_waiting_list.aspx/pendlap',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);

                    // Clear the table body before appending new data
                    table.clear().draw();

                    // Function to determine button style based on status
                    function getStatusButton(status) {
                        var color;
                        switch (status) {
                            case 'waiting':
                                color = 'red';
                                break;
                            case 'pending-lap':
                                color = 'orange';
                                break;
                            case 'lap-processed':
                                color = 'green';
                                break;
                            case 'pending_scan':
                                color = 'orange';
                                break;
                            case 'scan_processed':
                                color = 'green';
                                break;
                            default:
                                color = 'initial';
                        }
                        return "<button style='background-color:" + color + "; cursor:default; color:white; border:none; padding:5px 10px; border-radius:30%;' disabled>" + status + "</button>";
                    }

                    // Append new rows to the table
                    for (var i = 0; i < response.d.length; i++) {
                        var statusButton = getStatusButton(response.d[i].status);
                        var xrayStatusButton = getStatusButton(response.d[i].xray_status);
                        table.row.add([
                
                            response.d[i].full_name,
                            response.d[i].sex,
                            response.d[i].location,
                            response.d[i].phone,
                            response.d[i].amount,
                            response.d[i].dob,
                            response.d[i].date_registered,
                            response.d[i].doctortitle,
                            statusButton,
                        ]).draw();
                    }
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        });


    </script>
</asp:Content>
