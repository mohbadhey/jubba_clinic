<%@ Page Title="" Language="C#" MasterPageFile="~/labtest.Master" AutoEventWireup="true" CodeBehind="lab_waiting_list.aspx.cs" Inherits="juba_hospital.lab_waiting_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
                <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/2.0.8/css/dataTables.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css">
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
        font-size: 14px;
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
        <label id="label2">1</label>
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
<script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.70/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.70/vfs_fonts.js"></script>

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

                    // Append new rows to the table
                    for (var i = 0; i < response.d.length; i++) {
                        table.row.add([
                
                            response.d[i].full_name,
                            response.d[i].sex,
                            response.d[i].location,
                            response.d[i].phone,
                            response.d[i].amount,
                            response.d[i].dob,
                            response.d[i].date_registered,
                            response.d[i].doctortitle,
                            "<button style='background-color:red; cursor:default; color:white; border:none; padding:5px 10px; border-radius:30%;' disabled>" + response.d[i].status + "</button>"
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
