<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="add_doctor.aspx.cs" Inherits="juba_hospital.add_doctor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <!-- Modal -->
<div class="modal fade" id="medmodal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel1">Register Doctor </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
<div class="modal-body">
    <input style="display:none" id="id11" />

    <div class="mb-3">
        <label for="name" class="form-label">Doctor FullName</label>
        <input type="text" class="form-control" id="name" placeholder="Enter Name">
        <small id="nameError" class="text-danger"></small>
    </div>

    <div class="mb-3">
        <label for="dosage" class="form-label">Doctor Ttile</label>
        <input type="text" class="form-control" id="title" placeholder="Enter Title">
        <small id="dosageError" class="text-danger"></small>
    </div>

    <div class="mb-3">
        <label for="frequency" class="form-label">Phone Number</label>
        <input type="text" class="form-control" id="phone" placeholder="Enter Number">
        <small id="frequencyError" class="text-danger"></small>
    </div>

    <div class="mb-3">
        <label for="duration" class="form-label">Username</label>
        <input type="text" class="form-control" id="username" placeholder="Enter username">
        <small id="durationError" class="text-danger"></small>
    </div>

    <div class="mb-3">
        <label for="inst" class="form-label">Password</label>
         <input type="text" class="form-control" id="pass" placeholder="Enter password">
        <small id="instError" class="text-danger"></small>
    </div>
</div>





      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" onclick="submitInfo()" class="btn btn-primary">submit</button>
      </div>
    </div>
  </div>
</div>
       <div class="row">
              <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <h4 class="card-title">Add Doctor</h4>
                      
    <div class="row">
        <div class="col-9"></div>
        <div class="col-3">
            <!-- Button trigger modal -->
<button type="button" id="add" class="btn btn-primary">
 Add
</button>
        </div>
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
                            <th>Title</th>
                            <th>Number</th>
                            <th>Username</th>
                                <th>Password</th>

                          </tr>
                        </thead>
                        <tfoot>
                          <tr>
                        <th>Name</th>
    <th>Title</th>
    <th>Number</th>
    <th>Username</th>
        <th>Password</th>
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

        datadisplay();
        function datadisplay() {
            $.ajax({
                url: 'add_doctor.aspx/datadisplay',
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
                            + "<td>" + response.d[i].doctortitle + "</td>"
                            + "<td>" + response.d[i].doctornumber + "</td>"
                            + "<td>" + response.d[i].username + "</td>"
                            + "<td>" + response.d[i].password + "</td>"

    

       







                            + "</tr>")
                    }
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }



        function submitInfo() {
            // Clear previous error messages
            document.getElementById('nameError').textContent = "";
            document.getElementById('dosageError').textContent = "";
            document.getElementById('frequencyError').textContent = "";
            document.getElementById('durationError').textContent = "";
            document.getElementById('instError').textContent = "";

            // Get the form values
            var prescid = $("#id11").val();
            var name = $("#name").val();
            var title = $("#title").val();
            var phone = $("#phone").val();
            var username = $("#username").val();
            var pass = $("#pass").val();

            // Validate the form values
            let isValid = true;

            if (name.trim() === "") {
                document.getElementById('nameError').textContent = "Please enter the medication name.";
                isValid = false;
            }

            if (title.trim() === "") {
                document.getElementById('dosageError').textContent = "Please enter the dosage.";
                isValid = false;
            }

            if (phone.trim() === "") {
                document.getElementById('frequencyError').textContent = "Please enter the frequency.";
                isValid = false;
            }

            if (username.trim() === "") {
                document.getElementById('durationError').textContent = "Please enter the duration.";
                isValid = false;
            }

            if (pass.trim() === "") {
                document.getElementById('instError').textContent = "Please enter the special instruction.";
                isValid = false;
            }



            // If all validations pass, proceed with AJAX call
            if (isValid) {

                $.ajax({
                    url: 'add_doctor.aspx/submitdata',
                    data: "{ 'name':'" + name + "', 'pass':'" + pass + "', 'username':'" + username + "', 'phone':'" + phone + "', 'title':'" + title + "'  }",
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    type: 'POST',
                    success: function (response) {
                        console.log(response);
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
                $("#title").val('');
                $("#phone").val('');
                $("#username").val('');
                $("#pass").val('');

            }
        }

        document.getElementById('add').addEventListener('click', function () {
            // Show the modal
            $('#medmodal').modal('show');
        });

    
    </script>
</asp:Content>
