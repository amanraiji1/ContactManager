
<!--navbar-->
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="index.jsp"> <span class="fa fa-phone"></span> ContactApp</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>


    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#add-contact-modal"> <span class="fa fa-plus "></span> AddContact</a>
            </li>
        </ul>
        <ul class="navbar-nav m-auto">
            <form class="form-inline" action="SearchServlet" method="POST" >
                <input class="form-control mr-sm-2" type="search" placeholder="Search by name" name="search-box"> 
                <button class="btn btn-outline-light" type="submit">Search</button>
            </form>
        </ul>
        <ul class="navbar-nav mr-right">


            <li class="nav-item">
                <a class="nav-link">  <img class="img-fluid" style="width:20px; height:20px; border-radius: 100%;" src="pics/default.png">  <%= user.getName().toLowerCase()%> </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="LogoutServlet"> <span class="fa fa-share-square-o "></span> Logout</a>
            </li>


        </ul>
    </div>
</nav>

<!--end of navbar-->


<!--add contact modal-->

<div class="modal fade" id="add-contact-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header primary-background text-white">
                <h5 class="modal-title" id="exampleModalLabel">Add Contact</h5>
                <button id="close-btn" type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="AddContactServlet" method="POST">


                    <div class="form-group">
                        <input required name="contact-name" type="text" placeholder="Enter name" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <input required name="contact-phone" type="number" placeholder="Enter phone number" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <input name="contact-email" type="email" placeholder="Enter email" class="form-control">
                    </div>


                    <div class="container text-center">
                        <button type="submit" class="btn btn-outline-light primary-background">Add</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>


<!--end of post modal-->
