<?php
require('inc/essentials.php');
adminLogin();

?>

<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Admin Panel - Settings</title>
   <?php require('inc/links.php'); ?>
</head>

<body class="bg-light">

   <!-- =======Admin Dashboard connecting ===== -->

   <?php require('inc/header.php'); ?>

   <div class="container-fluid" id="main-content">
      <div class="row">
         <div class="col-lg-10 ms-auto p-4 overflow-hidden">
            <h3 class="mb-4">SETTINGS</h3>

            <!-- General Settings section Start here -->

            <div class="card border-0 shadow-sm mb-4">
               <div class="card-body">
                  <div class="d-flex align-items-center justify-content-between mb-3">
                     <h5 class="card-title m-0">General Settings</h5>
                     <button type="button" class="btn btn-dark shadow-none btn-sm" data-bs-toggle="modal" data-bs-target="#general-s">
                        <i class="bi bi-pencil-square"></i>Edit
                     </button>
                  </div>
                  <h6 class="card-subtitle mb-1 fw-bold">Site Title</h6>
                  <p class="card-text" id="site_title"></p>
                  <h6 class="card-subtitle mb-1 fw-bold">About Us</h6>
                  <p class="card-text" id="site_about"></p>
               </div>
            </div>

            <!-- General Settings section End here -->

            <!-- ========General Settings modal start here======= -->

            <div class="modal fade" id="general-s" data-bs-backdrop="static" data-bs-keyboard="true" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
               <div class="modal-dialog">
                  <form id="general_s_form">
                     <div class="modal-content">
                        <div class="modal-header">
                           <h5 class="modal-title">General Settings</h5>
                        </div>
                        <div class="modal-body">
                           <div class="mb-3">
                              <label class="form-label fw-bold">Site Title</label>
                              <input type="text" name="site_title" id="site_title_inp" class="form-control shadow-none" required>
                           </div>
                           <div class="mb-3">
                              <label class="form-label fw-bold">About</label>
                              <textarea name="site_about" id="site_about_inp" class="form-control shadow-none" rows="6" required></textarea>
                           </div>
                        </div>
                        <div class="modal-footer">
                           <button type="button" onclick="site_title.value = general_data.site_title, site_about.value = general_data.site_about" class="btn text-secondary shadow-none" data-bs-dismiss="modal">CANCEL</button>
                           <button type="submit" class="btn custom-bg text-white shadow-none">SUBMIT</button>
                        </div>
                     </div>
                  </form>
               </div>
            </div>

            <!-- ========General Settings modlal end here======= -->

            <!-- Shutdown section Start here -->
            <div class="card border-0 shadow-sm mb-4">
               <div class="card-body">
                  <div class="d-flex align-items-center justify-content-between mb-3">
                     <h5 class="card-title m-0">Shutdown WebSite</h5>
                     <div class="form-check form-switch">
                        <form>
                           <input onchange="upd_shutdown(this.value)" class="form-check-input" type="checkbox" id="shutdown-toggle">
                        </form>
                     </div>
                  </div>
                  <p class="card-text">
                     No customers will be allowed to book hotel room, when shutdown mode is turned on.
                  </p>
               </div>
            </div>

            <!-- Shutdown section end here -->

            <!-- Contact details section Start here -->
            <div class="card border-0 shadow-sm mb-4">
               <div class="card-body">
                  <div class="d-flex align-items-center justify-content-between mb-3">
                     <h5 class="card-title m-0">Contacts Settings</h5>
                     <button type="button" class="btn btn-dark shadow-none btn-sm" data-bs-toggle="modal" data-bs-target="#contacts-s">
                        <i class="bi bi-pencil-square"></i>Edit
                     </button>
                  </div>
                  <div class="row">
                     <div class="col-lg-6">
                        <div class="mb-4">
                           <h6 class="card-subtitle mb-1 fw-bold">Address</h6>
                           <p class="card-text" id="address"></p>
                        </div>
                        <div class="mb-4">
                           <h6 class="card-subtitle mb-1 fw-bold">Google Map</h6>
                           <p class="card-text" id="gmap"></p>
                        </div>
                        <div class="mb-4">
                           <h6 class="card-subtitle mb-1 fw-bold">Phone Numbers</h6>
                           <p class="card-text mb-1">
                              <i class="bi-telephone-fill"></i>
                              <span id="ph1"></span>
                           </p>
                           <p class="card-text">
                              <i class="bi-telephone-fill"></i>
                              <span id="ph2"></span>
                           </p>
                        </div>
                        <div class="mb-4">
                           <h6 class="card-subtitle mb-1 fw-bold">E-mail</h6>
                           <p class="card-text" id="email"></p>
                        </div>
                     </div>
                     <div class="col-lg-6">
                        <div class="mb-4">
                           <h6 class="card-subtitle mb-1 fw-bold">Social Links</h6>
                           <p class="card-text mb-1">
                              <i class="bi bi-facebook me-1"></i>
                              <span id="fb"></span>
                           </p>
                           <p class="card-text mb-1">
                              <i class="bi bi-instagram me-1"></i>
                              <span id="insta"></span>
                           </p>
                           <p class="card-text">
                              <i class="bi bi-twitter me-1"></i>
                              <span id="tw"></span>
                           </p>
                        </div>
                        <div class="mb-4">
                           <h6 class="card-subtitle mb-1 fw-bold">iFrame</h6>
                           <iframe id="iframe" class="border p-2 w-100" loading="lazy"></iframe>
                        </div>
                     </div>
                  </div>
               </div>
            </div>

            <!-- Contact details section end here -->

            <!-- ========Contacts details modlal here======= -->

            <div class="modal fade" id="contacts-s" data-bs-backdrop="static" data-bs-keyboard="true" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
               <div class="modal-dialog modal-lg">
                  <form id="contacts_s_form">
                     <div class="modal-content">
                        <div class="modal-header">
                           <h5 class="modal-title">Contacts Settings</h5>
                        </div>
                        <div class="modal-body">
                           <div class="container-fluid p-0">
                              <div class="row">
                                 <div class="col-md-6">
                                    <div class="mb-3">
                                       <label class="form-label fw-bold">Address</label>
                                       <input type="text" name="address" id="address_inp" class="form-control shadow-none" required>
                                    </div>
                                    <div class="mb-3">
                                       <label class="form-label fw-bold">Google Map Link</label>
                                       <input type="text" name="gmap" id="gmap_inp" class="form-control shadow-none" required>
                                    </div>
                                    <div class="mb-3">
                                       <label class="form-label fw-bold">Phone Numbers(with country code)</label>
                                       <div class="input-group mb-3">
                                          <span class="input-group-text"><i class="bi bi-telephone-fill"></i></span>
                                          <input type="number" name="pn1" id="pn1_inp" class="form-control shadow-none" required>
                                       </div>
                                       <div class="input-group mb-3">
                                          <span class="input-group-text"><i class="bi bi-telephone-fill"></i></span>
                                          <input type="number" name="pn2" id="pn2_inp" class="form-control shadow-none">
                                       </div>
                                    </div>
                                    <div class="mb-3">
                                       <label class="form-label fw-bold">Email</label>
                                       <input type="email" name="email" id="email_inp" class="form-control shadow-none" required>
                                    </div>
                                 </div>
                                 <!-- social link design -->
                                 <div class="col-md-6">
                                    <div class="mb-3">
                                       <label class="form-label fw-bold">Social Links</label>
                                       <div class="input-group mb-3">
                                          <span class="input-group-text"><i class="bi bi-facebook"></i></span>
                                          <input type="text" name="fb" id="fb_inp" class="form-control shadow-none" required>
                                       </div>
                                       <div class="input-group mb-3">
                                          <span class="input-group-text"><i class="bi bi-instagram"></i></span>
                                          <input type="text" name="insta" id="insta_inp" class="form-control shadow-none" required>
                                       </div>
                                       <div class="input-group mb-3">
                                          <span class="input-group-text"><i class="bi bi-twitter"></i></span>
                                          <input type="text" name="tw" id="tw_inp" class="form-control shadow-none">
                                       </div>
                                    </div>
                                    <div class="mb-3">
                                       <label class="form-label fw-bold">iFrame Src</label>
                                       <input type="text" name="iframe" id="iframe_inp" class="form-control shadow-none" required>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="modal-footer">
                           <button type="button" onclick="contacts_inp(contacts_data)" class="btn text-secondary shadow-none" data-bs-dismiss="modal">CANCEL</button>
                           <button type="submit" class="btn custom-bg text-white shadow-none">SUBMIT</button>
                        </div>
                     </div>
                  </form>
               </div>
            </div>

            <!-- ========Contacts details modlal end here======= -->

            <!-- Management Team section Start here -->

            <div class="card border-0 shadow-sm mb-4">
               <div class="card-body">
                  <div class="d-flex align-items-center justify-content-between mb-3">
                     <h5 class="card-title m-0">Management Team</h5>
                     <button type="button" class="btn btn-dark shadow-none btn-sm" data-bs-toggle="modal" data-bs-target="#team-s">
                        <i class="bi bi-plus-square"></i> Add
                     </button>
                  </div>
                  <!-- content -->

                  <div class="row" id="team-data">
                  </div>

               </div>
            </div>
            <!-- Management Team section end -->

            <!-- ========Management Team modlal start here======= -->
            <div class="modal fade" id="team-s" data-bs-backdrop="static" data-bs-keyboard="true" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
               <div class="modal-dialog">
                  <form id="team_s_form">
                     <div class="modal-content">
                        <div class="modal-header">
                           <h5 class="modal-title">Add Team Member</h5>
                        </div>
                        <div class="modal-body">
                           <div class="mb-3">
                              <label class="form-label fw-bold">Name</label>
                              <input type="text" name="member_name" id="member_name_inp" class="form-control shadow-none" required>
                           </div>
                           <div class="mb-3">
                              <label class="form-label fw-bold">Picture</label>
                              <input type="file" name="member_picture" id="member_picture_inp" accept=".jpg, .png, .webp, .jpeg" class="form-control shadow-none" required>
                           </div>
                        </div>
                        <div class="modal-footer">
                           <button type="button" onclick="member_name.value='', member_picture.value=''" class="btn text-secondary shadow-none" data-bs-dismiss="modal">CANCEL</button>
                           <button type="submit" class="btn custom-bg text-white shadow-none">SUBMIT</button>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
            <!-- ========Management Team modlal end here======= -->

         </div>
      </div>
   </div>

   <?php require('inc/scripts.php') ?>
   <script src="scripts/settings.js"></script>

   

</body>

</html>