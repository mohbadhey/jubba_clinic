<%@ Page Title="" Language="C#" MasterPageFile="~/register.Master" AutoEventWireup="true" CodeBehind="Patient_Operation.aspx.cs" Inherits="juba_hospital.Patient_Operation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
<!-- Modal -->
<div class="modal fade" id="deletemodel" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel1">Delet Patients </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
   
          <input style="display:none" id="id11" />
                    <input style="display:none" id="pid1" />

          
     <div class="mb-3">
  <label for="formGroupExampleInput" class="form-label">Full Name</label>
  <input type="text" readonly class="form-control" id="name1" placeholder="Enter Name">
</div>
<div class="mb-3">
  <label for="formGroupExampleInput2" class="form-label">Sex</label>
   <select  class="form-control" required id="sex1" >
       <option value="0"> Please select sex</option>
            <option value="male"> male</option>
            <option value="female"> female</option>
   </select>
</div>
      
          
          <div class="mb-3">
  <label for="formGroupExampleInput" class="form-label">Location</label>
  <input type="text" readonly class="form-control" id="location1" placeholder="Enter Location">
</div>
          <div class="mb-3">
  <label for="formGroupExampleInput" class="form-label">Amount</label>
  <input type="number" readonly class="form-control" id="amount1" placeholder="Enter Amount">
</div>
                    <div class="mb-3">
  <label for="formGroupExampleInput" class="form-label">D.O.B</label>
  <input type="date" readonly class="form-control" id="dob1" placeholder="Enter Amount">
</div>
          <div class="mb-3">
  <label for="formGroupExampleInput" class="form-label">Phone Number</label>
  <input type="number" readonly  class="form-control" id="phone1" placeholder="Enter Phone Number">
</div>
       <div class="mb-3">
  <label for="formGroupExampleInput2" class="form-label">Doctor Title</label>
   <select  class="form-control"  aria-readonly="true" id="doctor1" >

   </select>
</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" onclick="deletepatient()" class="btn btn-danger">Delete</button>
      </div>
    </div>
  </div>
</div>
    
<!-- Modal -->
<div class="modal fade" id="editmodal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Update Patients </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
<div class="modal-body">
    <input style="display:none" id="id1" />
    <input style="display:none" id="pid" />

    <div class="mb-3">
        <label for="name" class="form-label">Full Name</label>
        <input type="text" class="form-control" id="name" placeholder="Enter Name">
        <small id="nameError" class="text-danger"></small>
    </div>

    <div class="mb-3">
        <label for="sex" class="form-label">Sex</label>
        <select class="form-control" id="sex">
            <option value="0">Please select sex</option>
            <option value="male">Male</option>
            <option value="female">Female</option>
        </select>
        <small id="sexError" class="text-danger"></small>
    </div>

    <div class="mb-3">
        <label for="location" class="form-label">Location</label>
        <input type="text" class="form-control" id="location" placeholder="Enter Location">
        <small id="locationError" class="text-danger"></small>
    </div>

    <div class="mb-3">
        <label for="amount" class="form-label">Amount</label>
        <input type="number" class="form-control" id="amount" placeholder="Enter Amount">
        <small id="amountError" class="text-danger"></small>
    </div>

    <div class="mb-3">
        <label for="dob" class="form-label">Date of Birth</label>
        <input type="date" class="form-control" id="dob">
        <small id="dobError" class="text-danger"></small>
    </div>

    <div class="mb-3">
        <label for="phone" class="form-label">Phone Number</label>
        <input type="number" class="form-control" id="phone" placeholder="Enter Phone Number">
        <small id="phoneError" class="text-danger"></small>
    </div>

    <div class="mb-3">
        <label for="doctor" class="form-label">Doctor Title</label>
        <select class="form-control" id="doctor">
            <!-- Options populated dynamically from database -->
        </select>
   
    </div>
</div>



      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" onclick="updateinfo()" class="btn btn-primary">Update</button>
      </div>
    </div>
  </div>
</div>
     <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <div class="d-flex align-items-center">
                      <h4 class="card-title">Patient Operation</h4>
                   
                    </div>
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
                                   <th>Actions</th>
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
                               <th>Actions</th>
                          </tr>
                        </tfoot>
            <tbody>

            </tbody>
                      </table>
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
        function deletepatient() {
            var pid = $("#pid1").val();
            var id = $("#id11").val();
          
            $.ajax({
                type: "POST",
                url: "Patient_Operation.aspx/deletepatient",
                data: JSON.stringify({ id: id, pid: pid }), // Corrected here
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $("#deletemodel").modal("hide");
                    if (response.d === 'true') {
                        Swal.fire(
                            'Successfully deleted!',
                            'The patient has been deleted.',
                            'success'
                        );

                        datadisplay();
                        clearInputFields(); // Clear input fields
                    } else {
                        // Handle errors in the response
                        Swal.fire({
                            icon: 'error',
                            title: 'Deletion Failed',
                            text: 'There was an error while deleting the patient.',
                        });
                    }
                },
                error: function (xhr, status, error) {
                    alert("Error: " + xhr.responseText);
                }
            });
        }

        function updateinfo() {
            // Clear previous error messages
            document.getElementById('nameError').textContent = "";
            document.getElementById('sexError').textContent = "";
            document.getElementById('phoneError').textContent = "";
            document.getElementById('locationError').textContent = "";
            document.getElementById('amountError').textContent = "";
            document.getElementById('dobError').textContent = "";
  

            // Get the form values
            var id = $("#pid").val();
            var did = $("#id1").val();
            var name = $("#name").val();
            var sex = $("#sex").val();
            var phone = $("#phone").val();
            var location = $("#location").val();
            var amount = $("#amount").val();
            var doctor = $("#doctor").val();
            var dob = $("#dob").val();

            // Validate the form values
            let isValid = true;

            if (name.trim() === "") {
                document.getElementById('nameError').textContent = "Please enter the patient name.";
                isValid = false;
            }

            if (sex === "0") {
                document.getElementById('sexError').textContent = "Please select a sex.";
                isValid = false;
            }

            if (phone.trim() === "" || isNaN(phone)) {
                document.getElementById('phoneError').textContent = "Please enter a valid phone number.";
                isValid = false;
            }

            if (location.trim() === "") {
                document.getElementById('locationError').textContent = "Please enter a location.";
                isValid = false;
            }

            if (amount.trim() === "" || isNaN(amount)) {
                document.getElementById('amountError').textContent = "Please enter a valid amount.";
                isValid = false;
            }

            if (dob.trim() === "") {
                document.getElementById('dobError').textContent = "Please select a date of birth.";
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
                    url: 'Patient_Operation.aspx/updatepatient',
                    data: JSON.stringify({
                        id: id,
                        name: name,
                        sex: sex,
                        phone: phone,
                        location: location,
                        doctor: doctor,
                        dob: dob,
                        did: did,
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
                        datadisplay();
                    },
                    error: function (response) {
                        alert(response.responseText);
                    }
                });
            }
        }


        // Delegate click events for edit and delete buttons to the table
        $("#datatable").on("click", ".delete-btn", function (event) {
            event.preventDefault(); // Prevent default behavior
            var row = $(this).closest("tr");
            var doctorid = $(this).data("id");
            document.getElementById("id1").value = doctorid;
            var name = row.find("td:nth-child(2)").text();
            var sex = row.find("td:nth-child(3)").text();
            var location = row.find("td:nth-child(4)").text();
            var phone = row.find("td:nth-child(5)").text();
            var amount = row.find("td:nth-child(6)").text();
            var dob = row.find("td:nth-child(7)").text();
            var patientid = row.find("td:nth-child(10)").text();
            
            var prescid = row.find("td:nth-child(11)").text();
            $("#name1").val(name);
            $("#sex1").val(sex);
            $("#location1").val(location);
            $("#phone1").val(phone);
            $("#amount1").val(amount);
            $("#dob1").val(dob);
            $("#pid1").val(patientid);
            $("#id11").val(prescid);
            

            $.ajax({
                type: "POST",
                url: "Patient_Operation.aspx/getdoctors",
                data: JSON.stringify({ doctorid: doctorid }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log(response);

                    var doctorSelect = $("[id*=doctor]"); // Assuming you have a select element for doctors

                    doctorSelect.empty(); // Clear existing options for doctors

                    // Populate the doctor select element with all doctors
                    $.each(response.d.doctorList, function () {
                        doctorSelect.append($("<option></option>").val(this.Value).html(this.Text));
                    });

                    // Set the selected doctor
                    if (response.d.selectedDoctorId) {
                        doctorSelect.val(response.d.selectedDoctorId);
                    }
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });

            // Show the modal
            $('#deletemodel').modal('show');
        });


        // Delegate click events for edit and delete buttons to the table
        $("#datatable").on("click", ".edit-btn", function (event) {
            event.preventDefault(); // Prevent default behavior
            var row = $(this).closest("tr");
            var doctorid = $(this).data("id");
            document.getElementById("id1").value = doctorid;
            var name = row.find("td:nth-child(2)").text(); 
            var sex = row.find("td:nth-child(3)").text(); 
            var location = row.find("td:nth-child(4)").text();
            var phone = row.find("td:nth-child(5)").text();
            var amount = row.find("td:nth-child(6)").text();
            var dob = row.find("td:nth-child(7)").text();
            var patientid = row.find("td:nth-child(10)").text();
            $("#name").val(name);
            $("#sex").val(sex);
            $("#location").val(location);
            $("#phone").val(phone);
            $("#amount").val(amount);
            $("#dob").val(dob);
            $("#pid").val(patientid);
       
            $.ajax({
                type: "POST",
                url: "Patient_Operation.aspx/getdoctors",
                data: JSON.stringify({ doctorid: doctorid }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log(response);

                    var doctorSelect = $("[id*=doctor]"); // Assuming you have a select element for doctors

                    doctorSelect.empty(); // Clear existing options for doctors

                    // Populate the doctor select element with all doctors
                    $.each(response.d.doctorList, function () {
                        doctorSelect.append($("<option></option>").val(this.Value).html(this.Text));
                    });

                    // Set the selected doctor
                    if (response.d.selectedDoctorId) {
                        doctorSelect.val(response.d.selectedDoctorId);
                    }
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });

            // Show the modal
            $('#editmodal').modal('show');
        });
    

        datadisplay();
        function datadisplay() {
            $.ajax({
                url: 'Patient_details.aspx/datadisplay',
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
                            + "<td style='display:none'>" + response.d[i].doctorid + "</td>"
                            + "<td>" + response.d[i].full_name + "</td>"
                            + "<td>" + response.d[i].sex + "</td>"
                            + "<td>" + response.d[i].location + "</td>"
                            + "<td>" + response.d[i].phone + "</td>"
                            + "<td>" + response.d[i].amount + "</td>"
                            + "<td>" + response.d[i].dob + "</td>"
                            + "<td>" + response.d[i].date_registered + "</td>"
                            + "<td>" + response.d[i].doctortitle + "</td>"
                            + "<td style='display:none'>" + response.d[i].patientid + "</td>"
                            + "<td style='display:none'>" + response.d[i].prescid + "</td>"
                            + "<td>"
                            + "<button type='button' class='edit-btn btn btn-link btn-primary btn-lg' data-id='" + response.d[i].doctorid + "' data-bs-toggle='tooltip' title='Edit patient'><i class='fa fa-edit'></i></button>"
                 /*           + "<button type='button' class='delete-btn btn btn-link btn-danger btn-lg' data-id='" + response.d[i].doctorid + "' data-bs-toggle='tooltip' title='Delete Task'><i class='fa fa-times'></i></button>"*/
                            + "</td>"
                            + "</tr>"
                        );
                    }
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }

    </script>
</asp:Content>
