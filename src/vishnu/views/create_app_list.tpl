{{ template "layout.tpl" . }}


{{ define "content" }}
           <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Build and Deploy an Application</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>

            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-support fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">13</div>
                                    <div>Nginx</div>
                                </div>
                            </div>
                        </div>
                        <a href="/createappform?apptype=nginx&dockerimage=nginx">
                            <div class="panel-footer">
                                <span class="pull-left">Nginx</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-cloud fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">12</div>
                                    <div>Node App</div>
                                </div>
                            </div>
                        </div>
                        <a href="/create/nodeapp">
                            <div class="panel-footer">
                                <span class="pull-left">Node (TBD)</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-database fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">124</div>
                                    <div>Mongo Db</div>
                                </div>
                            </div>
                        </div>
                        <a href="/create/mongodb">
                            <div class="panel-footer">
                                <span class="pull-left">Mongo DB (TBD)</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-shield fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">26</div>
                                    <div>Mean Stack</div>
                                </div>
                            </div>
                        </div>
                        <a href="/create/meanapp">
                            <div class="panel-footer">
                                <span class="pull-left">Mongo Express Angular Node (TBD)</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>                
            </div>
            <!-- /.row -->


           <div class="row">
                <div class="col-lg-12">
		        <div class="well"> <p> TBD </p> </div>
                </div>
            </div>
{{ end }}

