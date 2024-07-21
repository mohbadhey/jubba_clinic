<%@ Page Title="" Language="C#" MasterPageFile="~/doctor.Master" AutoEventWireup="true" CodeBehind="assignmed.aspx.cs" Inherits="juba_hospital.assignmed" %>
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
        <style>
    .hidden {
        display: none;
    }




</style>
       <style>
       .hidden {
           display: none;
       }



   </style>
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
<%--<style>
  .report-content {
    border: 3px solid black;
    padding: 0;
    box-shadow: 10px 10px 10px #888888;
    margin: 5px;
    width: 100%;
  }

  .report-header {
    border: 0;
    height: 150px;
    width: 100%;
    overflow: hidden;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .report-header img {
    max-height: 100%;
    width: auto;
  }

  .patient-details hr {
    border: 1px solid black;
  }

  .report-body {
    border: 0;
    font-size: 16px;
    overflow: auto;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    table-layout: auto;
  }

  th, td {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
    box-sizing: border-box;
  }

  th {
    background-color: #f2f2f2;
    text-transform: uppercase;
  }

  .report-sign {
    border: 0;
    height: 100px;
    margin: 30px 30px;
  }

  .report-footer {
    border: 0;
    height: 150px;
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

  /* Global styles */
  body {
    font-size: 16px;
  }

  .report-content {
    width: 100%;
    padding: 1rem;
    font-size: 1rem;
  }

  @media print {
    @page {
      size: A4;
      margin: 10mm;
    }
    
    body * {
      visibility: hidden;
    }

    .report-content, .report-content * {
      visibility: visible;
    }

    .report-content {
      position: absolute;
      left: 0;
      top: 0;
      width: 100%;
      padding: 1rem;
      font-size: 1.2rem;
    }

    .report-body {
      margin-top: 1rem;
    }

    table {
      width: 100%;
      margin-bottom: 1rem;
    }

    th, td {
      padding: 0.5rem;
    }

    .report-header img, .report-sign img {
      display: block;
      width: 100%;
      max-width: 100%;
      height: auto;
    }

    #print-button1 {
      display: none;
    }
  }
</style>--%>
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
          <br />
          <br />
          <br />
          <div class="row justify-content-between">
              <div class="col-3">
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
       <textarea class="form-control" id="inst7" rows="3"></textarea>
       <small id="instError5" class="text-danger"></small>
   </div>
                   <div class="mb-3">
     <label for="duration" class="form-label">Patient Type</label>

                       <select class="form-control" id="status">
                           <option value="2"> select patient type</option>
                               <option value="0">Out Patient</option>
                               <option value="1"> In Patient</option>
                       </select>
     <small id="durationError1" class="text-danger"></small>
 </div>
              </div>
              
              <div class="col-6">
                  
    <div class="form-check form-switch">
    <input class="form-check-input" type="checkbox" id="radio2" value="0" onchange="toggleRow()">
    <label class="form-check-label" for="radio2">Show Lab Tests</label>
                  <button class="btn btn-success" id="sendlab" onclick="showlab()"> send to lab</button>
          <button class="btn btn-success" id="editlab1" onclick="editlab()"> edit lab</button>
          <button class="btn btn-success" id="sendxry" onclick="sendxray()"> send to image</button>
                  <button class="btn btn-success" id="editxry" onclick="updatexry()"> edit image</button>

   

</div>
<h1>Lab Test Results</h1>
<div class="row" id="lab-test-row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header"></div>
            <div class="card-body p-0">
             <div class="report-content" style="font-family: Arial, sans-serif; width: 100%; margin: 0 auto; padding: 0;">
    <div class="report-header" style="text-align: center; margin-bottom: 20px;">
        <img src="assets/zfsdfg.png" style="max-width: 100%; height: auto;" />
    </div>
    <div class="patient-details" style="margin-bottom: 10px;">
            <h3 id="ht" style="text-align: center;">Laboratory Report</h3>
        <hr style="border: 0; border-top: 1px solid #000;" />
        <table border="0" style="width: 100%; table-layout: fixed;">
            <tr>
                <td style="padding: 5px;">Patient Name: <span class="h5" id="ptname"></span></td>
                <td style="padding: 5px; text-align: left;">Referred By:</td>
            </tr>
            <tr>
                <td style="padding: 5px;">Sex: <span class="h5" id="sex"></span></td>
                <td style="padding: 5px; text-align: left;">Date: <span id="date" class="h5"></span></td>
            </tr>
            <tr>
                <td style="padding: 5px;">Age: <span class="h5" id="DOB"></span> years</td>
                <td style="padding: 5px; text-align: left;">Doctor: <span class="h5" id="doctor"></span></td>
            </tr>
            <tr>
                <td style="padding: 5px;">Phone: <span class="h5" id="phone"></span></td>
                <td style="padding: 5px; text-align: left;">Location: <span class="h5" id="location"></span></td>
            </tr>
        </table>
        <hr style="border: 0; border-top: 1px solid #000;" />
    </div>
    <div class="report-body" style="margin: 0;">
        <table id="datatable1" class="patient-details" style="width: 100%; border-collapse: collapse; border: 1px solid #000;">
            <thead>
                <tr>
                    <th style="border: 1px solid #000; padding: 5px;">Name</th>
                    <th style="border: 1px solid #000; padding: 5px;">Result</th>
                </tr>
            </thead>
            <tbody>
                <!-- Table rows will be dynamically added here -->
            </tbody>
        </table>
    </div>
</div>
<button id="print-button" style="display: none;" onclick="printReport()">Print Report</button>

            </div>
        </div>
    </div>
</div>
    </div>
    <div class="col-3">
      
        <h1>image  Results</h1>
        <label class="h3" id="imgtype"></label>
    <%--    <img src="assets/img/lab.png" alt="X-ray Results"/>--%>

        <img src="" id="img"/>
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
                    <h4 class="card-title">Assign Medication</h4>
                  </div>
                  <div class="card-body">
                    <div>
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
                                <th>image Status</th>
                                         <th>Operation</th>
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
                                 <th>image Status</th>
                                      <th>Operation</th>
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
   
          
  <div class="report-content col-12" id="report" style="font-family: Arial, sans-serif; width: 100%; margin: 0 auto; padding: 0;">
  <div class="report-header" style="text-align: center; margin-bottom: 20px;">
      <img src="assets/zfsdfg.png" style="max-width: 100%; height: auto;" />
  </div>
  <div class="patient-details" style="margin-bottom: 4px;">
      <h3 id="ht" style="text-align: center;">Medication Report</h3>
    <hr style="border: 0; border-top: 1px solid #000;" />
    <table border="0" style="width: 100%; table-layout: fixed;">
      <tr>
        <td>Patient Name: <span class="h5" id="ptname1"></span></td>
        <td>Referred By:</td>
      </tr>
      <tr>
        <td >Sex: <span class="h5" id="sex1"></span></td>
        <td>Date: <span id="date1" class="h5"></span></td>
      </tr>
      <tr>
        <td>Age: <span class="h5" id="DOB1"></span> years</td>
        <td>Doctor: <span class="h5" id="doctor1"></span></td>
      </tr>
      <tr>
        <td>Phone: <span class="h5" id="phone1"></span></td>
        <td>Location: <span class="h5" id="location1"></span></td>
      </tr>
    </table>
    <hr style="border: 0; border-top: 1px solid #000;" />
  </div>
  <div class="report-body" style="margin: 0;">
    <table id="datatable11" class="patient-details" style="width: 100%; border-collapse: collapse; border: 1px solid #000;">
      <thead>
        <tr>
          <th style="border: 1px solid #000; padding: 5px;">Medication Name</th>
          <th style="border: 1px solid #000; padding: 5px;">Dosage</th>
          <th style="border: 1px solid #000; padding: 5px;">Frequency</th>
          <th style="border: 1px solid #000; padding: 5px;">Duration</th>
          <th style="border: 1px solid #000; padding: 5px;">Special Instruction</th>
        </tr>
      </thead>
      <tbody>
        <!-- Table rows will be dynamically added here -->
      </tbody>
    </table>
  </div>
  <br /><br /><br /><br /><br /><br /><br /><br />
  <%-- 
  <div class="report-sign">
    <div class="lab-incharge-sign">
      <figcaption>Mr. Sachin Sharma</figcaption>
    </div>
    <div class="lab-doctor-sign">
      <figcaption>Dr. A.K. Asthana</figcaption>
    </div>
  </div>
  --%>
</div>
<button id="print-button1" style="display: none;" onclick="printReport1()">Print Report</button>
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
            <!-- Modal -->
<div class="modal fade" id="staticBackdrop11" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel111">Lab Tests</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <input style="display:none" id="labid" />
              <input style="display:none"  id="medid" />
          <div class="row">
              <div class="col-12">
                  <h1>Lab Test Details</h1>

         <div class="form-check form-switch">
        <input class="form-check-input" type="checkbox" id="radio21" value="0">
        <label class="form-check-label" for="radio2">Show Lab Tests</label>
    </div>

<div id="additionalTests" class="hidden">
    <div class="row">
            <div class="col-4">
                                                          <div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckLDL">
    <label class="form-check-label" for="flexCheckLDL">
        Low-density lipoprotein (LDL)
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckHDL">
    <label class="form-check-label" for="flexCheckHDL">
        High-density lipoprotein (HDL)
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckTotalCholesterol">
    <label class="form-check-label" for="flexCheckTotalCholesterol">
        Total cholesterol
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckTriglycerides">
    <label class="form-check-label" for="flexCheckTriglycerides">
        Triglycerides
    </label>
</div>  
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckSodium">
        <label class="form-check-label" for="flexCheckSodium">
            Sodium
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckPotassium">
        <label class="form-check-label" for="flexCheckPotassium">
            Potassium
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckChloride">
        <label class="form-check-label" for="flexCheckChloride">
            Chloride
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckCalcium">
        <label class="form-check-label" for="flexCheckCalcium">
            Calcium
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckPhosphorous">
        <label class="form-check-label" for="flexCheckPhosphorous">
            Phosphorous
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckMagnesium">
        <label class="form-check-label" for="flexCheckMagnesium">
            Magnesium
        </label>
    </div>
                <div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckCreatinine">
    <label class="form-check-label" for="flexCheckCreatinine">
        Creatinine
    </label>
</div>
   
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckAmylase">
        <label class="form-check-label" for="flexCheckAmylase">
            Amylase
        </label>
    </div>
                
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckProgesteroneFemale">
        <label class="form-check-label" for="flexCheckProgesteroneFemale">
            Progesterone (Female)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckFSH">
        <label class="form-check-label" for="flexCheckFSH">
            Follicle stimulating hormone (FSH)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckEstradiol">
        <label class="form-check-label" for="flexCheckEstradiol">
            Estradiol
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckLH">
        <label class="form-check-label" for="flexCheckLH">
            Luteinizing hormone (LH)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckTestosteroneMale">
        <label class="form-check-label" for="flexCheckTestosteroneMale">
            Testosterone (Male)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckProlactin">
        <label class="form-check-label" for="flexCheckProlactin">
            Prolactin
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckSeminalFluidAnalysis">
        <label class="form-check-label" for="flexCheckSeminalFluidAnalysis">
            Seminal Fluid Analysis (Male)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckBHCG">
        <label class="form-check-label" for="flexCheckBHCG">
            B-HCG
        </label>
    </div>
 
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckUrineExamination">
        <label class="form-check-label" for="flexCheckUrineExamination">
            Urine examination
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckStoolExamination">
        <label class="form-check-label" for="flexCheckStoolExamination">
            Stool examination
        </label>
    </div>

    </div>



        <div class="col-4">
                             

<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckUricAcid">
    <label class="form-check-label" for="flexCheckUricAcid">
        Uric acid
    </label>
</div>
    
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckBrucellaAbortus">
        <label class="form-check-label" for="flexCheckBrucellaAbortus">
            Brucella abortus
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckCRP">
        <label class="form-check-label" for="flexCheckCRP">
            C-reactive protein (CRP)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckRF">
        <label class="form-check-label" for="flexCheckRF">
            Rheumatoid factor (RF)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckASO">
        <label class="form-check-label" for="flexCheckASO">
            Antistreptolysin O (ASO)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckToxoplasmosis">
        <label class="form-check-label" for="flexCheckToxoplasmosis">
            Toxoplasmosis
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckTyphoid">
        <label class="form-check-label" for="flexCheckTyphoid">
            Typhoid (hCG)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckHpyloriAntibody">
        <label class="form-check-label" for="flexCheckHpyloriAntibody">
            H.pylori antibody
        </label>
    </div>
  
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckStoolOccultBlood">
        <label class="form-check-label" for="flexCheckStoolOccultBlood">
            Stool occult blood
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckGeneralStoolExamination">
        <label class="form-check-label" for="flexCheckGeneralStoolExamination">
            General stool examination
        </label>
    </div>
  
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckThyroidProfile">
        <label class="form-check-label" for="flexCheckThyroidProfile">
            Thyroid profile
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckT3">
        <label class="form-check-label" for="flexCheckT3">
            Triiodothyronine (T3)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckT4">
        <label class="form-check-label" for="flexCheckT4">
            Thyroxine (T4)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckTSH">
        <label class="form-check-label" for="flexCheckTSH">
            Thyroid stimulating hormone (TSH)
        </label>
    </div>
  

    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckSpermExamination">
        <label class="form-check-label" for="flexCheckSpermExamination">
            Sperm examination
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckVirginalSwab">
        <label class="form-check-label" for="flexCheckVirginalSwab">
            Virginal swab
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckTrichomonasVirginals">
        <label class="form-check-label" for="flexCheckTrichomonasVirginals">
            Trichomonas virginals
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckHCG">
        <label class="form-check-label" for="flexCheckHCG">
            Human chorionic gonadotropin (hCG)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckHpyloriAgStool">
        <label class="form-check-label" for="flexCheckHpyloriAgStool">
            H.pylori Ag (stool)
        </label>
    </div>
   
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckFastingBloodSugar">
        <label class="form-check-label" for="flexCheckFastingBloodSugar">
            Fasting blood sugar
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckHemoglobinA1c">
        <label class="form-check-label" for="flexCheckHemoglobinA1c">
            Hemoglobin A1c
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckGeneralUrineExamination">
        <label class="form-check-label" for="flexCheckGeneralUrineExamination">
            General urine examination
        </label>
    </div>
    </div>

       <div class="col-4">

                                          
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckLiverFunctionTest">
    <label class="form-check-label" for="flexCheckLiverFunctionTest">
        Liver function test
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckSGPTALT">
    <label class="form-check-label" for="flexCheckSGPTALT">
        SGPT (ALT)
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckSGOTAST">
    <label class="form-check-label" for="flexCheckSGOTAST">
        SGOT (AST)
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckAlkalinePhosphatesALP">
    <label class="form-check-label" for="flexCheckAlkalinePhosphatesALP">
        Alkaline phosphates (ALP)
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckTotalBilirubin">
    <label class="form-check-label" for="flexCheckTotalBilirubin">
        Total bilirubin
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckDirectBilirubin">
    <label class="form-check-label" for="flexCheckDirectBilirubin">
        Direct bilirubin
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckAlbumin">
    <label class="form-check-label" for="flexCheckAlbumin">
        Albumin
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckJGlobulin">
    <label class="form-check-label" for="flexCheckJGlobulin">
        JGlobulin
    </label>
</div>
   
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckUrea">
    <label class="form-check-label" for="flexCheckUrea">
        Urea
    </label>
</div>

                       <div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckHemoglobin">
    <label class="form-check-label" for="flexCheckHemoglobin">
        Hemoglobin
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckMalaria">
    <label class="form-check-label" for="flexCheckMalaria">
        Malaria
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckESR">
    <label class="form-check-label" for="flexCheckESR">
        ESR
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckBloodGrouping">
    <label class="form-check-label" for="flexCheckBloodGrouping">
        Blood grouping
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckBloodSugar">
    <label class="form-check-label" for="flexCheckBloodSugar">
        Blood sugar
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckCBC">
    <label class="form-check-label" for="flexCheckCBC">
        CBC
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckCrossMatching">
    <label class="form-check-label" for="flexCheckCrossMatching">
        Cross matching
    </label>
</div>

<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckTPHA">
    <label class="form-check-label" for="flexCheckTPHA">
        TPHA
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckHIV">
    <label class="form-check-label" for="flexCheckHIV">
        Human immune deficiency (HIV)
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckHBV">
    <label class="form-check-label" for="flexCheckHBV">
        Hepatitis B virus (HBV)
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckHCV">
    <label class="form-check-label" for="flexCheckHCV">
        Hepatitis C virus (HCV)
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckBrucellaMelitensis">
    <label class="form-check-label" for="flexCheckBrucellaMelitensis">
        Brucella melitensis
    </label>
</div>
       </div>
    </div>

    

    

</div>

              </div>
         
                  
             
        
  
          </div>

 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
             <button type="button" id="updateButton" onclick="callAjaxFunction()" class="btn btn-primary">Update</button>
            <button type="button" id="submitButton" class="btn btn-primary">Submit</button>
      </div>
    </div>
  </div>
</div>


        <!-- Modal -->
<div class="modal fade" id="staticBackdrop9" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel9">Lab Tests</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <input style="display:none" id="id9" />
               <input style="display:none" id="id99" />
          <div class="row">

         
                  
             
       
              <div class="col-12"> 
                  <h1>X-ray Details</h1>
       <div class="form-check form-switch">
        <input class="form-check-input" type="checkbox" id="radio" required>
        <label class="form-check-label" for="radio">Show X-Ray Details</label>
    </div>

    <div class="mb-3 hidden" id="xrayDetails">
        <label for="name" class="form-label">X-Ray Name</label>
        <input type="text" class="form-control" name="xrayname" id="xrayname" placeholder="Enter X-Ray name" required>
        <small id="xrayerror" class="text-danger"></small>
    </div>
              
     <div class="mb-3 hidden" id="xraySpecial">
     <label for="inst" class="form-label">Special Instruction</label>
     <textarea class="form-control" id="inst" rows="3"></textarea>
     <small id="instError" class="text-danger"></small>
 </div>
                      <div class="mb-3 hidden" id="xraySpecial5">

                                     <select class="form-control" id="typeimg" >
    <option value="0"> please select type</option>
                                            <option value="Xray">Xray</option>
                                            <option value="CT scan">CT scan</option>
                                             <option value="Ultra Sound<">Ultra Sound</option>
                                             <option value="MRI">MRI</option>
</select>
    <small id="imgtype5" class="text-danger"></small>
</div>
                     


              </div>
          </div>

 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="button" id="submitButton7" onclick="updatexrysub()" class="btn btn-success">update</button>
        <button type="button" id="submitButton5" class="btn btn-primary">Submit</button>
      </div>
    </div>
  </div>
</div>









<%--
    
            <!-- Modal -->
<div class="modal fade" id="staticBackdrop6" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel16">Lab Tests</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <input style="display:none" id="editl" />
                   <input style="display:none"  id="medid" />
          
          <div class="row">
              <div class="col-12">
                  <h1>Lab Test Details</h1>

         <div class="form-check form-switch">
        <input class="form-check-input" type="checkbox" id="radio22" value="0">
        <label class="form-check-label" for="radio2">Show Lab Tests</label>
    </div>

<div id="additionalTests1" class="hidden">
    <div class="row">
            <div class="col-4">
                                                          <div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckLDL1">
    <label class="form-check-label" for="flexCheckLDL">
        Low-density lipoprotein (LDL)
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckHDL1">
    <label class="form-check-label" for="flexCheckHDL">
        High-density lipoprotein (HDL)
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckTotalCholesterol1">
    <label class="form-check-label" for="flexCheckTotalCholesterol">
        Total cholesterol
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckTriglycerides1">
    <label class="form-check-label" for="flexCheckTriglycerides">
        Triglycerides
    </label>
</div>  
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckSodium1">
        <label class="form-check-label" for="flexCheckSodium">
            Sodium
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckPotassium1">
        <label class="form-check-label" for="flexCheckPotassium">
            Potassium
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckChloride1">
        <label class="form-check-label" for="flexCheckChloride">
            Chloride
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckCalcium1">
        <label class="form-check-label" for="flexCheckCalcium">
            Calcium
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckPhosphorous1">
        <label class="form-check-label" for="flexCheckPhosphorous">
            Phosphorous
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckMagnesium1">
        <label class="form-check-label" for="flexCheckMagnesium">
            Magnesium
        </label>
    </div>
                <div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckCreatinine1">
    <label class="form-check-label" for="flexCheckCreatinine">
        Creatinine
    </label>
</div>
   
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckAmylase1">
        <label class="form-check-label" for="flexCheckAmylase">
            Amylase
        </label>
    </div>
                
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckProgesteroneFemale1">
        <label class="form-check-label" for="flexCheckProgesteroneFemale">
            Progesterone (Female)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckFSH1">
        <label class="form-check-label" for="flexCheckFSH">
            Follicle stimulating hormone (FSH)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckEstradiol1">
        <label class="form-check-label" for="flexCheckEstradiol">
            Estradiol
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckLH1">
        <label class="form-check-label" for="flexCheckLH">
            Luteinizing hormone (LH)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckTestosteroneMale1">
        <label class="form-check-label" for="flexCheckTestosteroneMale">
            Testosterone (Male)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckProlactin1">
        <label class="form-check-label" for="flexCheckProlactin">
            Prolactin
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckSeminalFluidAnalysis1">
        <label class="form-check-label" for="flexCheckSeminalFluidAnalysis">
            Seminal Fluid Analysis (Male)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckBHCG1">
        <label class="form-check-label" for="flexCheckBHCG">
            B-HCG
        </label>
    </div>
 
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckUrineExamination1">
        <label class="form-check-label" for="flexCheckUrineExamination">
            Urine examination
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckStoolExamination1">
        <label class="form-check-label" for="flexCheckStoolExamination">
            Stool examination
        </label>
    </div>

    </div>



        <div class="col-4">
                             

<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckUricAcid1">
    <label class="form-check-label" for="flexCheckUricAcid">
        Uric acid
    </label>
</div>
    
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckBrucellaAbortus1">
        <label class="form-check-label" for="flexCheckBrucellaAbortus">
            Brucella abortus
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckCRP1">
        <label class="form-check-label" for="flexCheckCRP">
            C-reactive protein (CRP)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckRF1">
        <label class="form-check-label" for="flexCheckRF">
            Rheumatoid factor (RF)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckASO1">
        <label class="form-check-label" for="flexCheckASO">
            Antistreptolysin O (ASO)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckToxoplasmosis1">
        <label class="form-check-label" for="flexCheckToxoplasmosis">
            Toxoplasmosis
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckTyphoid1">
        <label class="form-check-label" for="flexCheckTyphoid">
            Typhoid (hCG)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckHpyloriAntibody1">
        <label class="form-check-label" for="flexCheckHpyloriAntibody">
            H.pylori antibody
        </label>
    </div>
  
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckStoolOccultBlood1">
        <label class="form-check-label" for="flexCheckStoolOccultBlood">
            Stool occult blood
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckGeneralStoolExamination1">
        <label class="form-check-label" for="flexCheckGeneralStoolExamination">
            General stool examination
        </label>
    </div>
  
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckThyroidProfile1">
        <label class="form-check-label" for="flexCheckThyroidProfile">
            Thyroid profile
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckT31">
        <label class="form-check-label" for="flexCheckT3">
            Triiodothyronine (T3)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckT41">
        <label class="form-check-label" for="flexCheckT4">
            Thyroxine (T4)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckTSH1">
        <label class="form-check-label" for="flexCheckTSH">
            Thyroid stimulating hormone (TSH)
        </label>
    </div>
  

    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckSpermExamination1">
        <label class="form-check-label" for="flexCheckSpermExamination">
            Sperm examination
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckVirginalSwab1">
        <label class="form-check-label" for="flexCheckVirginalSwab">
            Virginal swab
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckTrichomonasVirginals1">
        <label class="form-check-label" for="flexCheckTrichomonasVirginals">
            Trichomonas virginals
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckHCG1">
        <label class="form-check-label" for="flexCheckHCG">
            Human chorionic gonadotropin (hCG)
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckHpyloriAgStool1">
        <label class="form-check-label" for="flexCheckHpyloriAgStool">
            H.pylori Ag (stool)
        </label>
    </div>
   
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckFastingBloodSugar1">
        <label class="form-check-label" for="flexCheckFastingBloodSugar">
            Fasting blood sugar
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckHemoglobinA1c1">
        <label class="form-check-label" for="flexCheckHemoglobinA1c">
            Hemoglobin A1c
        </label>
    </div>
    <div class="form-check">
        <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckGeneralUrineExamination1">
        <label class="form-check-label" for="flexCheckGeneralUrineExamination">
            General urine examination
        </label>
    </div>
    </div>

       <div class="col-4">

                                          
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckLiverFunctionTest1">
    <label class="form-check-label" for="flexCheckLiverFunctionTest">
        Liver function test
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckSGPTALT1">
    <label class="form-check-label" for="flexCheckSGPTALT">
        SGPT (ALT)
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckSGOTAST1">
    <label class="form-check-label" for="flexCheckSGOTAST">
        SGOT (AST)
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckAlkalinePhosphatesALP1">
    <label class="form-check-label" for="flexCheckAlkalinePhosphatesALP">
        Alkaline phosphates (ALP)
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckTotalBilirubin1">
    <label class="form-check-label" for="flexCheckTotalBilirubin">
        Total bilirubin
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckDirectBilirubin1">
    <label class="form-check-label" for="flexCheckDirectBilirubin">
        Direct bilirubin
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckAlbumin1">
    <label class="form-check-label" for="flexCheckAlbumin">
        Albumin
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckJGlobulin1">
    <label class="form-check-label" for="flexCheckJGlobulin">
        JGlobulin
    </label>
</div>
   
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckUrea1">
    <label class="form-check-label" for="flexCheckUrea">
        Urea
    </label>
</div>

                       <div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckHemoglobin1">
    <label class="form-check-label" for="flexCheckHemoglobin">
        Hemoglobin
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckMalaria1">
    <label class="form-check-label" for="flexCheckMalaria">
        Malaria
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckESR1">
    <label class="form-check-label" for="flexCheckESR">
        ESR
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckBloodGrouping1">
    <label class="form-check-label" for="flexCheckBloodGrouping">
        Blood grouping
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckBloodSugar1">
    <label class="form-check-label" for="flexCheckBloodSugar">
        Blood sugar
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckCBC1">
    <label class="form-check-label" for="flexCheckCBC">
        CBC
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckCrossMatching1">
    <label class="form-check-label" for="flexCheckCrossMatching">
        Cross matching
    </label>
</div>

<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckTPHA1">
    <label class="form-check-label" for="flexCheckTPHA">
        TPHA
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckHIV1">
    <label class="form-check-label" for="flexCheckHIV">
        Human immune deficiency (HIV)
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckHBV1">
    <label class="form-check-label" for="flexCheckHBV">
        Hepatitis B virus (HBV)
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckHCV1">
    <label class="form-check-label" for="flexCheckHCV">
        Hepatitis C virus (HCV)
    </label>
</div>
<div class="form-check">
    <input class="custom-control-input custom-checkbox" type="checkbox" value="" id="flexCheckBrucellaMelitensis1">
    <label class="form-check-label" for="flexCheckBrucellaMelitensis">
        Brucella melitensis
    </label>
</div>
       </div>
    </div>

    

    

</div>

              </div>
         
                  
             
        
  
          </div>

 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" onclick="callAjaxFunction()" class="btn btn-primary">Update</button>
      </div>
    </div>
  </div>
</div>--%>
        <script src="assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.70/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.70/vfs_fonts.js"></script>
<script>
    function printReport1() {
        const printContents = document.querySelector('#report').innerHTML;
        const originalContents = document.body.innerHTML;

        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
    }

    document.getElementById('print-button1').style.display = 'block';


    function printReport() {
        const printContents = document.querySelector('.report-content').innerHTML;
        const originalContents = document.body.innerHTML;

        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
    }

    document.getElementById('print-button').style.display = 'block';



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


    //document.getElementById('print-button').addEventListener('click', function () {
    //    window.print();
    //});

    //document.getElementById('print-button1').addEventListener('click', function () {
    //    window.print();
    //});

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

    function updatexrysub() {
        var xryid = $("#id99").val();
        var xrayname = $("#xrayname").val();
        var inst = $("#inst").val();
      

        var typeimg = $("#typeimg").val();




        $.ajax({
            url: 'assignmed.aspx/realxryupdate',
            data: "{  'xryid':'" + xryid + "','xrayname':'" + xrayname + "', 'inst':'" + inst + "', 'typeimg':'" + typeimg + "' }",

            dataType: "json",
            type: 'POST',
            contentType: "application/json",
            success: function (response) {
                console.log(response);
                $('#staticBackdrop9').modal('hide');
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


    document.addEventListener('DOMContentLoaded', function () {
        const radio2 = document.getElementById('radio21');
        const submitButton = document.getElementById('submitButton');
        const additionalTests = document.getElementById('additionalTests');

        function toggleAdditionalTests() {
            if (radio21.checked) {
                radio21.value = "1";
                additionalTests.classList.remove('hidden');
            } else {
                radio21.value = "0";
                additionalTests.classList.add('hidden');
            }
        }

        function callAjaxFunction() {
            if (!radio21.checked || !isAnyCheckboxChecked()) {
                alert("Please ensure radio2 and at least one other checkbox are checked.");
                return;
            }


            var flexCheckHDL, flexCheckLDL, flexCheckTotalCholesterol, flexCheckTriglycerides, flexCheckLiverFunctionTest, flexCheckSGPTALT, flexCheckSGOTAST, flexCheckAlkalinePhosphatesALP, flexCheckTotalBilirubin, flexCheckDirectBilirubin, flexCheckAlbumin, flexCheckJGlobulin, flexCheckUrea, flexCheckCreatinine, flexCheckUricAcid, flexCheckSodium, flexCheckPotassium, flexCheckChloride, flexCheckCalcium, flexCheckPhosphorous, flexCheckMagnesium, flexCheckAmylase, flexCheckProgesteroneFemale, flexCheckFSH, flexCheckEstradiol, flexCheckLH, flexCheckTestosteroneMale, flexCheckProlactin, flexCheckSeminalFluidAnalysis, flexCheckBHCG, flexCheckUrineExamination, flexCheckStoolExamination, flexCheckHemoglobin, flexCheckMalaria, flexCheckESR, flexCheckBloodGrouping, flexCheckBloodSugar, flexCheckCBC, flexCheckCrossMatching, flexCheckTPHA, flexCheckHIV, flexCheckHBV, flexCheckHCV, flexCheckBrucellaMelitensis, flexCheckBrucellaAbortus, flexCheckCRP, flexCheckRF, flexCheckASO, flexCheckToxoplasmosis, flexCheckTyphoid, flexCheckHpyloriAntibody, flexCheckStoolOccultBlood, flexCheckGeneralStoolExamination, flexCheckThyroidProfile, flexCheckT3, flexCheckT4, flexCheckTSH, flexCheckSpermExamination, flexCheckVirginalSwab, flexCheckTrichomonasVirginals, flexCheckHCG, flexCheckHpyloriAgStool, flexCheckFastingBloodSugar, flexCheckHemoglobinA1c, flexCheckGeneralUrineExamination;
            // Example for flexCheckHDL
            flexCheckHDL = $('#flexCheckHDL');
            if (flexCheckHDL.prop('checked')) {
                flexCheckHDL = flexCheckHDL.next('label').text().trim();
            } else {
                flexCheckHDL = 'not checked';
            }

            // Example for flexCheckLDL
            flexCheckLDL = $('#flexCheckLDL');
            if (flexCheckLDL.prop('checked')) {
                flexCheckLDL = flexCheckLDL.next('label').text().trim();
            } else {
                flexCheckLDL = 'not checked';
            }

            // Example for flexCheckTotalCholesterol
            flexCheckTotalCholesterol = $('#flexCheckTotalCholesterol');
            if (flexCheckTotalCholesterol.prop('checked')) {
                flexCheckTotalCholesterol = flexCheckTotalCholesterol.next('label').text().trim();
            } else {
                flexCheckTotalCholesterol = 'not checked';
            }

            // Example for flexCheckTriglycerides
            flexCheckTriglycerides = $('#flexCheckTriglycerides');
            if (flexCheckTriglycerides.prop('checked')) {
                flexCheckTriglycerides = flexCheckTriglycerides.next('label').text().trim();
            } else {
                flexCheckTriglycerides = 'not checked';
            }

            // Example for flexCheckLiverFunctionTest
            flexCheckLiverFunctionTest = $('#flexCheckLiverFunctionTest');
            if (flexCheckLiverFunctionTest.prop('checked')) {
                flexCheckLiverFunctionTest = flexCheckLiverFunctionTest.next('label').text().trim();
            } else {
                flexCheckLiverFunctionTest = 'not checked';
            }

            // Example for flexCheckSGPTALT
            flexCheckSGPTALT = $('#flexCheckSGPTALT');
            if (flexCheckSGPTALT.prop('checked')) {
                flexCheckSGPTALT = flexCheckSGPTALT.next('label').text().trim();
            } else {
                flexCheckSGPTALT = 'not checked';
            }

            // Example for flexCheckSGOTAST
            flexCheckSGOTAST = $('#flexCheckSGOTAST');
            if (flexCheckSGOTAST.prop('checked')) {
                flexCheckSGOTAST = flexCheckSGOTAST.next('label').text().trim();
            } else {
                flexCheckSGOTAST = 'not checked';
            }

            // Example for flexCheckAlkalinePhosphatesALP
            flexCheckAlkalinePhosphatesALP = $('#flexCheckAlkalinePhosphatesALP');
            if (flexCheckAlkalinePhosphatesALP.prop('checked')) {
                flexCheckAlkalinePhosphatesALP = flexCheckAlkalinePhosphatesALP.next('label').text().trim();
            } else {
                flexCheckAlkalinePhosphatesALP = 'not checked';
            }

            // Example for flexCheckTotalBilirubin
            flexCheckTotalBilirubin = $('#flexCheckTotalBilirubin');
            if (flexCheckTotalBilirubin.prop('checked')) {
                flexCheckTotalBilirubin = flexCheckTotalBilirubin.next('label').text().trim();
            } else {
                flexCheckTotalBilirubin = 'not checked';
            }

            // Example for flexCheckDirectBilirubin
            flexCheckDirectBilirubin = $('#flexCheckDirectBilirubin');
            if (flexCheckDirectBilirubin.prop('checked')) {
                flexCheckDirectBilirubin = flexCheckDirectBilirubin.next('label').text().trim();
            } else {
                flexCheckDirectBilirubin = 'not checked';
            }

            // Example for flexCheckAlbumin
            flexCheckAlbumin = $('#flexCheckAlbumin');
            if (flexCheckAlbumin.prop('checked')) {
                flexCheckAlbumin = flexCheckAlbumin.next('label').text().trim();
            } else {
                flexCheckAlbumin = 'not checked';
            }

            // Example for flexCheckJGlobulin
            flexCheckJGlobulin = $('#flexCheckJGlobulin');
            if (flexCheckJGlobulin.prop('checked')) {
                flexCheckJGlobulin = flexCheckJGlobulin.next('label').text().trim();
            } else {
                flexCheckJGlobulin = 'not checked';
            }

            // Example for flexCheckUrea
            flexCheckUrea = $('#flexCheckUrea');
            if (flexCheckUrea.prop('checked')) {
                flexCheckUrea = flexCheckUrea.next('label').text().trim();
            } else {
                flexCheckUrea = 'not checked';
            }

            // Example for flexCheckCreatinine
            flexCheckCreatinine = $('#flexCheckCreatinine');
            if (flexCheckCreatinine.prop('checked')) {
                flexCheckCreatinine = flexCheckCreatinine.next('label').text().trim();
            } else {
                flexCheckCreatinine = 'not checked';
            }

            // Example for flexCheckUricAcid
            flexCheckUricAcid = $('#flexCheckUricAcid');
            if (flexCheckUricAcid.prop('checked')) {
                flexCheckUricAcid = flexCheckUricAcid.next('label').text().trim();
            } else {
                flexCheckUricAcid = 'not checked';
            }

            // Example for flexCheckSodium
            flexCheckSodium = $('#flexCheckSodium');
            if (flexCheckSodium.prop('checked')) {
                flexCheckSodium = flexCheckSodium.next('label').text().trim();
            } else {
                flexCheckSodium = 'not checked';
            }

            // Example for flexCheckPotassium
            flexCheckPotassium = $('#flexCheckPotassium');
            if (flexCheckPotassium.prop('checked')) {
                flexCheckPotassium = flexCheckPotassium.next('label').text().trim();
            } else {
                flexCheckPotassium = 'not checked';
            }

            // Example for flexCheckChloride
            flexCheckChloride = $('#flexCheckChloride');
            if (flexCheckChloride.prop('checked')) {
                flexCheckChloride = flexCheckChloride.next('label').text().trim();
            } else {
                flexCheckChloride = 'not checked';
            }

            // Example for flexCheckCalcium
            flexCheckCalcium = $('#flexCheckCalcium');
            if (flexCheckCalcium.prop('checked')) {
                flexCheckCalcium = flexCheckCalcium.next('label').text().trim();
            } else {
                flexCheckCalcium = 'not checked';
            }

            // Example for flexCheckPhosphorous
            flexCheckPhosphorous = $('#flexCheckPhosphorous');
            if (flexCheckPhosphorous.prop('checked')) {
                flexCheckPhosphorous = flexCheckPhosphorous.next('label').text().trim();
            } else {
                flexCheckPhosphorous = 'not checked';
            }

            // Example for flexCheckMagnesium
            flexCheckMagnesium = $('#flexCheckMagnesium');
            if (flexCheckMagnesium.prop('checked')) {
                flexCheckMagnesium = flexCheckMagnesium.next('label').text().trim();
            } else {
                flexCheckMagnesium = 'not checked';
            }

            // Example for flexCheckAmylase
            flexCheckAmylase = $('#flexCheckAmylase');
            if (flexCheckAmylase.prop('checked')) {
                flexCheckAmylase = flexCheckAmylase.next('label').text().trim();
            } else {
                flexCheckAmylase = 'not checked';
            }

            // Example for flexCheckProgesteroneFemale
            flexCheckProgesteroneFemale = $('#flexCheckProgesteroneFemale');
            if (flexCheckProgesteroneFemale.prop('checked')) {
                flexCheckProgesteroneFemale = flexCheckProgesteroneFemale.next('label').text().trim();
            } else {
                flexCheckProgesteroneFemale = 'not checked';
            }

            // Example for flexCheckFSH
            flexCheckFSH = $('#flexCheckFSH');
            if (flexCheckFSH.prop('checked')) {
                flexCheckFSH = flexCheckFSH.next('label').text().trim();
            } else {
                flexCheckFSH = 'not checked';
            }

            // Example for flexCheckEstradiol
            flexCheckEstradiol = $('#flexCheckEstradiol');
            if (flexCheckEstradiol.prop('checked')) {
                flexCheckEstradiol = flexCheckEstradiol.next('label').text().trim();
            } else {
                flexCheckEstradiol = 'not checked';
            }

            // Example for flexCheckLH
            flexCheckLH = $('#flexCheckLH');
            if (flexCheckLH.prop('checked')) {
                flexCheckLH = flexCheckLH.next('label').text().trim();
            } else {
                flexCheckLH = 'not checked';
            }

            // Example for flexCheckTestosteroneMale
            flexCheckTestosteroneMale = $('#flexCheckTestosteroneMale');
            if (flexCheckTestosteroneMale.prop('checked')) {
                flexCheckTestosteroneMale = flexCheckTestosteroneMale.next('label').text().trim();
            } else {
                flexCheckTestosteroneMale = 'not checked';
            }

            // Example for flexCheckProlactin
            flexCheckProlactin = $('#flexCheckProlactin');
            if (flexCheckProlactin.prop('checked')) {
                flexCheckProlactin = flexCheckProlactin.next('label').text().trim();
            } else {
                flexCheckProlactin = 'not checked';
            }

            // Example for flexCheckSeminalFluidAnalysis
            flexCheckSeminalFluidAnalysis = $('#flexCheckSeminalFluidAnalysis');
            if (flexCheckSeminalFluidAnalysis.prop('checked')) {
                flexCheckSeminalFluidAnalysis = flexCheckSeminalFluidAnalysis.next('label').text().trim();
            } else {
                flexCheckSeminalFluidAnalysis = 'not checked';
            }

            // Example for flexCheckBHCG
            flexCheckBHCG = $('#flexCheckBHCG');
            if (flexCheckBHCG.prop('checked')) {
                flexCheckBHCG = flexCheckBHCG.next('label').text().trim();
            } else {
                flexCheckBHCG = 'not checked';
            }

            // Example for flexCheckUrineExamination
            flexCheckUrineExamination = $('#flexCheckUrineExamination');
            if (flexCheckUrineExamination.prop('checked')) {
                flexCheckUrineExamination = flexCheckUrineExamination.next('label').text().trim();
            } else {
                flexCheckUrineExamination = 'not checked';
            }

            // Example for flexCheckStoolExamination
            flexCheckStoolExamination = $('#flexCheckStoolExamination');
            if (flexCheckStoolExamination.prop('checked')) {
                flexCheckStoolExamination = flexCheckStoolExamination.next('label').text().trim();
            } else {
                flexCheckStoolExamination = 'not checked';
            }

            // Example for flexCheckHemoglobin
            flexCheckHemoglobin = $('#flexCheckHemoglobin');
            if (flexCheckHemoglobin.prop('checked')) {
                flexCheckHemoglobin = flexCheckHemoglobin.next('label').text().trim();
            } else {
                flexCheckHemoglobin = 'not checked';
            }

            // Example for flexCheckMalaria
            flexCheckMalaria = $('#flexCheckMalaria');
            if (flexCheckMalaria.prop('checked')) {
                flexCheckMalaria = flexCheckMalaria.next('label').text().trim();
            } else {
                flexCheckMalaria = 'not checked';
            }

            // Example for flexCheckESR
            flexCheckESR = $('#flexCheckESR');
            if (flexCheckESR.prop('checked')) {
                flexCheckESR = flexCheckESR.next('label').text().trim();
            } else {
                flexCheckESR = 'not checked';
            }

            // Example for flexCheckBloodGrouping
            flexCheckBloodGrouping = $('#flexCheckBloodGrouping');
            if (flexCheckBloodGrouping.prop('checked')) {
                flexCheckBloodGrouping = flexCheckBloodGrouping.next('label').text().trim();
            } else {
                flexCheckBloodGrouping = 'not checked';
            }

            // Example for flexCheckBloodSugar
            flexCheckBloodSugar = $('#flexCheckBloodSugar');
            if (flexCheckBloodSugar.prop('checked')) {
                flexCheckBloodSugar = flexCheckBloodSugar.next('label').text().trim();
            } else {
                flexCheckBloodSugar = 'not checked';
            }

            // Example for flexCheckCBC
            flexCheckCBC = $('#flexCheckCBC');
            if (flexCheckCBC.prop('checked')) {
                flexCheckCBC = flexCheckCBC.next('label').text().trim();
            } else {
                flexCheckCBC = 'not checked';
            }

            // Example for flexCheckCrossMatching
            flexCheckCrossMatching = $('#flexCheckCrossMatching');
            if (flexCheckCrossMatching.prop('checked')) {
                flexCheckCrossMatching = flexCheckCrossMatching.next('label').text().trim();
            } else {
                flexCheckCrossMatching = 'not checked';
            }

            // Example for flexCheckTPHA
            flexCheckTPHA = $('#flexCheckTPHA');
            if (flexCheckTPHA.prop('checked')) {
                flexCheckTPHA = flexCheckTPHA.next('label').text().trim();
            } else {
                flexCheckTPHA = 'not checked';
            }

            // Example for flexCheckHIV
            flexCheckHIV = $('#flexCheckHIV');
            if (flexCheckHIV.prop('checked')) {
                flexCheckHIV = flexCheckHIV.next('label').text().trim();
            } else {
                flexCheckHIV = 'not checked';
            }

            // Example for flexCheckHBV
            flexCheckHBV = $('#flexCheckHBV');
            if (flexCheckHBV.prop('checked')) {
                flexCheckHBV = flexCheckHBV.next('label').text().trim();
            } else {
                flexCheckHBV = 'not checked';
            }

            // Example for flexCheckHCV
            flexCheckHCV = $('#flexCheckHCV');
            if (flexCheckHCV.prop('checked')) {
                flexCheckHCV = flexCheckHCV.next('label').text().trim();
            } else {
                flexCheckHCV = 'not checked';
            }

            // Example for flexCheckBrucellaMelitensis
            flexCheckBrucellaMelitensis = $('#flexCheckBrucellaMelitensis');
            if (flexCheckBrucellaMelitensis.prop('checked')) {
                flexCheckBrucellaMelitensis = flexCheckBrucellaMelitensis.next('label').text().trim();
            } else {
                flexCheckBrucellaMelitensis = 'not checked';
            }

            // Example for flexCheckBrucellaAbortus
            flexCheckBrucellaAbortus = $('#flexCheckBrucellaAbortus');
            if (flexCheckBrucellaAbortus.prop('checked')) {
                flexCheckBrucellaAbortus = flexCheckBrucellaAbortus.next('label').text().trim();
            } else {
                flexCheckBrucellaAbortus = 'not checked';
            }

            // Example for flexCheckCRP
            flexCheckCRP = $('#flexCheckCRP');
            if (flexCheckCRP.prop('checked')) {
                flexCheckCRP = flexCheckCRP.next('label').text().trim();
            } else {
                flexCheckCRP = 'not checked';
            }

            // Example for flexCheckRF
            flexCheckRF = $('#flexCheckRF');
            if (flexCheckRF.prop('checked')) {
                flexCheckRF = flexCheckRF.next('label').text().trim();
            } else {
                flexCheckRF = 'not checked';
            }

            // Example for flexCheckASO
            flexCheckASO = $('#flexCheckASO');
            if (flexCheckASO.prop('checked')) {
                flexCheckASO = flexCheckASO.next('label').text().trim();
            } else {
                flexCheckASO = 'not checked';
            }















            // Example for flexCheckToxoplasmosis
            flexCheckToxoplasmosis = $('#flexCheckToxoplasmosis');
            if (flexCheckToxoplasmosis.prop('checked')) {
                flexCheckToxoplasmosis = flexCheckToxoplasmosis.next('label').text().trim();

            } else {
                flexCheckToxoplasmosis = 'not checked';
            }

            // Example for flexCheckHpyloriAntibody
            flexCheckHpyloriAntibody = $('#flexCheckHpyloriAntibody');
            if (flexCheckHpyloriAntibody.prop('checked')) {
                flexCheckHpyloriAntibody = flexCheckHpyloriAntibody.next('label').text().trim();

            } else {
                flexCheckHpyloriAntibody = 'not checked';
            }

            // Example for flexCheckStoolOccultBlood
            flexCheckStoolOccultBlood = $('#flexCheckStoolOccultBlood');
            if (flexCheckStoolOccultBlood.prop('checked')) {
                flexCheckStoolOccultBlood = flexCheckStoolOccultBlood.next('label').text().trim();

            } else {
                flexCheckStoolOccultBlood = 'not checked';
            }

            // Example for flexCheckGeneralStoolExamination
            flexCheckGeneralStoolExamination = $('#flexCheckGeneralStoolExamination');
            if (flexCheckGeneralStoolExamination.prop('checked')) {
                flexCheckGeneralStoolExamination = flexCheckGeneralStoolExamination.next('label').text().trim();

            } else {
                flexCheckGeneralStoolExamination = 'not checked';
            }

            // Example for flexCheckThyroidProfile
            flexCheckThyroidProfile = $('#flexCheckThyroidProfile');
            if (flexCheckThyroidProfile.prop('checked')) {
                flexCheckThyroidProfile = flexCheckThyroidProfile.next('label').text().trim();

            } else {
                flexCheckThyroidProfile = 'not checked';
            }

            // Example for flexCheckT3
            flexCheckT3 = $('#flexCheckT3');
            if (flexCheckT3.prop('checked')) {
                flexCheckT3 = flexCheckT3.next('label').text().trim();

            } else {
                flexCheckT3 = 'not checked';
            }


            // Example for flexCheckT4
            flexCheckT4 = $('#flexCheckT4');
            if (flexCheckT4.prop('checked')) {
                flexCheckT4 = flexCheckT4.next('label').text().trim();

            } else {
                flexCheckT4 = 'not checked';
            }


            // Example for flexCheckTSH
            flexCheckTSH = $('#flexCheckTSH');
            if (flexCheckTSH.prop('checked')) {
                flexCheckTSH = flexCheckTSH.next('label').text().trim();
            } else {
                flexCheckTSH = 'not checked';
            }

            // Example for flexCheckSpermExamination
            flexCheckSpermExamination = $('#flexCheckSpermExamination');
            if (flexCheckSpermExamination.prop('checked')) {
                flexCheckSpermExamination = flexCheckSpermExamination.next('label').text().trim();
            } else {
                flexCheckSpermExamination = 'not checked';
            }

            // Example for flexCheckVirginalSwab
            flexCheckVirginalSwab = $('#flexCheckVirginalSwab');
            if (flexCheckVirginalSwab.prop('checked')) {
                flexCheckVirginalSwab = flexCheckVirginalSwab.next('label').text().trim();
            } else {
                flexCheckVirginalSwab = 'not checked';
            }

            // Example for flexCheckTrichomonasVirginals
            flexCheckTrichomonasVirginals = $('#flexCheckTrichomonasVirginals');
            if (flexCheckTrichomonasVirginals.prop('checked')) {
                flexCheckTrichomonasVirginals = flexCheckTrichomonasVirginals.next('label').text().trim();
            } else {
                flexCheckTrichomonasVirginals = 'not checked';
            }

            // Example for flexCheckHCG
            flexCheckHCG = $('#flexCheckHCG');
            if (flexCheckHCG.prop('checked')) {
                flexCheckHCG = flexCheckHCG.next('label').text().trim();
            } else {
                flexCheckHCG = 'not checked';
            }

            // Example for flexCheckGeneralHealthCheck
            flexCheckGeneralHealthCheck = $('#flexCheckGeneralHealthCheck');
            if (flexCheckGeneralHealthCheck.prop('checked')) {
                flexCheckGeneralHealthCheck = flexCheckGeneralHealthCheck.next('label').text().trim();
            } else {
                flexCheckGeneralHealthCheck = 'not checked';
            }

            // Example for flexCheckECG
            flexCheckECG = $('#flexCheckECG');
            if (flexCheckECG.prop('checked')) {
                flexCheckECG = flexCheckECG.next('label').text().trim();
            } else {
                flexCheckECG = 'not checked';
            }

            // Example for flexCheckXRay
            flexCheckXRay = $('#flexCheckXRay');
            if (flexCheckXRay.prop('checked')) {
                flexCheckXRay = flexCheckXRay.next('label').text().trim();
            } else {
                flexCheckXRay = 'not checked';
            }

            // Example for flexCheckUltrasound
            flexCheckUltrasound = $('#flexCheckUltrasound');
            if (flexCheckUltrasound.prop('checked')) {
                flexCheckUltrasound = flexCheckUltrasound.next('label').text().trim();
            } else {
                flexCheckUltrasound = 'not checked';
            }

            // Example for flexCheckCTScan
            flexCheckCTScan = $('#flexCheckCTScan');
            if (flexCheckCTScan.prop('checked')) {
                flexCheckCTScan = flexCheckCTScan.next('label').text().trim();
            } else {
                flexCheckCTScan = 'not checked';
            }

            // Example for flexCheckMRI
            flexCheckMRI = $('#flexCheckMRI');
            if (flexCheckMRI.prop('checked')) {
                flexCheckMRI = flexCheckMRI.next('label').text().trim();
            } else {
                flexCheckMRI = 'not checked';
            }

            // Example for flexCheckCardiacEvaluation
            flexCheckCardiacEvaluation = $('#flexCheckCardiacEvaluation');
            if (flexCheckCardiacEvaluation.prop('checked')) {
                flexCheckCardiacEvaluation = flexCheckCardiacEvaluation.next('label').text().trim();
            } else {
                flexCheckCardiacEvaluation = 'not checked';
            }

            // Example for flexCheckEEG
            flexCheckEEG = $('#flexCheckEEG');
            if (flexCheckEEG.prop('checked')) {
                flexCheckEEG = flexCheckEEG.next('label').text().trim();
            } else {
                flexCheckEEG = 'not checked';
            }

            // Example for flexCheckEchocardiogram
            flexCheckEchocardiogram = $('#flexCheckEchocardiogram');
            if (flexCheckEchocardiogram.prop('checked')) {
                flexCheckEchocardiogram = flexCheckEchocardiogram.next('label').text().trim();
            } else {
                flexCheckEchocardiogram = 'not checked';
            }

            // Example for flexCheckBoneDensity
            flexCheckBoneDensity = $('#flexCheckBoneDensity');
            if (flexCheckBoneDensity.prop('checked')) {
                flexCheckBoneDensity = flexCheckBoneDensity.next('label').text().trim();
            } else {
                flexCheckBoneDensity = 'not checked';
            }

            // Example for flexCheckMammogram
            flexCheckMammogram = $('#flexCheckMammogram');
            if (flexCheckMammogram.prop('checked')) {
                flexCheckMammogram = flexCheckMammogram.next('label').text().trim();
            } else {
                flexCheckMammogram = 'not checked';
            }

            // Example for flexCheckPAPSmear
            flexCheckPAPSmear = $('#flexCheckPAPSmear');
            if (flexCheckPAPSmear.prop('checked')) {
                flexCheckPAPSmear = flexCheckPAPSmear.next('label').text().trim();
            } else {
                flexCheckPAPSmear = 'not checked';
            }
            // Example for flexCheckPAPSmear
            flexCheckGeneralUrineExamination = $('#flexCheckGeneralUrineExamination');
            if (flexCheckGeneralUrineExamination.prop('checked')) {
                flexCheckGeneralUrineExamination = flexCheckGeneralUrineExamination.next('label').text().trim();
            } else {
                flexCheckGeneralUrineExamination = 'not checked';
            }


            // Example for flexCheckPAPSmear
            flexCheckHemoglobinA1c = $('#flexCheckHemoglobinA1c');
            if (flexCheckHemoglobinA1c.prop('checked')) {
                flexCheckHemoglobinA1c = flexCheckHemoglobinA1c.next('label').text().trim();
            } else {
                flexCheckHemoglobinA1c = 'not checked';
            }


            // Example for flexCheckPAPSmear
            flexCheckFastingBloodSugar = $('#flexCheckFastingBloodSugar');
            if (flexCheckFastingBloodSugar.prop('checked')) {
                flexCheckFastingBloodSugar = flexCheckFastingBloodSugar.next('label').text().trim();
            } else {
                flexCheckFastingBloodSugar = 'not checked';
            }

            // Example for flexCheckPAPSmear
            flexCheckHpyloriAgStool = $('#flexCheckHpyloriAgStool');
            if (flexCheckHpyloriAgStool.prop('checked')) {
                flexCheckHpyloriAgStool = flexCheckHpyloriAgStool.next('label').text().trim();
            } else {
                flexCheckHpyloriAgStool = 'not checked';
            }


            // Example for flexCheckPAPSmear
            flexCheckTyphoid = $('#flexCheckTyphoid');
            if (flexCheckTyphoid.prop('checked')) {
                flexCheckTyphoid = flexCheckTyphoid.next('label').text().trim();
            } else {
                flexCheckTyphoid = 'not checked';
            }



            var id = parseInt($("#label2").html());

            var presc = $("#labid").val();

            $.ajax({
                url: 'assingxray.aspx/submitdata',
                data: "{'id':'" + id + "', 'presc':'" + presc + "','flexCheckDirectBilirubin':'" + flexCheckDirectBilirubin + "','flexCheckGeneralUrineExamination':'" + flexCheckGeneralUrineExamination + "','flexCheckProgesteroneFemale':'" + flexCheckProgesteroneFemale + "','flexCheckAmylase':'" + flexCheckAmylase + "','flexCheckMagnesium':'" + flexCheckMagnesium + "','flexCheckPhosphorous':'" + flexCheckPhosphorous + "','flexCheckCalcium':'" + flexCheckCalcium + "','flexCheckChloride':'" + flexCheckChloride + "','flexCheckPotassium':'" + flexCheckPotassium + "','flexCheckSodium':'" + flexCheckSodium + "','flexCheckUricAcid':'" + flexCheckUricAcid + "','flexCheckCreatinine':'" + flexCheckCreatinine + "','flexCheckUrea':'" + flexCheckUrea + "','flexCheckJGlobulin':'" + flexCheckJGlobulin + "','flexCheckAlbumin':'" + flexCheckAlbumin + "','flexCheckTotalBilirubin':'" + flexCheckTotalBilirubin + "','flexCheckAlkalinePhosphatesALP':'" + flexCheckAlkalinePhosphatesALP + "','flexCheckSGOTAST':'" + flexCheckSGOTAST + "','flexCheckSGPTALT':'" + flexCheckSGPTALT + "','flexCheckLiverFunctionTest':'" + flexCheckLiverFunctionTest + "','flexCheckTriglycerides':'" + flexCheckTriglycerides + "','flexCheckTotalCholesterol':'" + flexCheckTotalCholesterol + "','flexCheckHemoglobinA1c':'" + flexCheckHemoglobinA1c + "','flexCheckHDL':'" + flexCheckHDL + "','flexCheckLDL':'" + flexCheckLDL + "','flexCheckFSH':'" + flexCheckFSH + "','flexCheckEstradiol':'" + flexCheckEstradiol + "','flexCheckLH':'" + flexCheckLH + "','flexCheckTestosteroneMale':'" + flexCheckTestosteroneMale + "','flexCheckProlactin':'" + flexCheckProlactin + "','flexCheckSeminalFluidAnalysis':'" + flexCheckSeminalFluidAnalysis + "','flexCheckBHCG':'" + flexCheckBHCG + "','flexCheckUrineExamination':'" + flexCheckUrineExamination + "','flexCheckStoolExamination':'" + flexCheckStoolExamination + "','flexCheckHemoglobin':'" + flexCheckHemoglobin + "','flexCheckMalaria':'" + flexCheckMalaria + "','flexCheckESR':'" + flexCheckESR + "','flexCheckBloodGrouping':'" + flexCheckBloodGrouping + "','flexCheckBloodSugar':'" + flexCheckBloodSugar + "','flexCheckCBC':'" + flexCheckCBC + "','flexCheckCrossMatching':'" + flexCheckCrossMatching + "','flexCheckTPHA':'" + flexCheckTPHA + "','flexCheckHIV':'" + flexCheckHIV + "','flexCheckHBV':'" + flexCheckHBV + "','flexCheckHCV':'" + flexCheckHCV + "','flexCheckBrucellaMelitensis':'" + flexCheckBrucellaMelitensis + "','flexCheckBrucellaAbortus':'" + flexCheckBrucellaAbortus + "','flexCheckCRP':'" + flexCheckCRP + "','flexCheckRF':'" + flexCheckRF + "','flexCheckASO':'" + flexCheckASO + "','flexCheckToxoplasmosis':'" + flexCheckToxoplasmosis + "','flexCheckTyphoid':'" + flexCheckTyphoid + "','flexCheckHpyloriAntibody':'" + flexCheckHpyloriAntibody + "','flexCheckStoolOccultBlood':'" + flexCheckStoolOccultBlood + "','flexCheckGeneralStoolExamination':'" + flexCheckGeneralStoolExamination + "','flexCheckThyroidProfile':'" + flexCheckThyroidProfile + "','flexCheckT3':'" + flexCheckT3 + "','flexCheckT4':'" + flexCheckT4 + "','flexCheckTSH':'" + flexCheckTSH + "','flexCheckSpermExamination':'" + flexCheckSpermExamination + "','flexCheckVirginalSwab':'" + flexCheckVirginalSwab + "','flexCheckTrichomonasVirginals':'" + flexCheckTrichomonasVirginals + "','flexCheckHCG':'" + flexCheckHCG + "','flexCheckHpyloriAgStool':'" + flexCheckHpyloriAgStool + "','flexCheckFastingBloodSugar':'" + flexCheckFastingBloodSugar + "' }",
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
                        $('#staticBackdrop11').modal('hide');
                        // Uncheck radio2 and other checkboxes
                        radio21.checked = false;
                        additionalTests.classList.add('hidden');
                        // Uncheck all checkboxes with the class 'custom-checkbox'
                        document.querySelectorAll('.custom-checkbox').forEach(checkbox => {
                            checkbox.checked = false;
                        });
                        // Call the function on document ready
                        $(document).ready(function () {
                            loadData();
                        })
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
        function isAnyCheckboxChecked() {
            return document.querySelectorAll('.custom-checkbox:checked').length > 0;
        }

        radio2.addEventListener('change', toggleAdditionalTests);
        submitButton.addEventListener('click', function (event) {
            event.preventDefault(); // Prevent form submission if inside a form
            callAjaxFunction();
        });

        // Initially set the controls to hidden and value to 0
        toggleAdditionalTests();


    });


    
    function callAjaxFunction() {

        var flexCheckHDL, flexCheckLDL, flexCheckTotalCholesterol, flexCheckTriglycerides, flexCheckLiverFunctionTest, flexCheckSGPTALT, flexCheckSGOTAST, flexCheckAlkalinePhosphatesALP, flexCheckTotalBilirubin, flexCheckDirectBilirubin, flexCheckAlbumin, flexCheckJGlobulin, flexCheckUrea, flexCheckCreatinine, flexCheckUricAcid, flexCheckSodium, flexCheckPotassium, flexCheckChloride, flexCheckCalcium, flexCheckPhosphorous, flexCheckMagnesium, flexCheckAmylase, flexCheckProgesteroneFemale, flexCheckFSH, flexCheckEstradiol, flexCheckLH, flexCheckTestosteroneMale, flexCheckProlactin, flexCheckSeminalFluidAnalysis, flexCheckBHCG, flexCheckUrineExamination, flexCheckStoolExamination, flexCheckHemoglobin, flexCheckMalaria, flexCheckESR, flexCheckBloodGrouping, flexCheckBloodSugar, flexCheckCBC, flexCheckCrossMatching, flexCheckTPHA, flexCheckHIV, flexCheckHBV, flexCheckHCV, flexCheckBrucellaMelitensis, flexCheckBrucellaAbortus, flexCheckCRP, flexCheckRF, flexCheckASO, flexCheckToxoplasmosis, flexCheckTyphoid, flexCheckHpyloriAntibody, flexCheckStoolOccultBlood, flexCheckGeneralStoolExamination, flexCheckThyroidProfile, flexCheckT3, flexCheckT4, flexCheckTSH, flexCheckSpermExamination, flexCheckVirginalSwab, flexCheckTrichomonasVirginals, flexCheckHCG, flexCheckHpyloriAgStool, flexCheckFastingBloodSugar, flexCheckHemoglobinA1c, flexCheckGeneralUrineExamination;
        // Example for flexCheckHDL
        flexCheckHDL = $('#flexCheckHDL');
        if (flexCheckHDL.prop('checked')) {
            flexCheckHDL = flexCheckHDL.next('label').text().trim();
        } else {
            flexCheckHDL = 'not checked';
        }

        // Example for flexCheckLDL
        flexCheckLDL = $('#flexCheckLDL');
        if (flexCheckLDL.prop('checked')) {
            flexCheckLDL = flexCheckLDL.next('label').text().trim();
        } else {
            flexCheckLDL = 'not checked';
        }

        // Example for flexCheckTotalCholesterol
        flexCheckTotalCholesterol = $('#flexCheckTotalCholesterol');
        if (flexCheckTotalCholesterol.prop('checked')) {
            flexCheckTotalCholesterol = flexCheckTotalCholesterol.next('label').text().trim();
        } else {
            flexCheckTotalCholesterol = 'not checked';
        }

        // Example for flexCheckTriglycerides
        flexCheckTriglycerides = $('#flexCheckTriglycerides');
        if (flexCheckTriglycerides.prop('checked')) {
            flexCheckTriglycerides = flexCheckTriglycerides.next('label').text().trim();
        } else {
            flexCheckTriglycerides = 'not checked';
        }

        // Example for flexCheckLiverFunctionTest
        flexCheckLiverFunctionTest = $('#flexCheckLiverFunctionTest');
        if (flexCheckLiverFunctionTest.prop('checked')) {
            flexCheckLiverFunctionTest = flexCheckLiverFunctionTest.next('label').text().trim();
        } else {
            flexCheckLiverFunctionTest = 'not checked';
        }

        // Example for flexCheckSGPTALT
        flexCheckSGPTALT = $('#flexCheckSGPTALT');
        if (flexCheckSGPTALT.prop('checked')) {
            flexCheckSGPTALT = flexCheckSGPTALT.next('label').text().trim();
        } else {
            flexCheckSGPTALT = 'not checked';
        }

        // Example for flexCheckSGOTAST
        flexCheckSGOTAST = $('#flexCheckSGOTAST');
        if (flexCheckSGOTAST.prop('checked')) {
            flexCheckSGOTAST = flexCheckSGOTAST.next('label').text().trim();
        } else {
            flexCheckSGOTAST = 'not checked';
        }

        // Example for flexCheckAlkalinePhosphatesALP
        flexCheckAlkalinePhosphatesALP = $('#flexCheckAlkalinePhosphatesALP');
        if (flexCheckAlkalinePhosphatesALP.prop('checked')) {
            flexCheckAlkalinePhosphatesALP = flexCheckAlkalinePhosphatesALP.next('label').text().trim();
        } else {
            flexCheckAlkalinePhosphatesALP = 'not checked';
        }

        // Example for flexCheckTotalBilirubin
        flexCheckTotalBilirubin = $('#flexCheckTotalBilirubin');
        if (flexCheckTotalBilirubin.prop('checked')) {
            flexCheckTotalBilirubin = flexCheckTotalBilirubin.next('label').text().trim();
        } else {
            flexCheckTotalBilirubin = 'not checked';
        }

        // Example for flexCheckDirectBilirubin
        flexCheckDirectBilirubin = $('#flexCheckDirectBilirubin');
        if (flexCheckDirectBilirubin.prop('checked')) {
            flexCheckDirectBilirubin = flexCheckDirectBilirubin.next('label').text().trim();
        } else {
            flexCheckDirectBilirubin = 'not checked';
        }

        // Example for flexCheckAlbumin
        flexCheckAlbumin = $('#flexCheckAlbumin');
        if (flexCheckAlbumin.prop('checked')) {
            flexCheckAlbumin = flexCheckAlbumin.next('label').text().trim();
        } else {
            flexCheckAlbumin = 'not checked';
        }

        // Example for flexCheckJGlobulin
        flexCheckJGlobulin = $('#flexCheckJGlobulin');
        if (flexCheckJGlobulin.prop('checked')) {
            flexCheckJGlobulin = flexCheckJGlobulin.next('label').text().trim();
        } else {
            flexCheckJGlobulin = 'not checked';
        }

        // Example for flexCheckUrea
        flexCheckUrea = $('#flexCheckUrea');
        if (flexCheckUrea.prop('checked')) {
            flexCheckUrea = flexCheckUrea.next('label').text().trim();
        } else {
            flexCheckUrea = 'not checked';
        }

        // Example for flexCheckCreatinine
        flexCheckCreatinine = $('#flexCheckCreatinine');
        if (flexCheckCreatinine.prop('checked')) {
            flexCheckCreatinine = flexCheckCreatinine.next('label').text().trim();
        } else {
            flexCheckCreatinine = 'not checked';
        }

        // Example for flexCheckUricAcid
        flexCheckUricAcid = $('#flexCheckUricAcid');
        if (flexCheckUricAcid.prop('checked')) {
            flexCheckUricAcid = flexCheckUricAcid.next('label').text().trim();
        } else {
            flexCheckUricAcid = 'not checked';
        }

        // Example for flexCheckSodium
        flexCheckSodium = $('#flexCheckSodium');
        if (flexCheckSodium.prop('checked')) {
            flexCheckSodium = flexCheckSodium.next('label').text().trim();
        } else {
            flexCheckSodium = 'not checked';
        }

        // Example for flexCheckPotassium
        flexCheckPotassium = $('#flexCheckPotassium');
        if (flexCheckPotassium.prop('checked')) {
            flexCheckPotassium = flexCheckPotassium.next('label').text().trim();
        } else {
            flexCheckPotassium = 'not checked';
        }

        // Example for flexCheckChloride
        flexCheckChloride = $('#flexCheckChloride');
        if (flexCheckChloride.prop('checked')) {
            flexCheckChloride = flexCheckChloride.next('label').text().trim();
        } else {
            flexCheckChloride = 'not checked';
        }

        // Example for flexCheckCalcium
        flexCheckCalcium = $('#flexCheckCalcium');
        if (flexCheckCalcium.prop('checked')) {
            flexCheckCalcium = flexCheckCalcium.next('label').text().trim();
        } else {
            flexCheckCalcium = 'not checked';
        }

        // Example for flexCheckPhosphorous
        flexCheckPhosphorous = $('#flexCheckPhosphorous');
        if (flexCheckPhosphorous.prop('checked')) {
            flexCheckPhosphorous = flexCheckPhosphorous.next('label').text().trim();
        } else {
            flexCheckPhosphorous = 'not checked';
        }

        // Example for flexCheckMagnesium
        flexCheckMagnesium = $('#flexCheckMagnesium');
        if (flexCheckMagnesium.prop('checked')) {
            flexCheckMagnesium = flexCheckMagnesium.next('label').text().trim();
        } else {
            flexCheckMagnesium = 'not checked';
        }

        // Example for flexCheckAmylase
        flexCheckAmylase = $('#flexCheckAmylase');
        if (flexCheckAmylase.prop('checked')) {
            flexCheckAmylase = flexCheckAmylase.next('label').text().trim();
        } else {
            flexCheckAmylase = 'not checked';
        }

        // Example for flexCheckProgesteroneFemale
        flexCheckProgesteroneFemale = $('#flexCheckProgesteroneFemale');
        if (flexCheckProgesteroneFemale.prop('checked')) {
            flexCheckProgesteroneFemale = flexCheckProgesteroneFemale.next('label').text().trim();
        } else {
            flexCheckProgesteroneFemale = 'not checked';
        }

        // Example for flexCheckFSH
        flexCheckFSH = $('#flexCheckFSH');
        if (flexCheckFSH.prop('checked')) {
            flexCheckFSH = flexCheckFSH.next('label').text().trim();
        } else {
            flexCheckFSH = 'not checked';
        }

        // Example for flexCheckEstradiol
        flexCheckEstradiol = $('#flexCheckEstradiol');
        if (flexCheckEstradiol.prop('checked')) {
            flexCheckEstradiol = flexCheckEstradiol.next('label').text().trim();
        } else {
            flexCheckEstradiol = 'not checked';
        }

        // Example for flexCheckLH
        flexCheckLH = $('#flexCheckLH');
        if (flexCheckLH.prop('checked')) {
            flexCheckLH = flexCheckLH.next('label').text().trim();
        } else {
            flexCheckLH = 'not checked';
        }

        // Example for flexCheckTestosteroneMale
        flexCheckTestosteroneMale = $('#flexCheckTestosteroneMale');
        if (flexCheckTestosteroneMale.prop('checked')) {
            flexCheckTestosteroneMale = flexCheckTestosteroneMale.next('label').text().trim();
        } else {
            flexCheckTestosteroneMale = 'not checked';
        }

        // Example for flexCheckProlactin
        flexCheckProlactin = $('#flexCheckProlactin');
        if (flexCheckProlactin.prop('checked')) {
            flexCheckProlactin = flexCheckProlactin.next('label').text().trim();
        } else {
            flexCheckProlactin = 'not checked';
        }

        // Example for flexCheckSeminalFluidAnalysis
        flexCheckSeminalFluidAnalysis = $('#flexCheckSeminalFluidAnalysis');
        if (flexCheckSeminalFluidAnalysis.prop('checked')) {
            flexCheckSeminalFluidAnalysis = flexCheckSeminalFluidAnalysis.next('label').text().trim();
        } else {
            flexCheckSeminalFluidAnalysis = 'not checked';
        }

        // Example for flexCheckBHCG
        flexCheckBHCG = $('#flexCheckBHCG');
        if (flexCheckBHCG.prop('checked')) {
            flexCheckBHCG = flexCheckBHCG.next('label').text().trim();
        } else {
            flexCheckBHCG = 'not checked';
        }

        // Example for flexCheckUrineExamination
        flexCheckUrineExamination = $('#flexCheckUrineExamination');
        if (flexCheckUrineExamination.prop('checked')) {
            flexCheckUrineExamination = flexCheckUrineExamination.next('label').text().trim();
        } else {
            flexCheckUrineExamination = 'not checked';
        }

        // Example for flexCheckStoolExamination
        flexCheckStoolExamination = $('#flexCheckStoolExamination');
        if (flexCheckStoolExamination.prop('checked')) {
            flexCheckStoolExamination = flexCheckStoolExamination.next('label').text().trim();
        } else {
            flexCheckStoolExamination = 'not checked';
        }

        // Example for flexCheckHemoglobin
        flexCheckHemoglobin = $('#flexCheckHemoglobin');
        if (flexCheckHemoglobin.prop('checked')) {
            flexCheckHemoglobin = flexCheckHemoglobin.next('label').text().trim();
        } else {
            flexCheckHemoglobin = 'not checked';
        }

        // Example for flexCheckMalaria
        flexCheckMalaria = $('#flexCheckMalaria');
        if (flexCheckMalaria.prop('checked')) {
            flexCheckMalaria = flexCheckMalaria.next('label').text().trim();
        } else {
            flexCheckMalaria = 'not checked';
        }

        // Example for flexCheckESR
        flexCheckESR = $('#flexCheckESR');
        if (flexCheckESR.prop('checked')) {
            flexCheckESR = flexCheckESR.next('label').text().trim();
        } else {
            flexCheckESR = 'not checked';
        }

        // Example for flexCheckBloodGrouping
        flexCheckBloodGrouping = $('#flexCheckBloodGrouping');
        if (flexCheckBloodGrouping.prop('checked')) {
            flexCheckBloodGrouping = flexCheckBloodGrouping.next('label').text().trim();
        } else {
            flexCheckBloodGrouping = 'not checked';
        }

        // Example for flexCheckBloodSugar
        flexCheckBloodSugar = $('#flexCheckBloodSugar');
        if (flexCheckBloodSugar.prop('checked')) {
            flexCheckBloodSugar = flexCheckBloodSugar.next('label').text().trim();
        } else {
            flexCheckBloodSugar = 'not checked';
        }

        // Example for flexCheckCBC
        flexCheckCBC = $('#flexCheckCBC');
        if (flexCheckCBC.prop('checked')) {
            flexCheckCBC = flexCheckCBC.next('label').text().trim();
        } else {
            flexCheckCBC = 'not checked';
        }

        // Example for flexCheckCrossMatching
        flexCheckCrossMatching = $('#flexCheckCrossMatching');
        if (flexCheckCrossMatching.prop('checked')) {
            flexCheckCrossMatching = flexCheckCrossMatching.next('label').text().trim();
        } else {
            flexCheckCrossMatching = 'not checked';
        }

        // Example for flexCheckTPHA
        flexCheckTPHA = $('#flexCheckTPHA');
        if (flexCheckTPHA.prop('checked')) {
            flexCheckTPHA = flexCheckTPHA.next('label').text().trim();
        } else {
            flexCheckTPHA = 'not checked';
        }

        // Example for flexCheckHIV
        flexCheckHIV = $('#flexCheckHIV');
        if (flexCheckHIV.prop('checked')) {
            flexCheckHIV = flexCheckHIV.next('label').text().trim();
        } else {
            flexCheckHIV = 'not checked';
        }

        // Example for flexCheckHBV
        flexCheckHBV = $('#flexCheckHBV');
        if (flexCheckHBV.prop('checked')) {
            flexCheckHBV = flexCheckHBV.next('label').text().trim();
        } else {
            flexCheckHBV = 'not checked';
        }

        // Example for flexCheckHCV
        flexCheckHCV = $('#flexCheckHCV');
        if (flexCheckHCV.prop('checked')) {
            flexCheckHCV = flexCheckHCV.next('label').text().trim();
        } else {
            flexCheckHCV = 'not checked';
        }

        // Example for flexCheckBrucellaMelitensis
        flexCheckBrucellaMelitensis = $('#flexCheckBrucellaMelitensis');
        if (flexCheckBrucellaMelitensis.prop('checked')) {
            flexCheckBrucellaMelitensis = flexCheckBrucellaMelitensis.next('label').text().trim();
        } else {
            flexCheckBrucellaMelitensis = 'not checked';
        }

        // Example for flexCheckBrucellaAbortus
        flexCheckBrucellaAbortus = $('#flexCheckBrucellaAbortus');
        if (flexCheckBrucellaAbortus.prop('checked')) {
            flexCheckBrucellaAbortus = flexCheckBrucellaAbortus.next('label').text().trim();
        } else {
            flexCheckBrucellaAbortus = 'not checked';
        }

        // Example for flexCheckCRP
        flexCheckCRP = $('#flexCheckCRP');
        if (flexCheckCRP.prop('checked')) {
            flexCheckCRP = flexCheckCRP.next('label').text().trim();
        } else {
            flexCheckCRP = 'not checked';
        }

        // Example for flexCheckRF
        flexCheckRF = $('#flexCheckRF');
        if (flexCheckRF.prop('checked')) {
            flexCheckRF = flexCheckRF.next('label').text().trim();
        } else {
            flexCheckRF = 'not checked';
        }

        // Example for flexCheckASO
        flexCheckASO = $('#flexCheckASO');
        if (flexCheckASO.prop('checked')) {
            flexCheckASO = flexCheckASO.next('label').text().trim();
        } else {
            flexCheckASO = 'not checked';
        }















        // Example for flexCheckToxoplasmosis
        flexCheckToxoplasmosis = $('#flexCheckToxoplasmosis');
        if (flexCheckToxoplasmosis.prop('checked')) {
            flexCheckToxoplasmosis = flexCheckToxoplasmosis.next('label').text().trim();

        } else {
            flexCheckToxoplasmosis = 'not checked';
        }

        // Example for flexCheckHpyloriAntibody
        flexCheckHpyloriAntibody = $('#flexCheckHpyloriAntibody');
        if (flexCheckHpyloriAntibody.prop('checked')) {
            flexCheckHpyloriAntibody = flexCheckHpyloriAntibody.next('label').text().trim();

        } else {
            flexCheckHpyloriAntibody = 'not checked';
        }

        // Example for flexCheckStoolOccultBlood
        flexCheckStoolOccultBlood = $('#flexCheckStoolOccultBlood');
        if (flexCheckStoolOccultBlood.prop('checked')) {
            flexCheckStoolOccultBlood = flexCheckStoolOccultBlood.next('label').text().trim();

        } else {
            flexCheckStoolOccultBlood = 'not checked';
        }

        // Example for flexCheckGeneralStoolExamination
        flexCheckGeneralStoolExamination = $('#flexCheckGeneralStoolExamination');
        if (flexCheckGeneralStoolExamination.prop('checked')) {
            flexCheckGeneralStoolExamination = flexCheckGeneralStoolExamination.next('label').text().trim();

        } else {
            flexCheckGeneralStoolExamination = 'not checked';
        }

        // Example for flexCheckThyroidProfile
        flexCheckThyroidProfile = $('#flexCheckThyroidProfile');
        if (flexCheckThyroidProfile.prop('checked')) {
            flexCheckThyroidProfile = flexCheckThyroidProfile.next('label').text().trim();

        } else {
            flexCheckThyroidProfile = 'not checked';
        }

        // Example for flexCheckT3
        flexCheckT3 = $('#flexCheckT3');
        if (flexCheckT3.prop('checked')) {
            flexCheckT3 = flexCheckT3.next('label').text().trim();

        } else {
            flexCheckT3 = 'not checked';
        }


        // Example for flexCheckT4
        flexCheckT4 = $('#flexCheckT4');
        if (flexCheckT4.prop('checked')) {
            flexCheckT4 = flexCheckT4.next('label').text().trim();

        } else {
            flexCheckT4 = 'not checked';
        }


        // Example for flexCheckTSH
        flexCheckTSH = $('#flexCheckTSH');
        if (flexCheckTSH.prop('checked')) {
            flexCheckTSH = flexCheckTSH.next('label').text().trim();
        } else {
            flexCheckTSH = 'not checked';
        }

        // Example for flexCheckSpermExamination
        flexCheckSpermExamination = $('#flexCheckSpermExamination');
        if (flexCheckSpermExamination.prop('checked')) {
            flexCheckSpermExamination = flexCheckSpermExamination.next('label').text().trim();
        } else {
            flexCheckSpermExamination = 'not checked';
        }

        // Example for flexCheckVirginalSwab
        flexCheckVirginalSwab = $('#flexCheckVirginalSwab');
        if (flexCheckVirginalSwab.prop('checked')) {
            flexCheckVirginalSwab = flexCheckVirginalSwab.next('label').text().trim();
        } else {
            flexCheckVirginalSwab = 'not checked';
        }

        // Example for flexCheckTrichomonasVirginals
        flexCheckTrichomonasVirginals = $('#flexCheckTrichomonasVirginals');
        if (flexCheckTrichomonasVirginals.prop('checked')) {
            flexCheckTrichomonasVirginals = flexCheckTrichomonasVirginals.next('label').text().trim();
        } else {
            flexCheckTrichomonasVirginals = 'not checked';
        }

        // Example for flexCheckHCG
        flexCheckHCG = $('#flexCheckHCG');
        if (flexCheckHCG.prop('checked')) {
            flexCheckHCG = flexCheckHCG.next('label').text().trim();
        } else {
            flexCheckHCG = 'not checked';
        }

        // Example for flexCheckGeneralHealthCheck
        flexCheckGeneralHealthCheck = $('#flexCheckGeneralHealthCheck');
        if (flexCheckGeneralHealthCheck.prop('checked')) {
            flexCheckGeneralHealthCheck = flexCheckGeneralHealthCheck.next('label').text().trim();
        } else {
            flexCheckGeneralHealthCheck = 'not checked';
        }

        // Example for flexCheckECG
        flexCheckECG = $('#flexCheckECG');
        if (flexCheckECG.prop('checked')) {
            flexCheckECG = flexCheckECG.next('label').text().trim();
        } else {
            flexCheckECG = 'not checked';
        }

        // Example for flexCheckXRay
        flexCheckXRay = $('#flexCheckXRay');
        if (flexCheckXRay.prop('checked')) {
            flexCheckXRay = flexCheckXRay.next('label').text().trim();
        } else {
            flexCheckXRay = 'not checked';
        }

        // Example for flexCheckUltrasound
        flexCheckUltrasound = $('#flexCheckUltrasound');
        if (flexCheckUltrasound.prop('checked')) {
            flexCheckUltrasound = flexCheckUltrasound.next('label').text().trim();
        } else {
            flexCheckUltrasound = 'not checked';
        }

        // Example for flexCheckCTScan
        flexCheckCTScan = $('#flexCheckCTScan');
        if (flexCheckCTScan.prop('checked')) {
            flexCheckCTScan = flexCheckCTScan.next('label').text().trim();
        } else {
            flexCheckCTScan = 'not checked';
        }

        // Example for flexCheckMRI
        flexCheckMRI = $('#flexCheckMRI');
        if (flexCheckMRI.prop('checked')) {
            flexCheckMRI = flexCheckMRI.next('label').text().trim();
        } else {
            flexCheckMRI = 'not checked';
        }

        // Example for flexCheckCardiacEvaluation
        flexCheckCardiacEvaluation = $('#flexCheckCardiacEvaluation');
        if (flexCheckCardiacEvaluation.prop('checked')) {
            flexCheckCardiacEvaluation = flexCheckCardiacEvaluation.next('label').text().trim();
        } else {
            flexCheckCardiacEvaluation = 'not checked';
        }

        // Example for flexCheckEEG
        flexCheckEEG = $('#flexCheckEEG');
        if (flexCheckEEG.prop('checked')) {
            flexCheckEEG = flexCheckEEG.next('label').text().trim();
        } else {
            flexCheckEEG = 'not checked';
        }

        // Example for flexCheckEchocardiogram
        flexCheckEchocardiogram = $('#flexCheckEchocardiogram');
        if (flexCheckEchocardiogram.prop('checked')) {
            flexCheckEchocardiogram = flexCheckEchocardiogram.next('label').text().trim();
        } else {
            flexCheckEchocardiogram = 'not checked';
        }

        // Example for flexCheckBoneDensity
        flexCheckBoneDensity = $('#flexCheckBoneDensity');
        if (flexCheckBoneDensity.prop('checked')) {
            flexCheckBoneDensity = flexCheckBoneDensity.next('label').text().trim();
        } else {
            flexCheckBoneDensity = 'not checked';
        }

        // Example for flexCheckMammogram
        flexCheckMammogram = $('#flexCheckMammogram');
        if (flexCheckMammogram.prop('checked')) {
            flexCheckMammogram = flexCheckMammogram.next('label').text().trim();
        } else {
            flexCheckMammogram = 'not checked';
        }

        // Example for flexCheckPAPSmear
        flexCheckPAPSmear = $('#flexCheckPAPSmear');
        if (flexCheckPAPSmear.prop('checked')) {
            flexCheckPAPSmear = flexCheckPAPSmear.next('label').text().trim();
        } else {
            flexCheckPAPSmear = 'not checked';
        }
        // Example for flexCheckPAPSmear
        flexCheckGeneralUrineExamination = $('#flexCheckGeneralUrineExamination');
        if (flexCheckGeneralUrineExamination.prop('checked')) {
            flexCheckGeneralUrineExamination = flexCheckGeneralUrineExamination.next('label').text().trim();
        } else {
            flexCheckGeneralUrineExamination = 'not checked';
        }


        // Example for flexCheckPAPSmear
        flexCheckHemoglobinA1c = $('#flexCheckHemoglobinA1c');
        if (flexCheckHemoglobinA1c.prop('checked')) {
            flexCheckHemoglobinA1c = flexCheckHemoglobinA1c.next('label').text().trim();
        } else {
            flexCheckHemoglobinA1c = 'not checked';
        }


        // Example for flexCheckPAPSmear
        flexCheckFastingBloodSugar = $('#flexCheckFastingBloodSugar');
        if (flexCheckFastingBloodSugar.prop('checked')) {
            flexCheckFastingBloodSugar = flexCheckFastingBloodSugar.next('label').text().trim();
        } else {
            flexCheckFastingBloodSugar = 'not checked';
        }

        // Example for flexCheckPAPSmear
        flexCheckHpyloriAgStool = $('#flexCheckHpyloriAgStool');
        if (flexCheckHpyloriAgStool.prop('checked')) {
            flexCheckHpyloriAgStool = flexCheckHpyloriAgStool.next('label').text().trim();
        } else {
            flexCheckHpyloriAgStool = 'not checked';
        }


        // Example for flexCheckPAPSmear
        flexCheckTyphoid = $('#flexCheckTyphoid');
        if (flexCheckTyphoid.prop('checked')) {
            flexCheckTyphoid = flexCheckTyphoid.next('label').text().trim();
        } else {
            flexCheckTyphoid = 'not checked';
        }





        var id = $("#medid").val();


        $.ajax({
            url: 'lap_operation.aspx/updateLabTest',
            data: "{'id':'" + id + "','flexCheckDirectBilirubin':'" + flexCheckDirectBilirubin + "','flexCheckGeneralUrineExamination':'" + flexCheckGeneralUrineExamination + "','flexCheckProgesteroneFemale':'" + flexCheckProgesteroneFemale + "','flexCheckAmylase':'" + flexCheckAmylase + "','flexCheckMagnesium':'" + flexCheckMagnesium + "','flexCheckPhosphorous':'" + flexCheckPhosphorous + "','flexCheckCalcium':'" + flexCheckCalcium + "','flexCheckChloride':'" + flexCheckChloride + "','flexCheckPotassium':'" + flexCheckPotassium + "','flexCheckSodium':'" + flexCheckSodium + "','flexCheckUricAcid':'" + flexCheckUricAcid + "','flexCheckCreatinine':'" + flexCheckCreatinine + "','flexCheckUrea':'" + flexCheckUrea + "','flexCheckJGlobulin':'" + flexCheckJGlobulin + "','flexCheckAlbumin':'" + flexCheckAlbumin + "','flexCheckTotalBilirubin':'" + flexCheckTotalBilirubin + "','flexCheckAlkalinePhosphatesALP':'" + flexCheckAlkalinePhosphatesALP + "','flexCheckSGOTAST':'" + flexCheckSGOTAST + "','flexCheckSGPTALT':'" + flexCheckSGPTALT + "','flexCheckLiverFunctionTest':'" + flexCheckLiverFunctionTest + "','flexCheckTriglycerides':'" + flexCheckTriglycerides + "','flexCheckTotalCholesterol':'" + flexCheckTotalCholesterol + "','flexCheckHemoglobinA1c':'" + flexCheckHemoglobinA1c + "','flexCheckHDL':'" + flexCheckHDL + "','flexCheckLDL':'" + flexCheckLDL + "','flexCheckFSH':'" + flexCheckFSH + "','flexCheckEstradiol':'" + flexCheckEstradiol + "','flexCheckLH':'" + flexCheckLH + "','flexCheckTestosteroneMale':'" + flexCheckTestosteroneMale + "','flexCheckProlactin':'" + flexCheckProlactin + "','flexCheckSeminalFluidAnalysis':'" + flexCheckSeminalFluidAnalysis + "','flexCheckBHCG':'" + flexCheckBHCG + "','flexCheckUrineExamination':'" + flexCheckUrineExamination + "','flexCheckStoolExamination':'" + flexCheckStoolExamination + "','flexCheckHemoglobin':'" + flexCheckHemoglobin + "','flexCheckMalaria':'" + flexCheckMalaria + "','flexCheckESR':'" + flexCheckESR + "','flexCheckBloodGrouping':'" + flexCheckBloodGrouping + "','flexCheckBloodSugar':'" + flexCheckBloodSugar + "','flexCheckCBC':'" + flexCheckCBC + "','flexCheckCrossMatching':'" + flexCheckCrossMatching + "','flexCheckTPHA':'" + flexCheckTPHA + "','flexCheckHIV':'" + flexCheckHIV + "','flexCheckHBV':'" + flexCheckHBV + "','flexCheckHCV':'" + flexCheckHCV + "','flexCheckBrucellaMelitensis':'" + flexCheckBrucellaMelitensis + "','flexCheckBrucellaAbortus':'" + flexCheckBrucellaAbortus + "','flexCheckCRP':'" + flexCheckCRP + "','flexCheckRF':'" + flexCheckRF + "','flexCheckASO':'" + flexCheckASO + "','flexCheckToxoplasmosis':'" + flexCheckToxoplasmosis + "','flexCheckTyphoid':'" + flexCheckTyphoid + "','flexCheckHpyloriAntibody':'" + flexCheckHpyloriAntibody + "','flexCheckStoolOccultBlood':'" + flexCheckStoolOccultBlood + "','flexCheckGeneralStoolExamination':'" + flexCheckGeneralStoolExamination + "','flexCheckThyroidProfile':'" + flexCheckThyroidProfile + "','flexCheckT3':'" + flexCheckT3 + "','flexCheckT4':'" + flexCheckT4 + "','flexCheckTSH':'" + flexCheckTSH + "','flexCheckSpermExamination':'" + flexCheckSpermExamination + "','flexCheckVirginalSwab':'" + flexCheckVirginalSwab + "','flexCheckTrichomonasVirginals':'" + flexCheckTrichomonasVirginals + "','flexCheckHCG':'" + flexCheckHCG + "','flexCheckHpyloriAgStool':'" + flexCheckHpyloriAgStool + "','flexCheckFastingBloodSugar':'" + flexCheckFastingBloodSugar + "' }",
            contentType: 'application/json; charset=utf-8',

            dataType: 'json',
            type: 'POST',
            success: function (response) {
                console.log(response);


                $('#staticBackdrop11').modal('hide');

                Swal.fire(
                    'Successfully Updated !',
                    'You have added a new lab details!',
                    'success'
                )



            },
            error: function (response) {
                alert(response.responseText);
            }
        });


    }

    function showlab() {

        var prescid = $("#labid").val();

        event.preventDefault()

        document.getElementById('submitButton5').style.display = 'inline-block';
        document.getElementById('submitButton7').style.display = 'none';

        document.getElementById('updateButton').style.display = 'none';
        document.getElementById('submitButton').style.display = 'inline-block';

        // Show the modal
        $('#staticBackdrop11').modal('show');

    }

    function sendxray() {
        document.getElementById('submitButton5').style.display = 'inline-block';
        document.getElementById('submitButton7').style.display = 'none';

   

        event.preventDefault()



        // Show the modal
        $('#staticBackdrop9').modal('show');

    }




    function updatexry() {
        var prescid = $("#id9").val();
        document.getElementById('submitButton7').style.display = 'inline-block';
        document.getElementById('submitButton5').style.display = 'none';

        event.preventDefault()

        $.ajax({
            url: 'assignmed.aspx/xrydata',
            data: JSON.stringify({ prescid: prescid }),
            dataType: "json",
            type: 'POST',
            contentType: "application/json",
            success: function (response) {
                console.log(response);

                if (response.d && response.d.length > 0) {
                    var data = response.d[0];
                    var xrynameInput = document.getElementById('xrayname');
                    var xrydescribtionInput = document.getElementById('inst');
                    var xrytype = document.getElementById('typeimg');// Updated to use the textarea's ID

                    // Ensure elements exist
                    if (xrynameInput && xrydescribtionInput && xrytype) {
                        // Show the hidden elements
                        $('#xrayDetails').removeClass('hidden');
                        $('#xraySpecial').removeClass('hidden');
                        $('#xraySpecial5').removeClass('hidden');

                        // Set their values
                        xrynameInput.value = data.xryname;
                        xrytype.value = data.type;
                        xrydescribtionInput.value = data.xrydescribtion;
                    } else {
                        console.log("Elements not found");
                    }
                } else {
                    console.log("No data found in response");
                }
            },
            error: function (response) {
                alert(response.responseText);
            }
        });


  
        // Show the modal
        $('#staticBackdrop9').modal('show');
    }













    document.addEventListener('DOMContentLoaded', function () {
        const radio = document.getElementById('radio');
        const xrayDetails = document.getElementById('xrayDetails');
        const xraySpecial = document.getElementById('xraySpecial');

        function toggleXrayDetails() {
            if (radio.checked) {
                radio.value = "1";
                xrayDetails.classList.remove('hidden');
                xraySpecial.classList.remove('hidden');
            } else {
                radio.value = "0";
                xrayDetails.classList.add('hidden');
                xraySpecial.classList.add('hidden');
            }
        }

        radio.addEventListener('change', toggleXrayDetails);

        // Initially set the controls to hidden and value to 0
        toggleXrayDetails();
    });





    document.addEventListener('DOMContentLoaded', function () {
        const radio = document.getElementById('radio');
        const xrayDetails = document.getElementById('xrayDetails');
        const xraySpecial = document.getElementById('xraySpecial');

        function toggleXrayDetails() {
            if (radio.checked) {
                radio.value = "1";
                xrayDetails.classList.remove('hidden');
                xraySpecial.classList.remove('hidden');
            } else {
                radio.value = "0";
                xrayDetails.classList.add('hidden');
                xraySpecial.classList.add('hidden');
            }
        }

        radio.addEventListener('change', toggleXrayDetails);

        function callxray() {
            if (!radio.checked) {
                alert("Please ensure radio");
                return;
            }

            const xrname = document.getElementById('xrayname').value;
            const xrydescribtion = document.getElementById('inst').value;

            var typeimg = $("#typeimg").val();
            var id = $("#id9").val();

            $.ajax({
                url: 'assingxray.aspx/submitxray',
                data: "{'xrname':'" + xrname + "','xrydescribtion':'" + xrydescribtion + "','id':'" + id + "','typeimg':'" + typeimg + "'}",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                type: 'POST',
                success: function (response) {
                    console.log(response);
                    if (response.d === 'true') {
                        Swal.fire(
                            'Successfully Saved!',
                            'You added a new image details!',
                            'success'
                        );
                        // Uncheck radio2 and other checkboxes
                        radio.checked = false;
                        xrayDetails.classList.add('hidden');
                        xraySpecial.classList.add('hidden');
                        // Uncheck all checkboxes with the class 'custom-checkbox'

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


        radio.addEventListener('change', toggleXrayDetails);
        submitButton5.addEventListener('click', function (event) {
            event.preventDefault(); // Prevent form submission if inside a form
            callxray();
        });

        toggleXrayDetails();

    });






















    function editlab() {
        // Show the update button and hide the submit button
        document.getElementById('updateButton').style.display = 'inline-block';
        document.getElementById('submitButton').style.display = 'none';
        
        
        event.preventDefault();

        var prescid = $("#labid").val();
        var search = parseInt($("#label2").html());


        $.ajax({
            type: "POST",
            url: "lap_operation.aspx/getlapprocessed",
            data: JSON.stringify({ prescid: prescid, search: search }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                console.log(response);
                uncheckAllCheckboxes();
                // Access the nested data
                var data = response.d[0];
                document.getElementById('medid').value = data.med_id;
                ;
                // Iterate over each property in the data
                for (var key in data) {
                    if (data.hasOwnProperty(key)) {
                        var checkboxId = getCheckboxId(key);
                        var isChecked = data[key] !== "not checked";
                  
                        // Find the checkbox element by id
                        var checkbox = document.getElementById(checkboxId);
                    
                        if (checkbox) {
                            checkbox.checked = isChecked;
                        }
                    }
                }
            },
            error: function (response) {
                alert(response.responseText);
            }
        });

        // Function to uncheck all checkboxes
        function uncheckAllCheckboxes() {
            var checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(function (checkbox) {
                checkbox.checked = false;
            });
        }


        //// Function to map data keys to checkbox IDs
        //function getCheckboxId(dataKey) {
        //    switch (dataKey) {
        //        case "Albumin": return "flexCheckAlbumin1";
        //        case "Alkaline_phosphates_ALP": return "flexCheckAlkalinePhosphatesALP1";
        //        case "Amylase": return "flexCheckAmylase1";
        //        case "Antistreptolysin_O_ASO": return "flexCheckASO1";
        //        case "Blood_grouping": return "flexCheckBloodGrouping1";
        //        case "Blood_sugar": return "flexCheckBloodSugar1";
        //        case "Brucella_abortus": return "flexCheckBrucellaAbortus1";
        //        case "Brucella_melitensis": return "flexCheckBrucellaMelitensis1";
        //        case "CBC": return "flexCheckCBC1";
        //        case "C_reactive_protein_CRP": return "flexCheckCRP1";
        //        case "Calcium": return "flexCheckCalcium1";
        //        case "Chloride": return "flexCheckChloride1";
        //        case "Creatinine": return "flexCheckCreatinine1";
        //        case "Cross_matching": return "flexCheckCrossMatching1";
        //        case "Direct_bilirubin": return "flexCheckDirectBilirubin";
        //        case "ESR": return "flexCheckESR1";
        //        case "Estradiol": return "flexCheckEstradiol1";
        //        case "Fasting_blood_sugar": return "flexCheckFastingBloodSugar1";
        //        case "Follicle_stimulating_hormone_FSH": return "flexCheckFSH1";
        //        case "General_stool_examination": return "flexCheckGeneralStoolExamination1";
        //        case "General_urine_examination": return "flexCheckGeneralUrineExamination1";
        //        case "Hemoglobin": return "flexCheckHemoglobin1";
        //        case "Hemoglobin_A1c": return "flexCheckHemoglobinA1c1";
        //        case "Hepatitis_B_virus_HBV": return "flexCheckHBV1";
        //        case "Hepatitis_C_virus_HCV": return "flexCheckHCV1";
        //        case "High_density_lipoprotein_HDL": return "flexCheckHDL1";
        //        case "Hpylori_Ag_stool": return "flexCheckHpyloriAgStool1";
        //        case "Hpylori_antibody": return "flexCheckHpyloriAntibody1";
        //        case "Human_chorionic_gonadotropin_hCG": return "flexCheckHCG1";
        //        case "Human_immune_deficiency_HIV": return "flexCheckHIV1";
        //        case "JGlobulin": return "flexCheckJGlobulin1";
        //        case "Low_density_lipoprotein_LDL": return "flexCheckLDL1";
        //        case "Luteinizing_hormone_LH": return "flexCheckLH1";
        //        case "Magnesium": return "flexCheckMagnesium1";
        //        case "Malaria": return "flexCheckMalaria1";
        //        case "Phosphorous": return "flexCheckPhosphorous1";
        //        case "Potassium": return "flexCheckPotassium1";
        //        case "Progesterone_Female": return "flexCheckProgesteroneFemale1";
        //        case "Prolactin": return "flexCheckProlactin1";
        //        case "Rheumatoid_factor_RF": return "flexCheckRF1";
        //        case "SGOT_AST": return "flexCheckSGOTAST1";
        //        case "SGPT_ALT": return "flexCheckSGPTALT1";
        //        case "Seminal_Fluid_Analysis_Male_B_HCG": return "flexCheckSeminalFluidAnalysis1";
        //        case "Sodium": return "flexCheckSodium1";
        //        case "Sperm_examination": return "flexCheckSpermExamination1";
        //        case "Stool_examination": return "flexCheckStoolExamination1";
        //        case "Stool_occult_blood": return "flexCheckStoolOccultBlood1";
        //        case "TPHA": return "flexCheckTPHA1";
        //        case "Testosterone_Male": return "flexCheckTestosteroneMale1";
        //        case "Thyroid_profile": return "flexCheckThyroidProfile1";
        //        case "Thyroid_stimulating_hormone_TSH": return "flexCheckTSH1";
        //        case "Thyroxine_T4": return "flexCheckT41";
        //        case "Total_bilirubin": return "flexCheckTotalBilirubin1";
        //        case "Total_cholesterol": return "flexCheckTotalCholesterol1";
        //        case "Toxoplasmosis": return "flexCheckToxoplasmosis1";
        //        case "Triglycerides": return "flexCheckTriglycerides1";
        //        case "Triiodothyronine_T3": return "flexCheckT31";
        //        case "Typhoid_hCG": return "flexCheckTyphoid1";
        //        case "Urea": return "flexCheckUrea1";
        //        case "Uric_acid": return "flexCheckUricAcid1";
        //        case "Urine_examination": return "flexCheckUrineExamination1";
        //        case "Virginal_swab_trichomonas_virginals": return "flexCheckTrichomonasVirginals1";
        //        // Add more mappings as needed
        //        default: return null;
        //    }
        //}


        // Show the modal



        // Function to map data keys to checkbox IDs
        function getCheckboxId(dataKey) {
            switch (dataKey) {
                case "Albumin": return "flexCheckAlbumin";
                case "Alkaline_phosphates_ALP": return "flexCheckAlkalinePhosphatesALP";
                case "Amylase": return "flexCheckAmylase";
                case "Antistreptolysin_O_ASO": return "flexCheckASO";
                case "Blood_grouping": return "flexCheckBloodGrouping";
                case "Blood_sugar": return "flexCheckBloodSugar";
                case "Brucella_abortus": return "flexCheckBrucellaAbortus";
                case "Brucella_melitensis": return "flexCheckBrucellaMelitensis";
                case "CBC": return "flexCheckCBC";
                case "C_reactive_protein_CRP": return "flexCheckCRP";
                case "Calcium": return "flexCheckCalcium";
                case "Chloride": return "flexCheckChloride";
                case "Creatinine": return "flexCheckCreatinine";
                case "Cross_matching": return "flexCheckCrossMatching";
                case "Direct_bilirubin": return "flexCheckDirectBilirubin";
                case "ESR": return "flexCheckESR";
                case "Estradiol": return "flexCheckEstradiol";
                case "Fasting_blood_sugar": return "flexCheckFastingBloodSugar";
                case "Follicle_stimulating_hormone_FSH": return "flexCheckFSH";
                case "General_stool_examination": return "flexCheckGeneralStoolExamination";
                case "General_urine_examination": return "flexCheckGeneralUrineExamination";
                case "Hemoglobin": return "flexCheckHemoglobin";
                case "Hemoglobin_A1c": return "flexCheckHemoglobinA1c";
                case "Hepatitis_B_virus_HBV": return "flexCheckHBV";
                case "Hepatitis_C_virus_HCV": return "flexCheckHCV";
                case "High_density_lipoprotein_HDL": return "flexCheckHDL";
                case "Hpylori_Ag_stool": return "flexCheckHpyloriAgStool";
                case "Hpylori_antibody": return "flexCheckHpyloriAntibody";
                case "Human_chorionic_gonadotropin_hCG": return "flexCheckHCG";
                case "Human_immune_deficiency_HIV": return "flexCheckHIV";
                case "JGlobulin": return "flexCheckJGlobulin";
                case "Low_density_lipoprotein_LDL": return "flexCheckLDL";
                case "Luteinizing_hormone_LH": return "flexCheckLH";
                case "Magnesium": return "flexCheckMagnesium";
                case "Malaria": return "flexCheckMalaria";
                case "Phosphorous": return "flexCheckPhosphorous";
                case "Potassium": return "flexCheckPotassium";
                case "Progesterone_Female": return "flexCheckProgesteroneFemale";
                case "Prolactin": return "flexCheckProlactin";
                case "Rheumatoid_factor_RF": return "flexCheckRF";
                case "SGOT_AST": return "flexCheckSGOTAST";
                case "SGPT_ALT": return "flexCheckSGPTALT";
                case "Seminal_Fluid_Analysis_Male_B_HCG": return "flexCheckSeminalFluidAnalysis";
                case "Sodium": return "flexCheckSodium";
                case "Sperm_examination": return "flexCheckSpermExamination";
                case "Stool_examination": return "flexCheckStoolExamination";
                case "Stool_occult_blood": return "flexCheckStoolOccultBlood";
                case "TPHA": return "flexCheckTPHA";
                case "Testosterone_Male": return "flexCheckTestosteroneMale";
                case "Thyroid_profile": return "flexCheckThyroidProfile";
                case "Thyroid_stimulating_hormone_TSH": return "flexCheckTSH";
                case "Thyroxine_T4": return "flexCheckT4";
                case "Total_bilirubin": return "flexCheckTotalBilirubin";
                case "Total_cholesterol": return "flexCheckTotalCholesterol";
                case "Toxoplasmosis": return "flexCheckToxoplasmosis";
                case "Triglycerides": return "flexCheckTriglycerides";
                case "Triiodothyronine_T3": return "flexCheckT3";
                case "Typhoid_hCG": return "flexCheckTyphoid";
                case "Urea": return "flexCheckUrea";
                case "Uric_acid": return "flexCheckUricAcid";
                case "Urine_examination": return "flexCheckUrineExamination";
                case "Virginal_swab_trichomonas_virginals": return "flexCheckTrichomonasVirginals";
                // Add more mappings as needed
                default: return null;
            }
        }



        $('#staticBackdrop11').modal('show');

    }










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

                        + "<td style='border: 1px solid #000; padding: 5px;'>" + response.d[i].med_name + "</td>"
                        + "<td style='border: 1px solid #000; padding: 5px;'>" + response.d[i].dosage + "</td>"
                        + "<td style='border: 1px solid #000; padding: 5px;'>" + response.d[i].frequency + "</td>"
                        + "<td style='border: 1px solid #000; padding: 5px;'>" + response.d[i].duration + "</td>"
                        + "<td style='border: 1px solid #000; padding: 5px;'>" + response.d[i].special_inst + "</td>"
                        + "<td><button class='edit1-btn btn btn-success' data-id='" + response.d[i].medid + "'>edit</button></td>"


                        + "</tr>"
                    );
                }




            },
            error: function (response) {
                alert(response.responseText);
            }
        });

        document.getElementById('updateButton').style.display = 'none';
        document.getElementById('submitButton').style.display = 'inline-block';









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
        var special_inst = $("#inst7").val();
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

        var status = row.find("td:nth-child(12)").text().trim();
        var xrystatus = row.find("td:nth-child(13)").text().trim(); // Trim whitespace
        var xrayid = row.find("td:nth-child(14)").text().trim();

  
        if (status === 'pending-lap') {
            document.getElementById('sendlab').disabled = true;
            document.getElementById('editlab1').disabled = false;
        } else if (status === 'waiting') {
            document.getElementById('sendlab').disabled = false;
            document.getElementById('editlab1').disabled = true;
        } else if (status === 'processed') {
            document.getElementById('sendlab').disabled = true;
            document.getElementById('editlab1').disabled = true;
        } else if (status === 'lap-processed') {
            document.getElementById('sendlab').disabled = true;
            document.getElementById('editlab1').disabled = true;
        }





        if (xrystatus === 'pending_image') {
            document.getElementById('sendxry').disabled = true;
            document.getElementById('editxry').disabled = false;
        } else if (xrystatus === 'waiting') {
            document.getElementById('sendxry').disabled = false;
            document.getElementById('editxry').disabled = true;
        } else if (xrystatus === 'image_processed') {
            document.getElementById('sendxry').disabled = true;
            document.getElementById('editxry').disabled = true;
        }








        $("#doctor").text(doctor);
        $("#doctor1").text(doctor);
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
        $("#date1").text(formattedToday);
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
        $("#labid").val(prescid);
        $("#editl").val(prescid);
        $("#id9").val(prescid);
        $("#id99").val(xrayid);
        $("#id11").val(prescid);





        $.ajax({
            url: 'assignmed.aspx/xryimage',
            data: JSON.stringify({ 'prescid': prescid }),
            dataType: "json",
            type: 'POST',
            contentType: "application/json",
            success: function (response) {
                console.log(response);


                if (response.d && response.d.length > 0) {
                    var base64Data = response.d[0].image; // Assuming imageData is base64-encoded
                    var image = response.d[0].type;
                    $("#imgtype").text(image);
                    // Update image source directly
                    $("#img").attr('src', 'data:image/jpeg;base64,' + base64Data);
                } else {
                    console.log("No image data found for the given prescid.");
                    // Optionally handle the case where no image data is returned
                }
            },
            error: function (xhr, status, error) {
                console.error("Error fetching image data:", error);
                // Handle errors more gracefully, e.g., display an error message to the user
            }
        });
    

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

                   
                        + "<td style='border: 1px solid #000; padding: 5px;'>" + response.d[i].TestName + "</td>"
                        + "<td style='border: 1px solid #000; padding: 5px;'>" + response.d[i].TestValue + "</td>"
                     
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


    //$(document).ready(function () {
   
     


          

    //    var search = parseInt($("#label2").html());
    //    $.ajax({
    //        url: 'assignmed.aspx/medic',
    //        data: JSON.stringify({ 'search': search }),
    //        dataType: "json",
    //        type: 'POST',
    //        contentType: "application/json",
    //        success: function (response) {
    //            console.log(response);

    //            $("#datatable tbody").empty();

            

    //            for (var i = 0; i < response.d.length; i++) {
               

    //                $("#datatable tbody").append(
    //                    "<tr style='cursor:pointer' onclick='passValue(this)'>" +
    //                    "<td style='display:none'>" + response.d[i].doctorid + "</td>" +
    //                    "<td>" + response.d[i].full_name + "</td>" +
    //                    "<td>" + response.d[i].sex + "</td>" +
    //                    "<td>" + response.d[i].location + "</td>" +
    //                    "<td>" + response.d[i].phone + "</td>" +
    //                    "<td>" + response.d[i].amount + "</td>" +
    //                    "<td>" + response.d[i].dob + "</td>" +
    //                    "<td>" + response.d[i].date_registered + "</td>" +
    //                    "<td style='display:none'>" + response.d[i].doctortitle + "</td>" +
    //                    "<td style='display:none'>" + response.d[i].prescid + "</td>" +
    //                    "<td style='display:none'>" + response.d[i].patientid + "</td>" +
    //                    "<td>" + response.d[i].status + "</td>" +
    //                    "<td>" + response.d[i].xray_status + "</td>" +
    //                    "<td style='display:none'>" + response.d[i].xrayid + "</td>" +
                        

    //                    "<td><button class='edit-btn btn btn-success' data-id='" + response.d[i].prescid + "'>Assign Medication</button></td>" +
    //                    "</tr>"
    //                );
    //            }
    //        },
    //        error: function (response) {
    //            alert(response.responseText);
    //        }
    //    });

    //    });
    
     
    // Function to initialize DataTable
    // Function to initialize DataTable
    function initDataTable() {
        var table = $('#datatable').DataTable({
            dom: 'Bfrtip',
            buttons: ['excelHtml5'],
            paging: true,
            pageLength: 10,
            lengthMenu: [10, 25, 50, 100],
            responsive: true
        });
    }

    // Document ready function
    $(document).ready(function () {
        var search = parseInt($("#label2").html());

        // Ajax request to populate the table
        $.ajax({
            url: 'assignmed.aspx/medic',
            data: JSON.stringify({ 'search': search }),
            dataType: "json",
            type: 'POST',
            contentType: "application/json",
            success: function (response) {
                console.log(response);

                // Clear existing tbody content
                $("#datatable tbody").empty();

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

                    $("#datatable tbody").append(
                        "<tr style='cursor:pointer' onclick='passValue(this)'>" +
                        "<td style='display:none;'>" + response.d[i].doctorid + "</td>" +
                        "<td>" + response.d[i].full_name + "</td>" +
                        "<td>" + response.d[i].sex + "</td>" +
                        "<td>" + response.d[i].location + "</td>" +
                        "<td>" + response.d[i].phone + "</td>" +
                        "<td>" + response.d[i].amount + "</td>" +
                        "<td>" + response.d[i].dob + "</td>" +
                        "<td>" + response.d[i].date_registered + "</td>" +
                        "<td style='display:none;'>" + response.d[i].doctortitle + "</td>" +
                        "<td style='display:none;'>" + response.d[i].prescid + "</td>" +
                        "<td style='display:none;'>" + response.d[i].patientid + "</td>" +
                        "<td>" + statusButton + "</td>" +
                        "<td>" + xrayStatusButton + "</td>" +
                        "<td style='display:none;'>" + response.d[i].xrayid + "</td>" +
                        "<td><button class='edit-btn btn btn-success' data-id='" + response.d[i].prescid + "'>Assign Medication</button></td>" +
                        "</tr>"
                    );
                }

                // Initialize DataTable only after table population
                initDataTable();
            },
            error: function (response) {
                alert(response.responseText);
            }
        });

    });



</script>
</asp:Content>
