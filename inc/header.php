
<!--Take Nav bar from Bootstep 5-->
<nav id="nav-bar" class="navbar navbar-expand-lg navbar-light bg-white px-lg-3 py-lg-2 shadow-sm sticky-top">  <!--Nav bar setting-->
    <div class="container-fluid">
        <a class="navbar-brand me-5 fw-bold fs-4 h-font" href="index.php"><?php echo $settings_r['site_title'] ?></a>
        <button class="navbar-toggler shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav m-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link me-3" href="index.php">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link me-3" href="rooms.php">Rooms</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link me-3" href="facilities.php">Facilities</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link me-3" href="contact.php">Contact Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about.php">About</a>
                </li>
            </ul>
            <div class="d-flex">              <!-- import modal for login button p-1-->
                <?php
                    if(isset($_SESSION['login']) && $_SESSION['login']==true)
                    {   
                        $path = USERS_IMG_PATH;
                        echo<<<data
                            <div class="btn-group">
                                <button type="button" class="btn btn-outline-dark shadow-none dropdown-toggle" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
                                    <img src="$path$_SESSION[uPic]" style="width: 25px; height: 25px;" class="me-1 rounded-circle">
                                    $_SESSION[uName]
                                </button>
                                <ul class="dropdown-menu dropdown-menu-lg-end">
                                    <li><a class="dropdown-item" href="profile.php">Profile</a></li>
                                    <li><a class="dropdown-item" href="bookings.php">Bookings</a></li>
                                    <li><a class="dropdown-item" href="logout.php">Logout</a></li>
                                    
                                </ul>
                            </div>
                        data;
                    }
                    else
                    {
                        echo<<<data
                            <button type="button" class="btn btn-outline-dark shadow-none me-lg-2 me-3" data-bs-toggle="modal" data-bs-target="#loginModal">
                                Login
                            </button>
                            <button type="button" class="btn btn-outline-dark shadow-none " data-bs-toggle="modal" data-bs-target="#registerModal">
                                Registration
                            </button>
                        data;
                    }
                ?>
                
            </div>
        </div>
    </div>
</nav>

<!-- import modal for login button -->
<div class="modal fade" id="loginModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="login-form">
                <div class="modal-header">
                    <h5 class="modal-title d-flex align-items-center">
                        <i class="bi bi-person-circle fs-3 me-2"></i> User Login    <!--import web icon style from bootstep5--> 
                    </h5>
                    <button type="reset" class="btn-close shadow-none" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">    <!-- import login from boostep5 (user)-->
                        <label class="form-label">Email / Mobile</label>
                        <input type="text" name="email_mob" required class="form-control shadow-none">
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Password</label>
                        <input type="password" name="pass" required class="form-control shadow-none">
                    </div>
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <button type="submit" class="btn btn-dark shadow-none">LOGIN</button>
                        <button type="button" class="btn text-secondary text-decoration-none shadow-none p-0" data-bs-toggle="modal" data-bs-target="#forgotModal" data-bs-dismiss="modal">
                            Forgot Password?
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- import modal for Registration button-->
<div class="modal fade" id="registerModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="register-form">
                <div class="modal-header">
                    <h5 class="modal-title d-flex align-items-center">
                        <i class="bi bi-person-fill-add fs-3 me-2"></i>  User Registration    <!--import web icon style from bootstep5--> 
                    </h5>
                    <button type="reset" class="btn-close shadow-none" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
                        Note : Your details must match with your ID (NID, Passport, Driving License etc.) that will be required during check-in.
                    </span>
                    <div class="container-fluid">
                        <div class="row">  <!-- Take a container and a row and devide them into two section -->
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Name</label>
                                <input name="name" type="text" class="form-control shadow-none" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Email</label>
                                <input type="email" name="email" id="emailInput" class="form-control shadow-none" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Phone Number</label>
                                <input name="phonenum" type="number" class="form-control shadow-none" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Picture</label>
                                <input name="profile" type="file" accept=".jpg, .jpeg, .png, .wbp" class="form-control shadow-none">
                            </div>
                            <div class="col-md-12 mb-3">
                                <label class="form-label">Address</label>
                                <textarea name="address" class="form-control shadow-none" rows="1" required></textarea>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Password</label>
                                <input name="pass" type="password" class="form-control shadow-none" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Confirm Password</label>
                                <input name="cpass" type="password" class="form-control shadow-none" required>
                            </div>
                        </div>
                    </div>
                    <div class="text-center my-1">
                        <button type="submit" id="valid_btn" class="btn btn-dark shadow-none">REGISTER</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- import modal for forgot button-->
<div class="modal fade" id="forgotModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="forgot-form" onsubmit="return validateForm()">
                <div class="modal-header">
                    <h5 class="modal-title d-flex align-items-center">
                        <i class="bi bi-person-circle fs-3 me-2"></i> Forgot Password    <!--import web icon style from bootstep5--> 
                    </h5>
                </div>
                <div class="modal-body">
                    <span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
                        Note: A link will be sent to your email to reset your password
                    </span>
                    <div class="mb-4">    <!-- import login from boostep5 (user)-->
                        <label class="form-label">Email</label>
                        <input type="email" name="email" required class="form-control shadow-none">
                    </div>
                    <div class="mb-2 text-end">
                        <button type="button" class="btn shadow-none p-0 me-2" data-bs-toggle="modal" data-bs-target="#loginModal" data-bs-dismiss="modal">
                            CANCEL
                        </button>
                        <button type="submit" class="btn btn-dark shadow-none">SEND LINK</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<script>
    var emailInput = document.getElementById('emailInput');
    var submitButton = document.getElementById('valid_btn');

    emailInput.addEventListener('keyup', emailValidation);
    emailInput.addEventListener('keydown', emailValidation);

    function emailValidation() {
      var emailValue = emailInput.value.trim();
      var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      var isGmail = /@gmail\.com$/;

        if (emailPattern.test(emailValue) && isGmail.test(emailValue)) {
        submitButton.removeAttribute('disabled');
        } else {
            submitButton.setAttribute('disabled', 'disabled');
        }
    }
</script>