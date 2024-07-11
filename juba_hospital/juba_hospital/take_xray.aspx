<%@ Page Title="" Language="C#" MasterPageFile="~/xray.Master" AutoEventWireup="true" CodeBehind="take_xray.aspx.cs" Inherits="juba_hospital.take_xray" %>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <!-- Modal -->
<div class="modal fade" id="medmodal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel1">Upload Lab Image Test </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
<div class="modal-body">
    <input style="display:none" id="id11" />
    <div class="row">
              <div class="col-5">
    <h1>Upload Lab Image</h1>
     <input type="file" id="FileUpload1" accept="image/*">

 <img id="selectedImage22" src="" alt="Selected Image" />
</div>
        
    <div class="col-7">
         <h1>Patient Details</h1>
             <div class="table-responsive">
                         <table id="datatable11" class="display table table-striped table-hover">
  <thead>
    <tr>
      <th> Name</th>
      <th>describtion</th>
   

    </tr>
  </thead>
  <tbody>
    <!-- Table rows will be dynamically added here -->
  </tbody>
</table>
                 </div>
    
   
    </div>
    </div>


    

  

</div>





      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" id="btnSave" class="btn btn-primary">Update</button>
      </div>
    </div>
  </div>
</div>

        <label id="label2">1</label>
             <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">Assign Medication</h4>
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

              <script src="assets/js/plugin/datatables/datatables.min.js"></script>
<script src="Scripts/jquery-3.4.1.min.js"></script>

    <script>


        $(document).ready(function () {
            var reader = new FileReader();
            var fileName;
            var contentType;

            $('[id*=FileUpload1]').change(function () {
                if (typeof (FileReader) != "undefined") {
                    var input = this;

                    reader.onload = function (e) {
                        $('#selectedImage22').attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);

                    var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
                    $($(this)[0].files).each(function () {
                        var file = $(this);
                 
                        if (regex.test(file[0].name.toLowerCase())) {
                            fileName = file[0].name;
                            contentType = file[0].type;
                            reader.readAsDataURL(file[0]);
                        } else {
                            alert(file[0].name + " is not a valid image file.");
                            return false;
                        }
                    });
                } else {
                    alert("This browser does not support HTML5 FileReader.");
                }
            });


            $("[id*=btnSave]").click(function () {
                var prescid = $("#id11").val();
                var im = $("#FileUpload1").val();
                var byteData = reader.result;
                // Check if image data is not present

                if (!im) {
                    Swal.fire({
                        icon: 'warning',
                        title: 'No Image Selected',
                        text: 'Please select an image before saving.'
                    });
                    return false;  // Prevent further execution
                }

            
                byteData = byteData.split(';')[1].replace("base64,", "");

                var obj = {
                    Data: byteData,
                    Name: fileName,
                    ContentType: contentType,
                    PrescID: prescid  // Add the prescid to the object
                };

                $.ajax({
                    type: "POST",
                    url: "take_xray.aspx/SaveImage",
                    data: JSON.stringify({ data: obj }),  // Update the data field to include the prescid
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        // Clear the file input
                        $("#FileUpload1").val('');  // Replace #fileInput with the actual ID of your file input element
                        // Optionally, reset reader.result to ensure it doesn't hold old data
                        reader.result = null;
                        byteData = null;

                        Swal.fire({
                            icon: 'success',
                            title: 'Success',
                            text: r.d
                        })
                       
                    },
                    error: function (r) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: r.responseText
                        });
                        console.log(r.responseText);
                    },
                    failure: function (r) {
                        alert(r.responseText);
                        console.log(r);
                    }
                });
                return false;
            });

        });







        








        // Delegate click events for edit and delete buttons to the table
        $("#datatable").on("click", ".edit-btn", function (event) {
            event.preventDefault(); // Prevent default behavior
            var row = $(this).closest("tr");
            var prescid = $(this).data("id");


        


            $("#id11").val(prescid);

            $.ajax({
                url: 'take_xray.aspx/xrayresults',
                data: "{'prescid':'" + prescid + "'}",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);

                    $("#datatable11 tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        $("#datatable11 tbody").append(
                            "<tr style='cursor:pointer' onclick='passValue(this)'>"
                            + "<td>" + response.d[i].xryname + "</td>"
                            + "<td>" + response.d[i].xrydescribtion + "</td>"
                     
                  

                            + "</tr>"
                        );
                    }




                },
                error: function (response) {
                    alert(response.responseText);
                }
            });

            // Show the modal
            $('#medmodal').modal('show');
        });


        $(document).ready(function () {






            var search = parseInt($("#label2").html());

            $.ajax({
                url: 'take_xray.aspx/pendlap',
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
                            + "<td>" + response.d[i].doctortitle + "</td>"
                            + "<td style='display:none'>" + response.d[i].prescid + "</td>"
                            + "<td><button style='background-color:red; curser:off;   color:white; border:none; padding:5px 10px;  border-radius:30%;' disabled>" + response.d[i].status + "</button></td>"
                            + "<td><button class='edit-btn btn btn-success' data-id='" + response.d[i].prescid + "'>Take Test</button></td>"

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
