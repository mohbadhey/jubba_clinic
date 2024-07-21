<%@ Page Title="" Language="C#" MasterPageFile="~/register.Master" AutoEventWireup="true" CodeBehind="patient_amount.aspx.cs" Inherits="juba_hospital.patient_amount" %>
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
    <!-- Modal -->
<div class="modal fade" id="editmodal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Add Amount  </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
<div class="modal-body">
    <input style="display:none" id="patientid" />


    <div class="mb-3">
        <label for="name" class="form-label">Full Name</label>
        <input type="text" disabled class="form-control" id="name" placeholder="Enter Name">
        <small id="nameError" class="text-danger"></small>
    </div>



    <div class="mb-3">
        <label for="amount" class="form-label">Amount</label>
        <input type="number" class="form-control" id="amount" placeholder="Enter Amount">
        <small id="amountError" class="text-danger"></small>
    </div>





    
</div>



      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" onclick="updateinfo()" class="btn btn-primary">Update</button>
      </div>
    </div>
  </div>
</div>

       <div class="row">
              <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <h4 class="card-title">Patient Payment List list</h4>
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
                           <th>Lap  Status</th>
                              <th>Image Status</th>
                                  <th>Patient Status</th>
                                   <th>operation</th>
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
                              <th>Image Status</th>
                                       <th>Patient Status</th>
                                       <th>operation</th>
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
    $(document).ready(function () {
        // Initialize DataTable
        var table = $('#datatable').DataTable({
            dom: 'Bfrtip',
            buttons: ['excelHtml5'],
            paging: true,
            pageLength: 10,
            lengthMenu: [10, 25, 50, 100],
            responsive: true
        });

        // Function to fetch and display data
        function fetchData() {
            $.ajax({
                url: 'patient_amount.aspx/medic',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);

                    // Clear existing tbody content
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
                            case 'lap_processed':
                                color = 'green';
                                break;
                            case 'pending_image':
                                color = 'orange';
                                break;
                            case 'image_processed':
                                color = 'green';
                                break;
                            default:
                                color = 'initial';
                        }
                        return "<button style='background-color:" + color + "; cursor:default; color:white; border:none; padding:5px 10px; border-radius:30%;' disabled>" + status + "</button>";
                    }

                    // Populate table rows
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
                            statusButton,
                            xrayStatusButton,
                            response.d[i].patient_status,
                            "<button type='button' class='edit-btn btn btn-link btn-primary btn-lg' data-id='" + response.d[i].patientid + "' data-bs-toggle='tooltip' title='Edit patient'><i class='fa fa-edit'></i></button>"
                        ]).draw(false);
                    }
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });



        }


        // Call fetchData initially
        fetchData();
    });


    // Delegate click events for edit and delete buttons to the table
    $("#datatable").on("click", ".edit-btn", function (event) {
        event.preventDefault(); // Prevent default behavior
        var row = $(this).closest("tr");
        var patientid = $(this).data("id");

        var name = row.find("td:nth-child(1)").text();
    
        var amount = row.find("td:nth-child(5)").text();
        $("#name").val(name);

        $("#patientid").val(patientid);

        $("#amount").val(amount);


        // Show the modal
        $('#editmodal').modal('show');
    });


    function updateinfo() {
        // Clear previous error messages
 
        document.getElementById('amountError').textContent = "";



        // Get the form values
        var id = $("#patientid").val();
     
        var amount = $("#amount").val();
 

        // Validate the form values
        let isValid = true;

      

       


        if (amount.trim() === "" || isNaN(amount)) {
            document.getElementById('amountError').textContent = "Please enter a valid amount.";
            isValid = false;
        }

        

        // If all validations pass, proceed with AJAX call
        if (isValid) {
            $.ajax({
                url: 'patient_amount.aspx/updatepatient',
                data: JSON.stringify({
                    id: id,
                amount: amount
                }),
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#editmodal").modal("hide");
                    Swal.fire(
                        'Successfully Updated !',
                        'You updated a new Patient!',
                        'success'
                    )
                    fetchData();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }
    }

</script>
</asp:Content>
