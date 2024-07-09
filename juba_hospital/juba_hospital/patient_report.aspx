<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="patient_report.aspx.cs" Inherits="juba_hospital.patient_report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <style>
        .col-4 {
            width: 33.33%; /* Assuming col-4 means 4 columns in a 12-column layout */
            float: left;
            padding: 10px; /* Optional padding for spacing */
        }

        img {
            width: 90%;
            height: 90%;
            object-fit: cover; /* Ensures the image covers the area without distortion */
        }

        h1 {
            text-align: center; /* Centers the heading */
        }

    </style>

<style>
    .report-content {
  border: 3px solid black;
  padding: 0px;
  box-shadow: 10px 10px 10px #888888;
  margin: 5px;
}

.report-header {
  border: 0px solid black;
  height: 150px;
  width: 100%; /* Ensure the div takes the full width of its container */
  overflow: hidden; /* Ensures the image doesn't overflow the div */
  display: flex; /* Center the image horizontally */
  justify-content: center;
  align-items: center; /* Center the image vertically */
}

.report-header img {
  max-height: 100%;
  width: auto; /* Maintain aspect ratio */
}



.patient-details hr {
  border: 1px solid black;
}

.report-body {
  border: 0px solid black;
  height: 300px;
  font-size: 16px;
  overflow: auto; /* Allow scrolling if content overflows */
  padding: 0; /* Remove padding to make full use of the space */
  display: flex;
  justify-content: center;
  align-items: center;
}

table {
  width: 100%;
  max-height: 100%;
  border-collapse: collapse;
  table-layout: auto; /* Allows the table to adjust column widths */
}

th, td {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px; /* Adjust padding for better fit */
  box-sizing: border-box; /* Include border and padding in the element's width and height */
}

th {
  background-color: #f2f2f2;
  text-transform: uppercase; /* Ensure headers are uppercase */
}

.report-sign {
  border: 0px solid black;
  height: 100px;
  margin: 30px 30px;
}

.report-footer {
  border: 0px solid black;
  height: 150px;
}

img {
  height: 100%;
  width: 100%;
}

.lab-doctor-sign {
  float: right;
}

.report-sign img {
  height: 50px;
  width: 100px;
  display: inline-block;
}

.lab-incharge-sign {
  display: inline-block;
}

.align-left {
  text-align: left;
  padding: 10px;
}

/* Print styles */



/*@media print {
  body * {
    visibility: hidden;
  }
  .report-content, .report-content * {
    visibility: visible;
  }
  .report-content {
    position: relative;
    left: 0;
    top: 0;
    width: 100%;
    height: auto;
    margin: 0;
    padding: 0;
    border: none;
    box-shadow: none;
  }

  img {
    width: auto;
    max-width: 100%;

    height: auto;

  }
  .report-header , .report-sign img {
    width: auto;
    max-width: 100%;
    height: auto;
  }
  .report-body {
    height: auto;
    max-height: 100%;
    overflow: visible;
  }
  .col-4 {
    width: 100%;
  }
  #print-button {
    display: none;
  }
}*/



/* Global print styles */
/*@media print {
  body * {
    visibility: hidden;
  }
  .report-content, .report-content * {
    visibility: visible;
  }
  .report-content {
    position: relative;*/ /* Change to relative to allow normal flow */
    /*width: 100%;
    padding: 1rem;*/ /* Add padding for better appearance */
    /*font-size: 1.5rem;*/ /* Increase font size for all elements */
  /*}
  .report-header img, .report-sign img {
    display: block;
    width: 100%;
    max-width: 100%;
    height: auto;
  }
  .report-body {
    margin-top: 1rem;*/ /* Add margin-top to separate from header */
  /*}
  table {
    width: 100%;
    margin-bottom: 1rem;*/ /* Add some space between tables */
    /*font-size: 1.5rem;*/ /* Increase font size for tables */
  /*}
  th, td {
    padding: 1rem;*/ /* Increase padding for better readability */
  /*}
  #print-button {
    display: none;
  }
}*/







  /* Global styles */
body {
  font-size: 16px; /* Base font size */
}

.report-content {
  width: 100%; /* Full width */
  padding: 1rem; /* Add padding for spacing */
  font-size: 1rem; /* Base font size for screen display */
}

@media print {
  body * {
    visibility: hidden;
  }
  .report-content, .report-content * {
    visibility: visible;
  }
  .report-content {
    position: relative; /* Normal flow for printing */
    width: 100%;
    padding: 1rem; /* Padding for better appearance */
    font-size: 1.5rem; /* Increase font size for print */
  }
  .report-body {
    margin-top: 1rem; /* Margin to separate from header */
  }
  table {
    width: 100%;
    margin-bottom: 1rem; /* Add space between tables */
  }
  th, td {
    padding: 1rem; /* Padding for readability */
  }
  .report-header img, .report-sign img {
    display: block;
    width: 100%;
    max-width: 100%;
    height: auto;
  }
  #print-button {
    display: none; /* Hide print button when printing */
  }
}

</style>
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
               <input style="display:none" id="pid" />
                <h1>Assign Medication</h1>
          <button class="btn btn-success" onclick="showmedic()"> show medication report</button>
          <div class="row justify-content-between">
              <div class="col-2">

                  <h1> Amount For the Patent</h1>
                <div class="col-sm-6 col-md-3">
         <div class="card card-stats card-round">
           <div class="card-body">
             <div class="row align-items-center">
               <div class="col-icon">
                 <div
                   class="icon-big text-center icon-primary bubble-shadow-small"
                 >
                   <i class="fas fa-users"></i>
                 </div>
               </div>
               <div class="col col-stats ms-3 ms-sm-0">
                 <div class="numbers">
                   <p class="card-category">Amount </p>
                   <h4 class="card-title">1,294</h4>
                 </div>
               </div>
             </div>
           </div>
         </div>
       </div>
              </div>
              
              <div class="col-6">
                  
    <div class="form-check form-switch">
    <input class="form-check-input" type="checkbox" id="radio2" value="0" onchange="toggleRow()">
    <label class="form-check-label" for="radio2">Show Lab Tests</label>
</div>
<h1>Lab Test Results</h1>
<div class="row" id="lab-test-row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header"></div>
            <div class="card-body p-0">
                <div class="report-content">
                    <div class="report-header">
                        <img src="assets/zfsdfg.png" />
                    </div>
                    <div class="patient-details ">
                        <hr>
                        <table border="0">
                            <tr>
                                <td>Patient Name:  <span class="h5" id="ptname"></span></td>
                                <td class="align-left">Referred By:</td>
                            </tr>
                            <tr>
                                <td>Sex: <span class="h5" id="sex"></span></td>
                                <td class="align-left">Date: <span id="date" class="h5"></span></td>
                            </tr>
                            <tr>
                                <td>Age: <span class="h5" id="DOB"></span> years</td>
                                <td class="align-left">Doctor: <span class="h5" id="doctor"></span></td>
                            </tr>
                            <tr>
                                <td>Phone:  <span class="h5" id="phone"></span></td>
                                <td class="align-left">Location:  <span class="h5" id="location"></span></td>
                            </tr>
                        </table>
                        <hr>
                    </div>
                    <div class="report-body p-0">
                        <table id="datatable1" class="patient-details table-bordered">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Result</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Table rows will be dynamically added here -->
                            </tbody>
                        </table>
                    </div>
                    <div class="report-sign">
                        <div class="lab-incharge-sign">
                            <figcaption>Mr. Sachin Sharma</figcaption>
                        </div>
                        <div class="lab-doctor-sign">
                            <figcaption>Dr. A.K. Asthana</figcaption>
                        </div>
                    </div>
                </div>
                <button id="print-button">Print Report</button>
            </div>
        </div>
    </div>
</div>
    </div>
    <div class="col-4">
        <h1>X-ray Results</h1>
    <%--    <img src="assets/img/lab.png" alt="X-ray Results"/>--%>
    </div>
          </div>

 
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
    <input style="display:none" id="id1111" />

    <div class="mb-3">
        <label for="name" class="form-label">Medication Name</label>
        <input type="text" class="form-control" id="name1" placeholder="Enter Name">
        <small id="nameError1" class="text-danger"></small>
    </div>

    <div class="mb-3">
        <label for="dosage" class="form-label">Dosage</label>
        <input type="text" class="form-control" id="dosage1" placeholder="Enter Dosage">
        <small id="dosageError1" class="text-danger"></small>
    </div>

    <div class="mb-3">
        <label for="frequency" class="form-label">Frequency</label>
        <input type="text" class="form-control" id="frequency1" placeholder="Enter Frequency">
        <small id="frequencyError1" class="text-danger"></small>
    </div>

    <div class="mb-3">
        <label for="duration" class="form-label">Duration</label>
        <input type="text" class="form-control" id="duration1" placeholder="Enter Duration">
        <small id="durationError11" class="text-danger"></small>
    </div>

    <div class="mb-3">
        <label for="inst" class="form-label">Special Instruction</label>
        <textarea class="form-control" id="inst1" rows="3"></textarea>
        <small id="instError1" class="text-danger"></small>
    </div>
</div>





      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
             <button type="button" onclick="deletejob()" class="btn btn-danger">delete</button>
        <button type="button" onclick="update()" class="btn btn-primary">update</button>
          
      </div>
    </div>
  </div>
</div>
       <div class="row">
              <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <h4 class="card-title">Patient Report</h4>
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


        
<!-- Modal -->
<div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-fullscreen">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel11">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <input style="display:none" id="id111" />
                <h1> Medication Report</h1>
          <div class="row">
      
              
              <div class="col-12">
   
       
             <div class="report-content">
  <div class="report-header">
      <img src="assets/zfsdfg.png" />
  </div>
  <div class="patient-details ">
    <hr>
    <table border="0">
      <tr>
        <td>Patient Name:  <span class="h5" id="ptname1"></span></td>
        <td class="align-left">Referred By:</td>
      </tr>
      <tr>
        <td>Sex: <span class="h5" id="sex1"></span></td>
        <td class="align-left">Date: <span id="date1" class="h5"></span></td>
      </tr>
      <tr>
        <td>Age: <span class="h5" id="DOB1"></span>years</td>
        <td class="align-left">Doctor: <span class="h5" id="doctor1"></span> </td>
      </tr>
            <tr>
      <td>Phone:  <span class="h5" id="phone1"></span></td>
      <td class="align-left">Location:  <span class="h5" id="location1"></span></td>
    </tr>
    </table>
    <hr>
  </div>
  <div class="report-body p-0">
    <table id="datatable11" class="patient-details  table-bordered">
      <thead>
        <tr>
          <th>Medication Name</th>
          <th>Dosage</th>
              <th>Frequency</th>
  <th>Duration</th>
              <th>Special Instrcution</th>

        </tr>
      </thead>
      <tbody>
        <!-- Table rows will be dynamically added here -->
      </tbody>
    </table>
  </div>
       <br />
                     <br />
                     <br />
                     <br />
                     <br />
                     <br />
                     <br />
                     <br />
<%--  <div class="report-sign">
    <div class="lab-incharge-sign">

      <figcaption>Mr. Sachin Sharma</figcaption>
    </div>
    <div class="lab-doctor-sign">
 
      <figcaption>Dr. A.K. Asthana</figcaption>
    </div>
  </div>--%>
</div>
<button id="print-button1">Print Report</button>
    </div>

          </div>

 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" onclick="submitInfo()" class ="btn btn-primary">Submit</button>
      </div>
    </div>
  </div>
</div>
         <script src="assets/js/plugin/datatables/datatables.min.js"></script>
   <script src="Scripts/jquery-3.4.1.min.js"></script>
<script>
    function toggleRow() {
        var checkbox = document.getElementById("radio2");
        var row = document.getElementById("lab-test-row");
        if (checkbox.checked) {
            row.style.display = "block";
        } else {
            row.style.display = "none";
        }
    }

    // Initialize the row visibility based on the checkbox state
    document.addEventListener("DOMContentLoaded", function () {
        toggleRow();
    });





    document.getElementById('print-button').addEventListener('click', function () {
        window.print();
    });


    function deletejob() {
        var medid = $("#id1111").val();
        $.ajax({
            type: "POST",
            url: "assignmed.aspx/deleteJob",
            data: JSON.stringify({ medid: medid }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                $('#medmodal').modal('hide');
                if (response.d === 'true') {
                    Swal.fire(
                        'Successfully updated !',
                        'You Added a new job title!',
                        'success'
                    )

        
                } else {
                    // Handle errors in the response
                    Swal.fire({
                        icon: 'error',
                        title: 'Data Insertion Failed',
                        text: 'There was an error while inserting the data.',
                    });
                }
            },
            error: function (xhr, status, error) {
                alert("Error: " + xhr.responseText);
            }
        });

    }


    function update() {
        var medid = $("#id1111").val();
    var med_name = $("#name1").val();
        var dosage = $("#dosage1").val();
        var frequency = $("#frequency1").val();
        var duration = $("#duration1").val();
        var special_inst = $("#inst1").val();
    
    




        $.ajax({
            url: 'assignmed.aspx/updateJob',
            data: "{  'medid':'" + medid + "','med_name':'" + med_name + "', 'dosage':'" + dosage + "', 'frequency':'" + frequency + "', 'duration':'" + duration + "' , 'special_inst':'" + special_inst + "'  }",

            dataType: "json",
            type: 'POST',
            contentType: "application/json",
            success: function (response) {
                console.log(response);
                $('#medmodal').modal('hide');
                Swal.fire(
                    'Successfully Updated !',
                    'You Updated a new Customer!',
                    'success'
                )
                DataBind();
            },
            error: function (response) {
                alert(response.responseText);
            }
        });
    }



    // Delegate click events for edit and delete buttons to the table
    $("#datatable11").on("click", ".edit1-btn", function (event) {
        event.preventDefault(); // Prevent default behavior
        var row = $(this).closest("tr");
        var medid = $(this).data("id");

        var med_name = row.find("td:nth-child(1)").text(); 
        var dosage = row.find("td:nth-child(2)").text(); 
        var frequency = row.find("td:nth-child(3)").text();
   
        var duration = row.find("td:nth-child(5)").text();
        var special_inst = row.find("td:nth-child(4)").text();
  

        

        $("#id1111").val(medid);
        $("#name1").val(med_name);

        $("#dosage1").val(dosage);
        $("#frequency1").val(frequency);
        $("#duration1").val(duration);
        $("#inst1").val(special_inst);

        $('#staticBackdrop1').modal('hide');
        $('#medmodal').modal('show');
        $('#staticBackdrop1').modal('show');
   
    });





    function showmedic() {

        var prescid = $("#id111").val();

        event.preventDefault()

        $.ajax({
            url: 'medication_report.aspx/medicdata',
            data: "{'prescid':'" + prescid + "'}",
            dataType: "json",
            type: 'POST',
            contentType: "application/json",
            success: function (response) {
                console.log(response);

                $("#datatable11 tbody").empty();

                for (var i = 0; i < response.d.length; i++) {
                    $("#datatable11 tbody").append(
                        "<tr>"

                        + "<td>" + response.d[i].med_name + "</td>"
                        + "<td>" + response.d[i].dosage + "</td>"
                        + "<td>" + response.d[i].frequency + "</td>"
                        + "<td>" + response.d[i].duration + "</td>"
                        + "<td>" + response.d[i].special_inst + "</td>"
                        + "<td><button class='edit1-btn btn btn-success' data-id='" + response.d[i].medid + "'>edit</button></td>"


                        + "</tr>"
                    );
                }




            },
            error: function (response) {
                alert(response.responseText);
            }
        });

        // Show the modal
        $('#staticBackdrop1').modal('show');

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
        var med_name = $("#name").val();
        var dosage = $("#dosage").val();
        var frequency = $("#frequency").val();
        var duration = $("#duration").val();
        var special_inst = $("#inst").val();
        var id = $("#pid").val();
        var status = $("#status").val();


        // Validate the form values
        let isValid = true;

        if (med_name.trim() === "") {
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

        if (special_inst.trim() === "") {
            document.getElementById('instError').textContent = "Please enter the special instruction.";
            isValid = false;
        }
     
        if (status === "2") {
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
                url: 'assignmed.aspx/submitdata',
                data: "{ 'status':'" + status + "','id':'" + id + "', 'med_name':'" + med_name + "', 'dosage':'" + dosage + "', 'frequency':'" + frequency + "', 'duration':'" + duration + "', 'prescid':'" + prescid + "' , 'special_inst':'" + special_inst + "'  }",
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
            $("#dosage").val('');
            $("#inst").val('');
            $("#frequency").val('');
             $("#duration").val('');
       
        }
    }

    // Delegate click events for edit and delete buttons to the table
    $("#datatable").on("click", ".edit-btn", function (event) {
        event.preventDefault(); // Prevent default behavior
        var row = $(this).closest("tr");
        var prescid = $(this).data("id");
  

        var name = row.find("td:nth-child(2)").text(); // Assuming jobname is in the second column
        var gender = row.find("td:nth-child(3)").text();
        var name = row.find("td:nth-child(2)").text();
        var phone = row.find("td:nth-child(5)").text();
        var location = row.find("td:nth-child(4)").text();
        var sex = row.find("td:nth-child(3)").text();
        var dobText = row.find("td:nth-child(7)").text();

        var doctor = row.find("td:nth-child(9)").text();

        var id = row.find("td:nth-child(10)").text();



        $("#doctor").text(doctor);
        // Parse the DOB into a Date object
        var dob = new Date(dobText);
        var today = new Date();

        // Calculate the age
        var age = today.getFullYear() - dob.getFullYear();
        var monthDiff = today.getMonth() - dob.getMonth();
        var dayDiff = today.getDate() - dob.getDate();

        // Adjust the age if the current date hasn't yet reached the birthday in the current year
        if (monthDiff < 0 || (monthDiff === 0 && dayDiff < 0)) {
            age--;
        }


        // Display the current date in the element with ID "date"
        var options = { year: 'numeric', month: 'long', day: 'numeric' };
        var formattedToday = today.toLocaleDateString('en-US', options);
        $("#date").text(formattedToday);
        // Display the age in the input field
        $("#DOB").text(age);


        $("#pid").val(id);

        $("#ptname").text(name);
     
        $("#phone").text(phone);
        $("#location").text(location);
        $("#sex").text(sex);
        $("#ptname1").text(name);

        $("#phone1").text(phone);
        $("#location1").text(location);
        $("#sex1").text(sex);
        $("#id111").val(prescid);

    


        $.ajax({
            url: 'assignmed.aspx/lab_test',
            data: "{'prescid':'" + prescid + "'}",
            dataType: "json",
            type: 'POST',
            contentType: "application/json",
            success: function (response) {
                console.log(response);

                $("#datatable1 tbody").empty();

                for (var i = 0; i < response.d.length; i++) {
                    $("#datatable1 tbody").append(
                        "<tr>"

                        + "<td>" + response.d[i].TestName + "</td>"
                        + "<td>" + response.d[i].TestValue + "</td>"


                        + "</tr>"
                    );
                }




            },
            error: function (response) {
                alert(response.responseText);
            }
        });

   
        // Show the modal
        $('#staticBackdrop').modal('show');
    });


    $(document).ready(function () {
   
     


          

  
  
            $.ajax({
                url: 'patient_report.aspx/patientreport',
                data: "",
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
                            + "<td style='display:none'>" + response.d[i].doctortitle + "</td>"
                            + "<td style='display:none'>" + response.d[i].prescid + "</td>"
                            + "<td style='display:none'>" + response.d[i].patientid + "</td>"
                            + "<td><button style='background-color:red; curser:off;   color:white; border:none; padding:5px 10px;  border-radius:30%;' disabled>" + response.d[i].status + "</button></td>"
                            + "<td><button class='edit-btn btn btn-success' data-id='" + response.d[i].prescid + "'>View Report</button></td>"

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
