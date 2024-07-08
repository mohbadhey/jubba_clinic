<%@ Page Title="" Language="C#" MasterPageFile="~/doctor.Master" AutoEventWireup="true" CodeBehind="lap_processed.aspx.cs" Inherits="juba_hospital.lap_processed" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-fullscreen">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <input style="display:none" id="id11" />
                <h1>Assign Medication</h1>
          <div class="row justify-content-between">
              <div class="col-4">
                     <div class="mb-3">
       <label for="name" class="form-label">Medication Name</label>
       <input type="text" class="form-control" id="name" placeholder="Enter Name">
       <small id="nameError" class="text-danger"></small>
   </div>

   <div class="mb-3">
       <label for="dosage" class="form-label">Dosage</label>
       <input type="text" class="form-control" id="dosage" placeholder="Enter Dosage">
       <small id="dosageError" class="text-danger"></small>
   </div>

   <div class="mb-3">
       <label for="frequency" class="form-label">Frequency</label>
       <input type="text" class="form-control" id="frequency" placeholder="Enter Frequency">
       <small id="frequencyError" class="text-danger"></small>
   </div>

   <div class="mb-3">
       <label for="duration" class="form-label">Duration</label>
       <input type="text" class="form-control" id="duration" placeholder="Enter Duration">
       <small id="durationError" class="text-danger"></small>
   </div>

   <div class="mb-3">
       <label for="inst" class="form-label">Special Instruction</label>
       <textarea class="form-control" id="inst" rows="3"></textarea>
       <small id="instError" class="text-danger"></small>
   </div>
              </div>
              
              <div class="col-4">
        <h1>Lab Test Results</h1>
        <img src="assets/img/lab.png" alt="Lab Test Results"/>
    </div>
    <div class="col-4">
        <h1>X-ray Results</h1>
        <img src="assets/img/lab.png" alt="X-ray Results"/>
    </div>
          </div>

 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
</div>
        

    <!-- Modal -->
<div class="modal fade" id="medmodal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel1">Add Medication </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
<div class="modal-body">
<%--    <input style="display:none" id="id11" />

    <div class="mb-3">
        <label for="name" class="form-label">Medication Name</label>
        <input type="text" class="form-control" id="name" placeholder="Enter Name">
        <small id="nameError" class="text-danger"></small>
    </div>

    <div class="mb-3">
        <label for="dosage" class="form-label">Dosage</label>
        <input type="text" class="form-control" id="dosage" placeholder="Enter Dosage">
        <small id="dosageError" class="text-danger"></small>
    </div>

    <div class="mb-3">
        <label for="frequency" class="form-label">Frequency</label>
        <input type="text" class="form-control" id="frequency" placeholder="Enter Frequency">
        <small id="frequencyError" class="text-danger"></small>
    </div>

    <div class="mb-3">
        <label for="duration" class="form-label">Duration</label>
        <input type="text" class="form-control" id="duration" placeholder="Enter Duration">
        <small id="durationError" class="text-danger"></small>
    </div>

    <div class="mb-3">
        <label for="inst" class="form-label">Special Instruction</label>
        <textarea class="form-control" id="inst" rows="3"></textarea>
        <small id="instError" class="text-danger"></small>
    </div>--%>
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
                    <h4 class="card-title">Patient Lap Results</h4>
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

  





















    function submitInfo() {
        // Clear previous error messages
        document.getElementById('nameError').textContent = "";
        document.getElementById('dosageError').textContent = "";
        document.getElementById('frequencyError').textContent = "";
        document.getElementById('durationError').textContent = "";
        document.getElementById('instError').textContent = "";

        // Get the form values
        var id = $("#id11").val();
        var name = $("#name").val();
        var dosage = $("#dosage").val();
        var frequency = $("#frequency").val();
        var duration = $("#duration").val();
        var inst = $("#inst").val();

        // Validate the form values
        let isValid = true;

        if (name.trim() === "") {
            document.getElementById('nameError').textContent = "Please enter the medication name.";
            isValid = false;
        }

        if (dosage.trim() === "") {
            document.getElementById('dosageError').textContent = "Please enter the dosage.";
            isValid = false;
        }

        if (frequency.trim() === "") {
            document.getElementById('frequencyError').textContent = "Please enter the frequency.";
            isValid = false;
        }

        if (duration.trim() === "") {
            document.getElementById('durationError').textContent = "Please enter the duration.";
            isValid = false;
        }

        if (inst.trim() === "") {
            document.getElementById('instError').textContent = "Please enter the special instruction.";
            isValid = false;
        }
        if (doctor === "0") {
            isValid = false;
            Swal.fire({
                icon: 'error',
                title: 'Doctor Not Selected',
                text: 'Please select a doctor.',
            });
            return; // Exit the function to prevent the AJAX request
        }


        // If all validations pass, proceed with AJAX call
        if (isValid) {

            $.ajax({
                url: 'Add_patients.aspx/submitdata',
                data: "{ 'name':'" + name + "', 'dosage':'" + dosage + "', 'frequency':'" + frequency + "', 'duration':'" + duration + "' }",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                type: 'POST',
                success: function (response) {
                    if (response.d === 'true') {
                        Swal.fire(
                            'Successfully Saved!',
                            'You added a new Patient!',
                            'success'
                        );

                        clearInputFields(); // Clear input fields
                    } else {
                        // Handle errors in the response
                        Swal.fire({
                            icon: 'error',
                            title: 'Data Insertion Failed',
                            text: 'There was an error while inserting the data.',
                        });
                    }
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
      
        }

        function clearInputFields() {
            // Replace these lines with code to clear the input fields
            $("#name").val('');
            $("#location").val('');
            $("#number").val('');
            $("#date").val('');
            $("#gender").val('0');
            $("#doctor").val('0');
            $("#amount").val('');
        }
    }

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
   
     


          

        var search = parseInt($("#label2").html());
  
            $.ajax({
                url: 'lap_processed.aspx/lapprocessed',
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
                            + "<td style='display:none'>" + response.d[i].doctorid + "</td>"
                            + "<td>" + response.d[i].full_name + "</td>"
                            + "<td>" + response.d[i].sex + "</td>"
                            + "<td>" + response.d[i].location + "</td>"
                            + "<td>" + response.d[i].phone + "</td>"
                            + "<td>" + response.d[i].amount + "</td>"
                            + "<td>" + response.d[i].dob + "</td>"
                            + "<td>" + response.d[i].date_registered + "</td>"
                            + "<td style='display:none'>" + response.d[i].prescid + "</td>"
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
