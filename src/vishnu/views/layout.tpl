
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Vishnu | Opinionated PaaS layer for Kubernetes</title>

    <!-- Bootstrap Core CSS -->
    <link href="/static/template/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/static/template/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/static/template/sb-admin-2/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="/static/template/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/static/template/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Vishnu</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>

                        <li>
                            <a href="/createapplist"><i class="fa fa-files-o fa-fw"></i> Create App</a>
                        </li>

                        <li>
                            <a href="/applications"><i class="fa fa-laptop fa-fw"></i> Applications </a>
                        </li>

                        <li>
                            <a href="/viewcluster"><i class="fa fa-cloud fa-fw"></i> My Cluster</a>
                        </li>

                        <li>
                            <a href="/dockerregistry"><i class="fa fa-dropbox fa-fw"></i> Docker Registery</a>
                        </li>

                        <li>
                            <a href="/githubrepo"><i class="fa fa-github fa-fw"></i> Github Repo (TBD)</a>
                        </li>

                        <li>
                            <a href="/blank"><i class="fa fa-youtube-play fa-fw"></i> Pipeline (TBD)</a>
                        </li>

                        <li>
                            <a href="/blank"><i class="fa fa-youtube-play fa-fw"></i> Environments (TBD)</a> 
                        </li>

                        <li>
                            <a href="/settings"><i class="fa fa-cog fa-fw"></i> Settings (TBD)</a> 
                        </li>
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
        
		     {{template "content" .}}

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/static/template/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/static/template/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/static/template/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="/static/template/raphael/raphael.min.js"></script>
    <script src="/static/template/morrisjs/morris.min.js"></script>
    <script src="/static/template/morrisjs/morris-sample-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/static/template/sb-admin-2/js/sb-admin-2.js"></script>

</body>

</html>
